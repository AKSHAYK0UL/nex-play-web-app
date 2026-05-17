// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SigninRes _$SigninResFromJson(Map<String, dynamic> json) => _SigninRes(
  success: json['success'] as bool,
  data: JwtRes.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SigninResToJson(_SigninRes instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};
