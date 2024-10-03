import 'package:flutter_jwt_auth/time/client/time_client.dart';
import 'package:flutter_jwt_auth/time/repository/api_time_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'time_repository.g.dart';

@riverpod
TimeRepository timeRepository(TimeRepositoryRef ref) =>
    ApiTimeRepository(ref.watch(timeClientProvider));

abstract interface class TimeRepository {
  Future<DateTime> getServerTime();
}
