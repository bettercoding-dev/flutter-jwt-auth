import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_jwt_auth/auth/state/auth_controller.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({super.key});

  _login(WidgetRef ref) {
    ref.read(authControllerProvider.notifier).login('MyUsername');
  }

  _logout(WidgetRef ref) {
    ref.read(authControllerProvider.notifier).logout();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    final isAuthenticated = authState.valueOrNull != null;

    return TextButton(
      onPressed: () => isAuthenticated ? _logout(ref) : _login(ref),
      child: Text(
        isAuthenticated ? 'Log out' : 'Log in',
      ),
    );
  }
}
