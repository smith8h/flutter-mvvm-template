// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

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
        final data =
            formData
                ? dio.FormData.fromMap(
                  Map.fromEntries(
                    (body! as Map<String, dynamic>).entries.map((entry) {
                      if (entry.value is File) return MapEntry(entry.key, dio.MultipartFile.fromFileSync(entry.value.path));
                      if (entry.value is List) {
                        return MapEntry(
                          entry.key,
                          entry.value.map((item) {
                            if (item is File) return dio.MultipartFile.fromFileSync(item.path);
                            return item;
                          }).toList(),
                        );
                      }
                      return MapEntry(entry.key, entry.value);
                    }),
                  ),
                )
                : body;
        final response = await _dio.request(url, data: data, queryParameters: parameters, options: dio.Options(method: method));
        return response.data;
      } catch (_) {
        return null;
      }
    } else {
      appSnackbar(title: 'No Internet!', message: 'Please make sure you have an internet connection', contentType: ContentType.warning);
    }
  }

  static Future<dynamic> get(String url, {Object? body, Map<String, dynamic>? queryParameters}) =>
      _request('GET', url, body: body, parameters: queryParameters);

  static Future<dynamic> post(String url, {Object? body, Map<String, dynamic>? queryParameters, bool isFormData = false}) =>
      _request('POST', url, body: body, parameters: queryParameters, formData: isFormData);

  static Future<dynamic> put(String url, {Object? body, Map<String, dynamic>? queryParameters, bool isFormData = false}) =>
      _request('PUT', url, body: body, parameters: queryParameters, formData: isFormData);

  static Future<dynamic> patch(String url, {Object? body, Map<String, dynamic>? queryParameters, bool isFormData = false}) =>
      _request('PATCH', url, body: body, parameters: queryParameters, formData: isFormData);

  static Future<dynamic> delete(String url, {Object? body, Map<String, dynamic>? queryParameters}) =>
      _request('DELETE', url, body: body, parameters: queryParameters);
}
