import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_req.freezed.dart';
part 'signup_req.g.dart';

@freezed
abstract class SignUpReq with _$SignUpReq {
  const factory SignUpReq({
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "password") required String password,
  }) = _SignUpReq;

  factory SignUpReq.fromJson(Map<String, dynamic> json) =>
      _$SignUpReqFromJson(json);
}
