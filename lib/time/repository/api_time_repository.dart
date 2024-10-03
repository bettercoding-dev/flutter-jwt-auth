import 'package:dio/dio.dart';
import 'package:flutter_jwt_auth/time/client/time_client.dart';
import 'package:flutter_jwt_auth/time/repository/time_repository.dart';

class ApiTimeRepository implements TimeRepository {
  final TimeClient timeClient;

  const ApiTimeRepository(this.timeClient);

  @override
  Future<DateTime> getServerTime() async {
    try {
      final response = await timeClient.getServerTime();
      return response.time;
    } on DioException {
      rethrow;
    }
  }
}
