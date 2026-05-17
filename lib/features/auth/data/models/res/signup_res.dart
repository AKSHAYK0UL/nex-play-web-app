import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_res.freezed.dart';
part 'signup_res.g.dart';

@freezed
abstract class SignupRes with _$SignupRes {
  const factory SignupRes({
    @JsonKey(name: "success") required bool success,
    @JsonKey(name: "message") required String message,
  }) = _SignupRes;

  factory SignupRes.fromJson(Map<String, dynamic> json) =>
      _$SignupResFromJson(json);
}
