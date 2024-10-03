import 'package:flutter_jwt_auth/time/repository/time_repository.dart';

class MockTimeRepository implements TimeRepository {
  @override
  Future<DateTime> getServerTime() async {
    // simulate api delay
    await Future.delayed(const Duration(milliseconds: 500));
    return DateTime.now();
  }
}
