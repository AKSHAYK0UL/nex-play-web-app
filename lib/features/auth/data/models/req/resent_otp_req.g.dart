// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resent_otp_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResentOTPReq _$ResentOTPReqFromJson(Map<String, dynamic> json) =>
    _ResentOTPReq(
      email: json['email'] as String,
      purpose: json['purpose'] as String,
    );

Map<String, dynamic> _$ResentOTPReqToJson(_ResentOTPReq instance) =>
    <String, dynamic>{'email': instance.email, 'purpose': instance.purpose};
