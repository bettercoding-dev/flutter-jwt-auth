import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final Object? error;

  const ErrorView({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    final error = this.error;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Error',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          if (error is DioException) ...[
            Text('Status Code: ${error.response?.statusCode}'),
            Text(error.response?.statusMessage ?? '')
          ] else
            Text(error.toString())
        ],
      ),
    );
  }
}
