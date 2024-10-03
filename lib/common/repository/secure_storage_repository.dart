import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_jwt_auth/common/repository/storage_repository.dart';

class SecureStorageRepository implements StorageRepository {
  static const String _keyToken = 'token';
  static const String _keyRefreshToken = 'refresh_token';

  final FlutterSecureStorage storage;

  const SecureStorageRepository({required this.storage});

  // Token
  @override
  Future<String?> getToken() => storage.read(key: _keyToken);

  @override
  Future<void> storeToken(String token) =>
      storage.write(key: _keyToken, value: token);

  @override
  Future<void> deleteToken() => storage.delete(key: _keyToken);

  // Refresh Token
  @override
  Future<String?> getRefreshToken() => storage.read(key: _keyRefreshToken);

  @override
  Future<void> storeRefreshToken(String token) =>
      storage.write(key: _keyRefreshToken, value: token);

  @override
  Future<void> deleteRefreshToken() => storage.delete(key: _keyRefreshToken);
}
