import 'package:freezed_annotation/freezed_annotation.dart';

part 'resent_otp_req.freezed.dart';
part 'resent_otp_req.g.dart';

@freezed
abstract class ResentOTPReq with _$ResentOTPReq {
  const factory ResentOTPReq({
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "purpose") required String purpose,
  }) = _ResentOTPReq;

  factory ResentOTPReq.fromJson(Map<String, dynamic> json) =>
      _$ResentOTPReqFromJson(json);
}
