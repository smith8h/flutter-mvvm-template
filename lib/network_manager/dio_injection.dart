import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:widgets/core/constants/strings.dart';
import 'package:widgets/utils/print_value.dart';
import '../core/constants/link_api.dart';

Dio getDio() {
  final db = Hive.box(Strings.dbKey);

  Dio dio = Dio(
    BaseOptions(
      baseUrl: LinkApi.baseUrl,
      receiveTimeout: Duration(seconds: 60),
      sendTimeout: Duration(seconds: 10),
      connectTimeout: Duration(seconds: 40),
      receiveDataWhenStatusError: true,
      headers: {'accept': '*/*', 'Content-Type': 'application/json-patch+json'},
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      // ? pre request logic
      onRequest: (options, handler) async {
        String? accessToken = db.get(Strings.accessKey);
        if (accessToken != null) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }

        dprint(tag: 'Api URL', '${options.uri}');
        dprint(tag: 'Request Headers', '${options.headers}');
        dprint(tag: 'Request Body', '${options.data}');

        return handler.next(options);
      },

      // ? post request logic
      onResponse: (response, handler) {
        dprint(tag: 'Api Response', '${response.data}');
        handler.next(response);
      },

      // ? error handling logic
      onError: (e, handler) async {
        dprint(tag: 'Request StatusCode', '${e.response?.statusCode ?? 0}');
        dprint(tag: 'Request Error', e.response?.data ?? e.error);

        if (e.response?.statusCode == 401) {
          String newAccessToken = await refreshToken();
          e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
          var repeatedResponse = await dio.fetch(e.requestOptions);
          return handler.resolve(repeatedResponse);
        }
        
        return handler.next(e);
      },
    ),
  );

  return dio;
}

Future<String> refreshToken() async {
  final db = Hive.box(Strings.dbKey);
  try {
    String? refreshToken = await db.get(Strings.refreshKey);
    if (refreshToken == null) {
      throw Exception("Refresh token not found.");
    }

    var _ = await getDio().post(LinkApi.refreshToken, data: {"refreshToken": refreshToken});
    saveUserData(accessToken: "response.data['data']['token']", refreshToken: "response.data['data']['refreshToken']");
    dprint("Token Has been refreshed successfully...");
    // return response.data['data']['token'];
    return "";
  } catch (error) {
    if (error is DioException) {
      if (error.response?.statusCode == 401) {
        dprint("Error in refreshing token status code 401 logout application");
        // if (loginController.isLoggedIn) {
        //   loginController.logout();
        // }
      }
    } else {
      dprint("Error refreshing token: $error");
    }

    rethrow;
  }
}

Future saveUserData({String? accessToken, String? refreshToken}) async {
  final db = Hive.box(Strings.dbKey);
  try {
    await db.put(Strings.accessKey, accessToken);
    await db.put(Strings.refreshKey, refreshToken);
  } catch (e) {
    dprint('Error saving token: $e');
  }
}
