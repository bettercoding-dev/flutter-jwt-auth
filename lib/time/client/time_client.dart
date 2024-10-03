import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_jwt_auth/global_providers.dart';
import 'package:flutter_jwt_auth/time/client/time_response.dart';

part 'time_client.g.dart';

@riverpod
TimeClient timeClient(TimeClientRef ref) => TimeClient(
      ref.watch(dioProvider),
    );

@RestApi()
abstract class TimeClient {
  factory TimeClient(Dio dio) = _TimeClient;

  @GET('/time')
  Future<TimeResponse> getServerTime();
}
