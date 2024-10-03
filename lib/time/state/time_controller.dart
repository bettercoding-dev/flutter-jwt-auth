import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_jwt_auth/time/repository/time_repository.dart';

part 'time_controller.g.dart';

@riverpod
class TimeController extends _$TimeController {
  @override
  Future<DateTime> build() {
    final repository = ref.watch(timeRepositoryProvider);
    return repository.getServerTime();
  }
}
