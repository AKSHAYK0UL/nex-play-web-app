// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JwtRes _$JwtResFromJson(Map<String, dynamic> json) => _JwtRes(
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String,
  expiresIn: (json['expires_in'] as num).toInt(),
);

Map<String, dynamic> _$JwtResToJson(_JwtRes instance) => <String, dynamic>{
  'access_token': instance.accessToken,
  'refresh_token': instance.refreshToken,
  'expires_in': instance.expiresIn,
};
