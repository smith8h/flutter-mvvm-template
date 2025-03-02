import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:dio/io.dart';
import '/core/constants/strings.dart';
import '/core/models/user.dart';
import '/core/utils/print_value.dart';
import '/core/constants/link_api.dart';
import '/core/utils/db_functions.dart';

Dio getDio() {
  final db = Hive.box(Strings.keyDb);

  Dio dio = Dio(
    BaseOptions(
      persistentConnection: true,
      baseUrl: LinkApi.baseUrl,
      receiveTimeout: Duration(seconds: 60),
      sendTimeout: Duration(seconds: 10),
      connectTimeout: Duration(seconds: 40),
      receiveDataWhenStatusError: true,
      headers: {'accept': '*/*', 'Content-Type': 'application/json-patch+json'},
    ),
  );

  (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
    // final security = SecurityContext.defaultContext;
    // security.allowLegacyUnsafeRenegotiation = false;
    HttpClient client = HttpClient(); // HttpClient(context: security);
    client.badCertificateCallback = (cert, host, port) => true;
    return client;
  };

  dio.interceptors.add(
    InterceptorsWrapper(
      // ? pre request logic
      onRequest: (options, handler) async {
        String? accessToken = db.get(Strings.keyAccessToken);
        if (accessToken != null) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }

        dprint('========== onRequest ==========');
        dprint(tag: 'Api URL', '${options.method} -> ${options.uri}');
        dprint(tag: 'Request Headers', '${options.headers}');
        dprint(tag: 'Request Body', options.data.toString());

        return handler.next(options);
      },

      // ? post request logic
      onResponse: (response, handler) {
        dprint('========== onRequestResponse ==========');
        dprint(tag: 'Api Response', '${response.data}');
        handler.next(response);
      },

      // ? error handling logic
      onError: (e, handler) async {
        dprint('========== onRequestError ==========');
        dprint(tag: 'Request StatusCode', '${e.response?.statusCode ?? 0}');
        dprint(tag: 'Request Error', e.response?.data ?? e.error);

        switch (e.response?.statusCode) {
          case 401:
            String newAccessToken = await refreshToken();
            e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
            var repeatedResponse = await dio.fetch(e.requestOptions);
            return handler.resolve(repeatedResponse);
          case 400:
            dprint("Invalid credentials, check email and password");
            break;
        }

        return handler.next(e);
      },
    ),
  );

  return dio;
}

Future<String> refreshToken() async {
  final db = Hive.box(Strings.keyDb);
  try {
    String? refreshToken = await db.get(Strings.keyRefreshToken);
    if (refreshToken == null) throw Exception("Refresh token not found.");

    var response = await getDio().post(LinkApi.refreshToken, data: {"refreshToken": refreshToken});
    var user = User.fromJson(response.data);

    saveUserTokens(accessToken: user.accessToken, refreshToken: user.refreshToken);
    dprint("Token Has been refreshed successfully...");
    return user.accessToken!;
  } catch (error) {
    if (error is DioException) {
      if (error.response?.statusCode == 401) {
        dprint("Error in refreshing token status code 401 logout application");
        // if (db.get(Strings.keyUser) != null) {
        //   controller.logout();
        // }
      }
    } else {
      dprint("Error refreshing token: $error");
    }

    rethrow;
  }
}
