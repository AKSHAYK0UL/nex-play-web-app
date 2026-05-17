import 'package:freezed_annotation/freezed_annotation.dart';

part 'jwt_res.freezed.dart';
part 'jwt_res.g.dart';

@freezed
abstract class JwtRes with _$JwtRes {
  const factory JwtRes({
    @JsonKey(name: "access_token") required String accessToken,
    @JsonKey(name: "refresh_token") required String refreshToken,
    @JsonKey(name: "expires_in") required int expiresIn,
  }) = _JwtRes;

  factory JwtRes.fromJson(Map<String, dynamic> json) => _$JwtResFromJson(json);
}
