// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignUpReq _$SignUpReqFromJson(Map<String, dynamic> json) => _SignUpReq(
  name: json['name'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$SignUpReqToJson(_SignUpReq instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
