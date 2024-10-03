// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimeResponse _$TimeResponseFromJson(Map<String, dynamic> json) {
  return _TimeResponse.fromJson(json);
}

/// @nodoc
mixin _$TimeResponse {
  DateTime get time => throw _privateConstructorUsedError;

  /// Serializes this TimeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeResponseCopyWith<TimeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeResponseCopyWith<$Res> {
  factory $TimeResponseCopyWith(
          TimeResponse value, $Res Function(TimeResponse) then) =
      _$TimeResponseCopyWithImpl<$Res, TimeResponse>;
  @useResult
  $Res call({DateTime time});
}

/// @nodoc
class _$TimeResponseCopyWithImpl<$Res, $Val extends TimeResponse>
    implements $TimeResponseCopyWith<$Res> {
  _$TimeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeResponseImplCopyWith<$Res>
    implements $TimeResponseCopyWith<$Res> {
  factory _$$TimeResponseImplCopyWith(
          _$TimeResponseImpl value, $Res Function(_$TimeResponseImpl) then) =
      __$$TimeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime time});
}

/// @nodoc
class __$$TimeResponseImplCopyWithImpl<$Res>
    extends _$TimeResponseCopyWithImpl<$Res, _$TimeResponseImpl>
    implements _$$TimeResponseImplCopyWith<$Res> {
  __$$TimeResponseImplCopyWithImpl(
      _$TimeResponseImpl _value, $Res Function(_$TimeResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
  }) {
    return _then(_$TimeResponseImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeResponseImpl with DiagnosticableTreeMixin implements _TimeResponse {
  const _$TimeResponseImpl({required this.time});

  factory _$TimeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeResponseImplFromJson(json);

  @override
  final DateTime time;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimeResponse(time: $time)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimeResponse'))
      ..add(DiagnosticsProperty('time', time));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeResponseImpl &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, time);

  /// Create a copy of TimeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeResponseImplCopyWith<_$TimeResponseImpl> get copyWith =>
      __$$TimeResponseImplCopyWithImpl<_$TimeResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeResponseImplToJson(
      this,
    );
  }
}

abstract class _TimeResponse implements TimeResponse {
  const factory _TimeResponse({required final DateTime time}) =
      _$TimeResponseImpl;

  factory _TimeResponse.fromJson(Map<String, dynamic> json) =
      _$TimeResponseImpl.fromJson;

  @override
  DateTime get time;

  /// Create a copy of TimeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeResponseImplCopyWith<_$TimeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
