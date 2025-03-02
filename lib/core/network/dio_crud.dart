import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:widgets/core/utils/device_utils.dart';
import 'package:widgets/widgets/snackbar.dart';

class Crud {
  final dio.Dio _dio = Get.find();

  Future<dynamic> _request(
    String method,
    String url, {
    Object? body,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    if (await DeviceUtils.hasInternetConnection()) {
      try {
        final data = isFormData ? dio.FormData.fromMap(body as Map<String, dynamic>) : body;
        final response = await _dio.request(url, data: data, queryParameters: queryParameters, options: dio.Options(method: method));
        return response.data;
      } catch (_) {
        return null;
      }
    } else {
      appSnackbar(title: 'No Internet!', message: 'Please make sure you have an internet connection', contentType: ContentType.warning);
    }
  }

  Future<dynamic> get(String url, {Object? body, Map<String, dynamic>? queryParameters}) =>
      _request('GET', url, body: body, queryParameters: queryParameters);

  Future<dynamic> post(String url, {Object? body, Map<String, dynamic>? queryParameters, bool isFormData = false}) =>
      _request('POST', url, body: body, queryParameters: queryParameters, isFormData: isFormData);

  Future<dynamic> put(String url, {Object? body, Map<String, dynamic>? queryParameters, bool isFormData = false}) =>
      _request('PUT', url, body: body, queryParameters: queryParameters, isFormData: isFormData);

  Future<dynamic> patch(String url, {Object? body, Map<String, dynamic>? queryParameters}) =>
      _request('PATCH', url, body: body, queryParameters: queryParameters);

  Future<dynamic> delete(String url, {Object? body, Map<String, dynamic>? queryParameters}) =>
      _request('DELETE', url, body: body, queryParameters: queryParameters);
}
