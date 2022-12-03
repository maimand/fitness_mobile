import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fitness_mobile/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioInterceptors extends InterceptorsWrapper {
  

  DioInterceptors();

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('accessToken');
    if (token != null && token.isNotEmpty) {
      options.headers.addAll({
        HttpHeaders.authorizationHeader: 'Bearer $token',
      });
    }

    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      Get.find<AuthService>().logout();
    }
    super.onError(err, handler);
  }
}
