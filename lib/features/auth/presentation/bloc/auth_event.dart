import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signUp({
    required String name,
    required String email,
    required String password,
  }) = _AuthSignUp;
  const factory AuthEvent.verify({required String email, required String otp}) =
      _AuthVerify;
  const factory AuthEvent.signIn({
    required String email,
    required String password,
  }) = _AuthSignIn;
}
