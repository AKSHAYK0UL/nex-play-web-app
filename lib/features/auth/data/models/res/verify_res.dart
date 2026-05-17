import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nex_play/features/auth/data/models/res/jwt_res.dart';

part 'verify_res.freezed.dart';
part 'verify_res.g.dart';

@freezed
abstract class VerifyRes with _$VerifyRes {
  const factory VerifyRes({
    @JsonKey(name: "success") required bool success,
    @JsonKey(name: "data") required JwtRes data,
  }) = _VerifyRes;

  factory VerifyRes.fromJson(Map<String, dynamic> json) =>
      _$VerifyResFromJson(json);
}
