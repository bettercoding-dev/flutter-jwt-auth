import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_data.freezed.dart';
part 'auth_data.g.dart';

@freezed
class AuthData with _$AuthData {
  const factory AuthData({
    required String token,
    required String refreshToken,
  }) = _AuthData;

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);
}
