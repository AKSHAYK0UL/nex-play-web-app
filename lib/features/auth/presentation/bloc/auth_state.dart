import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nex_play/features/auth/domain/entities/auth_tokens.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _AuthInitial;
  const factory AuthState.loading() = _AuthLoading;
  const factory AuthState.verify() = _AuthVerify;
  const factory AuthState.success({required AuthTokens tokens}) = _AuthSuccess;
  const factory AuthState.error({required String error}) = _AuthError;
}
