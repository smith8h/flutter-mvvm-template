// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:widgets/core/utils/device_utils.dart';
import 'package:widgets/widgets/snackbar.dart';

class Crud {
  static Future<dynamic> _request(
    String method,
    String url, {
    Object? body,
    Map<String, dynamic>? parameters,
    bool formData = false,
  }) async {
    final dio.Dio _dio = Get.find();
    if (await DeviceUtils.hasInternetConnection()) {
      try {
        final data = formData ? dio.FormData.fromMap(body as Map<String, dynamic>) : body;
        final response = await _dio.request(url, data: data, queryParameters: parameters, options: dio.Options(method: method));
        return response.data;
      } catch (_) {
        return null;
      }
    } else {
      appSnackbar(title: 'No Internet!', message: 'Please make sure you have an internet connection', contentType: ContentType.warning);
    }
  }

  static Future<dynamic> get(String url, {Object? body, Map<String, dynamic>? parameters}) =>
      _request('GET', url, body: body, parameters: parameters);

  static Future<dynamic> post(String url, {Object? body, Map<String, dynamic>? parameters, bool isFormData = false}) =>
      _request('POST', url, body: body, parameters: parameters, formData: isFormData);

  static Future<dynamic> put(String url, {Object? body, Map<String, dynamic>? parameters, bool isFormData = false}) =>
      _request('PUT', url, body: body, parameters: parameters, formData: isFormData);

  static Future<dynamic> patch(String url, {Object? body, Map<String, dynamic>? parameters}) =>
      _request('PATCH', url, body: body, parameters: parameters);

  static Future<dynamic> delete(String url, {Object? body, Map<String, dynamic>? parameters}) =>
      _request('DELETE', url, body: body, parameters: parameters);
}
