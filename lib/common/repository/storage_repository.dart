import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_jwt_auth/common/repository/secure_storage_repository.dart';
import 'package:flutter_jwt_auth/global_providers.dart';

part 'storage_repository.g.dart';

@riverpod
StorageRepository storageRepository(StorageRepositoryRef ref) =>
    SecureStorageRepository(
      storage: ref.watch(flutterSecureStorageProvider),
    );

abstract interface class StorageRepository {
  Future<void> storeToken(String token);

  Future<void> storeRefreshToken(String token);

  Future<String?> getToken();

  Future<String?> getRefreshToken();

  Future<void> deleteToken();

  Future<void> deleteRefreshToken();
}
