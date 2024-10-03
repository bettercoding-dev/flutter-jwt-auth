import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_jwt_auth/auth/state/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthInterceptor extends Interceptor {
  final Ref ref;
  final Dio dio;

  const AuthInterceptor(this.ref, this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final authData = await ref.read(authControllerProvider.future);
    final token = authData?.token;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final isRetry = err.requestOptions.extra['isRetry'] == true;

    // if response is unauthorized
    if (err.response?.statusCode == 401 && !isRetry) {
      try {
        final authData = await ref.read(authControllerProvider.future);
        final refreshToken = authData?.refreshToken;

        if (refreshToken != null) {
          await ref.read(authControllerProvider.notifier).refreshToken();

          final options = err.requestOptions;
          options.extra['isRetry'] = true;
          final response = await dio.fetch(options);

          handler.resolve(response);
        } else {
          super.onError(err, handler);
        }
      } on DioException catch (error, trace) {
        log('cannot refresh', error: error, stackTrace: trace);
        super.onError(error, handler);
      }
    } else {
      super.onError(err, handler);
    }
  }
}
