import 'package:flutter_jwt_auth/auth/model/auth_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  Future<AuthData?> build() async {
    // TODO: load tokens from storage
    return null;
  }

  Future<void> login(String username) async {
    // TODO: implement login
  }

  Future<void> refreshToken() async {
    // TODO: implement refresh token
  }

  Future<void> logout() async {
    // TODO: implement logout
  }
}
