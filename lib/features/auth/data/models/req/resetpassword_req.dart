




import 'package:freezed_annotation/freezed_annotation.dart';


part 'resetpassword_req.freezed.dart';
part 'resetpassword_req.g.dart';
@freezed
abstract class ResetpasswordReq with _$ResetpasswordReq {
  const factory ResetpasswordReq({
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "otp") required String otp,
    @JsonKey(name: "new_password") required String newPassword,
  }) = _ResetpasswordReq;

  factory ResetpasswordReq.fromJson(Map<String, dynamic> json) =>
      _$ResetpasswordReqFromJson(json);
}
