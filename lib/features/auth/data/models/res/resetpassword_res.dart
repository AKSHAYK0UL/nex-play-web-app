import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nex_play/features/auth/data/models/res/jwt_res.dart';

part 'resetpassword_res.freezed.dart';
part 'resetpassword_res.g.dart';


@freezed
abstract class ResetpasswordRes with _$ResetpasswordRes {
  const factory ResetpasswordRes({
    @JsonKey(name: "success") required bool success,
    @JsonKey(name: "data") required JwtRes data,
  }) = _ResetpasswordRes;

  factory ResetpasswordRes.fromJson(Map<String, dynamic> json) =>
      _$ResetpasswordResFromJson(json);
}