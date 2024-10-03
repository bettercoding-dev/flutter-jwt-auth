import 'package:dio/dio.dart';
import 'package:flutter_jwt_auth/auth/model/auth_data.dart';
import 'package:flutter_jwt_auth/auth/repository/auth_repository.dart';
import 'package:flutter_jwt_auth/common/repository/storage_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  Future<AuthData?> build() async {
    final storageRepository = ref.watch(storageRepositoryProvider);

    final token = await storageRepository.getToken();
    final refreshToken = await storageRepository.getRefreshToken();

    if (token != null && refreshToken != null) {
      return AuthData(token: token, refreshToken: refreshToken);
    } else {
      return null;
    }
  }

  Future<void> login(String username) async {
    final authRepository = ref.read(authRepositoryProvider);
    final storageRepository = ref.read(storageRepositoryProvider);

    state = await AsyncValue.guard(() async {
      final authData = await authRepository.login(username);
      await storageRepository.storeToken(authData.token);
      await storageRepository.storeRefreshToken(authData.refreshToken);
      return authData;
    });
  }

  Future<void> refreshToken() async {
    final authRepository = ref.read(authRepositoryProvider);
    final storageRepository = ref.read(storageRepositoryProvider);
    final authData = state.valueOrNull;
    if (authData != null) {
      try {
        final newTokens =
            await authRepository.refreshToken(authData.refreshToken);
        storageRepository.storeToken(newTokens.token);
        storageRepository.storeRefreshToken(newTokens.refreshToken);
        state = AsyncData(newTokens);
      } on DioException {
        await logout();
        rethrow;
      }
    }
  }

  Future<void> logout() async {
    state = await AsyncValue.guard(() async {
      final storageRepository = ref.read(storageRepositoryProvider);
      await storageRepository.deleteToken();
      await storageRepository.deleteRefreshToken();
      return null;
    });
  }
}
