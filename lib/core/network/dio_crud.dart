import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import '/core/constants/strings.dart';

class Crud {
  final db = Hive.box(Strings.keyDb);
  final dio.Dio _dio = Get.find();

  Future<dynamic> get(String url, {Object? body, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(url, data: body, queryParameters: queryParameters);
      return response.data;
    } catch (_) {
      return null;
    }
  }

  Future<dynamic> post(String url, {Object? body, Map<String, String>? queryParameters, bool isFormData = false}) async {
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
  }

  Future<dynamic> put(String url, {Object? body, Map<String, String>? queryParameters, bool isFormData = false}) async {
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
  }

  Future<dynamic> patch(String url, {Object? body, Map<String, String>? queryParameters}) async {
    try {
      final response = await _dio.patch(url, queryParameters: queryParameters, data: body);
      return response.data;
    } catch (_) {
      return null;
    }
  }

  Future<dynamic> delete(String url, {Object? body, Map<String, String>? queryParameters}) async {
    try {
      final response = await _dio.delete(url, queryParameters: queryParameters, data: body);
      return response.data;
    } catch (_) {
      return null;
    }
  }
}
