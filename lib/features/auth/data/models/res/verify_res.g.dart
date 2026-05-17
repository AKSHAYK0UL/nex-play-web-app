// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyRes _$VerifyResFromJson(Map<String, dynamic> json) => _VerifyRes(
  success: json['success'] as bool,
  data: JwtRes.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VerifyResToJson(_VerifyRes instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};
