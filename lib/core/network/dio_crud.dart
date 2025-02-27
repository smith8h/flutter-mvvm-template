import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:widgets/core/utils/device_utils.dart';
import 'package:widgets/core/utils/snackbar.dart';

class Crud {
  final dio.Dio _dio = Get.find();

  Future<dynamic> get(String url, {Object? body, Map<String, dynamic>? queryParameters}) async {
    if (await DeviceUtils.hasInternetConnection()) {
      try {
        final response = await _dio.get(url, data: body, queryParameters: queryParameters);
        return response.data;
      } catch (_) {
        return null;
      }
    } else {
      appSnackbar(title: 'No Internet!', message: 'Please make sure you have a internet connection', contentType: ContentType.warning);
    }
  }

  Future<dynamic> post(String url, {Object? body, Map<String, String>? queryParameters, bool isFormData = false}) async {
    if (await DeviceUtils.hasInternetConnection()) {
      if (isFormData) {
        final formData = dio.FormData.fromMap(body as Map<String, dynamic>);
        return await _dio.post(url, data: formData, queryParameters: queryParameters);
      }
      try {
        final response = await _dio.post(url, data: body, queryParameters: queryParameters);
        return response.data;
      } catch (_) {
        return null;
      }
    } else {
      appSnackbar(title: 'No Internet!', message: 'Please make sure you have a internet connection', contentType: ContentType.warning);
    }
  }

  Future<dynamic> put(String url, {Object? body, Map<String, String>? queryParameters, bool isFormData = false}) async {
    if (await DeviceUtils.hasInternetConnection()) {
      if (isFormData) {
        final formData = dio.FormData.fromMap(body as Map<String, dynamic>);
        return await _dio.post(url, data: formData, queryParameters: queryParameters);
      }
      try {
        final response = await _dio.put(url, data: body, queryParameters: queryParameters);
        return response.data;
      } catch (_) {
        return null;
      }
    } else {
      appSnackbar(title: 'No Internet!', message: 'Please make sure you have a internet connection', contentType: ContentType.warning);
    }
  }

  Future<dynamic> patch(String url, {Object? body, Map<String, String>? queryParameters}) async {
    if (await DeviceUtils.hasInternetConnection()) {
      try {
        final response = await _dio.patch(url, queryParameters: queryParameters, data: body);
        return response.data;
      } catch (_) {
        return null;
      }
    } else {
      appSnackbar(title: 'No Internet!', message: 'Please make sure you have a internet connection', contentType: ContentType.warning);
    }
  }

  Future<dynamic> delete(String url, {Object? body, Map<String, String>? queryParameters}) async {
    if (await DeviceUtils.hasInternetConnection()) {
      try {
        final response = await _dio.delete(url, queryParameters: queryParameters, data: body);
        return response.data;
      } catch (_) {
        return null;
      }
    } else {
      appSnackbar(title: 'No Internet!', message: 'Please make sure you have a internet connection', contentType: ContentType.warning);
    }
  }
}
