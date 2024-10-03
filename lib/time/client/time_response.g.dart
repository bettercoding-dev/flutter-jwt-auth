// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimeResponseImpl _$$TimeResponseImplFromJson(Map<String, dynamic> json) =>
    _$TimeResponseImpl(
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$$TimeResponseImplToJson(_$TimeResponseImpl instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
    };
