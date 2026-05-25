import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgotpassword_req.freezed.dart';
part 'forgotpassword_req.g.dart';

@freezed
abstract class ForgotPasswordReq with _$ForgotPasswordReq {
  const factory ForgotPasswordReq({
    @JsonKey(name: "email") required String email,
  }) = _ForgotPasswordReq;

  factory ForgotPasswordReq.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordReqFromJson(json);
}
