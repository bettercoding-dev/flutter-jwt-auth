import 'package:flutter_jwt_auth/auth/client/auth_client.dart';
import 'package:flutter_jwt_auth/auth/client/login_request.dart';
import 'package:flutter_jwt_auth/auth/client/refresh_token_request.dart';
import 'package:flutter_jwt_auth/auth/model/auth_data.dart';
import 'package:flutter_jwt_auth/auth/repository/auth_repository.dart';

class ApiAuthRepository implements AuthRepository {
  final AuthClient authClient;

  const ApiAuthRepository(this.authClient);

  @override
  Future<AuthData> login(String username) {
    final request = LoginRequest(username: username);
    return authClient.login(request);
  }

  @override
  Future<AuthData> refreshToken(String token) {
    final request = RefreshTokenRequest(token: token);
    return authClient.refresh(request);
  }
}
