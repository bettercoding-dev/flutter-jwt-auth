import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_jwt_auth/auth/client/auth_client.dart';
import 'package:flutter_jwt_auth/auth/model/auth_data.dart';
import 'package:flutter_jwt_auth/auth/repository/api_auth_repository.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) => ApiAuthRepository(
      ref.watch(authClientProvider),
    );

abstract interface class AuthRepository {
  Future<AuthData> login(String username);

  Future<AuthData> refreshToken(String token);
}
