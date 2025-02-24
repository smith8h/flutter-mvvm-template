import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import '../core/constants/strings.dart';
import 'dio_injection.dart';

class Crud {
  final db = Hive.box(Strings.dbKey);
  final Dio _dio = getDio();

  Future<dynamic> get(String url, {String? token, Object? body, Map<String, dynamic>? queryParameters}) async {
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
    try {
      final response = await _dio.get(url, queryParameters: queryParameters);
      return response.data;
    } catch (_) {
      return null;
    }
  }

  Future<dynamic> post(String url, {String? token, Object? body, Map<String, String>? queryParameters}) async {
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
    try {
      final response = await _dio.post(url, queryParameters: queryParameters, data: body);
      return response.data;
    } catch (_) {
      return null;
    }
  }

  Future<dynamic> put(String url, {String? token, Object? body, Map<String, String>? queryParameters}) async {
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
    try {
      final response = await _dio.put(url, queryParameters: queryParameters, data: body);
      return response.data;
    } catch (_) {
      return null;
    }
  }

  Future<dynamic> patch(String url, {String? token, Object? body, Map<String, String>? queryParameters}) async {
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
    try {
      final response = await _dio.patch(url, queryParameters: queryParameters, data: body);
      return response.data;
    } catch (_) {
      return null;
    }
  }

  Future<dynamic> delete(String url, {String? token, Object? body, Map<String, String>? queryParameters}) async {
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
    try {
      final response = await _dio.delete(url, queryParameters: queryParameters, data: body);
      return response.data;
    } catch (_) {
      return null;
    }
  }
}
