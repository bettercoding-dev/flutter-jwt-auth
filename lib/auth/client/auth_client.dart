import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_jwt_auth/auth/client/login_request.dart';
import 'package:flutter_jwt_auth/auth/client/refresh_token_request.dart';
import 'package:flutter_jwt_auth/auth/model/auth_data.dart';
import 'package:flutter_jwt_auth/global_providers.dart';

part 'auth_client.g.dart';

@riverpod
AuthClient authClient(AuthClientRef ref) => AuthClient(
      ref.watch(dioProvider),
    );

@RestApi()
abstract class AuthClient {
  factory AuthClient(Dio dio) = _AuthClient;

  @POST('/login')
  Future<AuthData> login(@Body() LoginRequest request);

  @POST('/refresh')
  Future<AuthData> refresh(@Body() RefreshTokenRequest request);
}
