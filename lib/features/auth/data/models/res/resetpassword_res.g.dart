// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resetpassword_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResetpasswordRes _$ResetpasswordResFromJson(Map<String, dynamic> json) =>
    _ResetpasswordRes(
      success: json['success'] as bool,
      data: JwtRes.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResetpasswordResToJson(_ResetpasswordRes instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};
