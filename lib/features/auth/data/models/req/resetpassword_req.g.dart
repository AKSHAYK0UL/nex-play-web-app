// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resetpassword_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResetpasswordReq _$ResetpasswordReqFromJson(Map<String, dynamic> json) =>
    _ResetpasswordReq(
      email: json['email'] as String,
      otp: json['otp'] as String,
      newPassword: json['new_password'] as String,
    );

Map<String, dynamic> _$ResetpasswordReqToJson(_ResetpasswordReq instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
      'new_password': instance.newPassword,
    };
