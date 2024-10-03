import 'package:dio/dio.dart';
import 'package:flutter_jwt_auth/auth/interceptor/auth_interceptor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'global_providers.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:8080',
      contentType: Headers.jsonContentType,
    ),
  );

  dio.interceptors.add(PrettyDioLogger());
  dio.interceptors.add(AuthInterceptor(ref, dio));

  return dio;
}

@riverpod
FlutterSecureStorage flutterSecureStorage(FlutterSecureStorageRef ref) =>
    const FlutterSecureStorage();
