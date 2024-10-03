import 'package:flutter/material.dart';
import 'package:flutter_jwt_auth/auth/state/auth_controller.dart';
import 'package:flutter_jwt_auth/common/ui/error_view.dart';
import 'package:flutter_jwt_auth/common/ui/loading_view.dart';
import 'package:flutter_jwt_auth/time/state/time_controller.dart';
import 'package:flutter_jwt_auth/time/ui/login_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimePage extends ConsumerWidget {
  const TimePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authControllerProvider, (prev, state) {
      if (state.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Login error occurred'),
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('JWT Auth Tutorial'),
        actions: const [
          LoginButton(),
        ],
      ),
      body: const Column(
        children: [
          _AuthContent(),
          _TimeContent(),
        ],
      ),
    );
  }
}

class _AuthContent extends ConsumerWidget {
  const _AuthContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return authState.when(
      data: (authData) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            subtitle: const Text('Token'),
            title: Text(authData?.token ?? '–'),
          ),
          ListTile(
            subtitle: const Text('Refresh Token'),
            title: Text(authData?.refreshToken ?? '–'),
          ),
        ],
      ),
      error: (error, trace) => Center(
        child: Text(error.toString()),
      ),
      loading: () => const LoadingView(),
    );
  }
}

class _TimeContent extends ConsumerWidget {
  const _TimeContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthorized = ref.watch(authControllerProvider).valueOrNull != null;

    if (isAuthorized) {
      final timeState = ref.watch(timeControllerProvider);
      return timeState.when(
        data: (time) => Column(
          children: [
            ListTile(
              subtitle: const Text('Current Server Time'),
              title: Text(time.toString()),
            ),
            ElevatedButton(
              onPressed: () => ref.refresh(timeControllerProvider.future),
              child: const Text('Refresh'),
            ),
          ],
        ),
        error: (error, trace) => ErrorView(error: error),
        loading: () => const LoadingView(),
      );
    } else {
      return const Center(
        child: Text('Unauthorized'),
      );
    }
  }
}
