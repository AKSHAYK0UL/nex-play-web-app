import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_req.freezed.dart';
part 'signin_req.g.dart';

@freezed
abstract class SigninReq with _$SigninReq {
  const factory SigninReq({
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "password") required String password,
  }) = _SigninReq;

  factory SigninReq.fromJson(Map<String, dynamic> json) =>
      _$SigninReqFromJson(json);
}
