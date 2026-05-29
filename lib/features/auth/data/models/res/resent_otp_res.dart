import 'package:freezed_annotation/freezed_annotation.dart';

part 'resent_otp_res.freezed.dart';
part 'resent_otp_res.g.dart';

@freezed
abstract class ResentOTPRes with _$ResentOTPRes {
  const factory ResentOTPRes({
    @JsonKey(name: "success") required bool success,
    @JsonKey(name: "message") required String message,
  }) = RresentOTPRes;

  factory ResentOTPRes.fromJson(Map<String, dynamic> json) =>
      _$ResentOTPResFromJson(json);
}
