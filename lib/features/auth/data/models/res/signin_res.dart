import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nex_play/features/auth/data/models/res/jwt_res.dart';

part 'signin_res.freezed.dart';
part 'signin_res.g.dart';

@freezed
abstract class SigninRes with _$SigninRes {
  const factory SigninRes({
    @JsonKey(name: "success") required bool success,
    @JsonKey(name: "data") required JwtRes data,
  }) = _SigninRes;

  factory SigninRes.fromJson(Map<String, dynamic> json) =>
      _$SigninResFromJson(json);
}
