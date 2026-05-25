import 'package:freezed_annotation/freezed_annotation.dart';
part 'forgotpassword_res.freezed.dart';
part 'forgotpassword_res.g.dart';
@freezed
abstract class ForgotpasswordRes with _$ForgotpasswordRes {
  const factory ForgotpasswordRes({
    @JsonKey(name: "success") required bool success,
    @JsonKey(name: "message") required String message,
  }) = _ForgotpasswordRes;

  factory ForgotpasswordRes.fromJson(Map<String, dynamic> json) =>
      _$ForgotpasswordResFromJson(json);
}
