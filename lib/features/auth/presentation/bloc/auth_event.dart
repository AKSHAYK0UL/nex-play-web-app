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

  const factory AuthEvent.forgotPassword({required String email}) =
      _AuthForgotPassword;


  const factory AuthEvent.resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) = _AuthResetPassword;

  const factory AuthEvent.resentOTP({required String email,required String purpose}) =
      _AuthResentOTP;

  const factory AuthEvent.logout() = _AuthLogout;
}
