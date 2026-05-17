import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_req.freezed.dart';
part 'verify_req.g.dart';

@freezed
abstract class VerifyReq with _$VerifyReq {
  const factory VerifyReq({
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "otp") required String otp,
  }) = _VerifyReq;

  factory VerifyReq.fromJson(Map<String, dynamic> json) =>
      _$VerifyReqFromJson(json);
}
