import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nex_play/features/auth/domain/usecases/forgotpassword_usecase.dart';
import 'package:nex_play/features/auth/domain/usecases/logout_usecase.dart';
import 'package:nex_play/features/auth/domain/usecases/resetpassword_usecase.dart';
import 'package:nex_play/features/auth/domain/usecases/signin_usecase.dart';
import 'package:nex_play/features/auth/domain/usecases/signup_usecase.dart';
import 'package:nex_play/features/auth/domain/usecases/verify_usecase.dart';
import 'package:nex_play/features/auth/presentation/bloc/auth_event.dart';
import 'package:nex_play/features/auth/presentation/bloc/auth_state.dart';
import 'package:nex_play/core/usecases/base_usecase.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignupUsecase _signUpUseCase;
  final VerifyUsecase _verifyOtpUseCase;
  final SigninUsecase _signInUseCase;
  final LogoutUsecase _logoutUseCase;
  final ForgotpasswordUsecase _forgotpasswordUsecase;
  final ResetpasswordUsecase _resetpasswordUsecase;

  AuthBloc({
    required SignupUsecase signUpUseCase,
    required VerifyUsecase verifyOtpUseCase,
    required SigninUsecase signInUseCase,
    required LogoutUsecase logoutUseCase,
    required ForgotpasswordUsecase forgotpasswordUsecase,
    required ResetpasswordUsecase resetpasswordUsecase,
  }) : _signUpUseCase = signUpUseCase,
       _verifyOtpUseCase = verifyOtpUseCase,
       _signInUseCase = signInUseCase,
       _logoutUseCase = logoutUseCase,
       _forgotpasswordUsecase = forgotpasswordUsecase,
       _resetpasswordUsecase = resetpasswordUsecase,
       super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        signUp: (name, email, password) =>
            _signUpEvent(name, email, password, emit),
        verify: (email, otp) => _verifyEvent(email, otp, emit),
        signIn: (email, password) => _signInEvent(email, password, emit),
        forgotPassword: (email) =>_forgotPasswordEvent(email, emit),
        resetPassword: (email, otp, newPassword) => _resetPasswordEvent(email, otp, newPassword, emit),
        logout: () => _logoutEvent(emit),
      );
    });
  }

  Future<void> _signUpEvent(
    String name,
    String email,
    String password,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _signUpUseCase(
      SignInParams(name: name, email: email, password: password),
    );
    result.fold(
      (failure) {
        emit(AuthState.error(error: failure.message));
      },
      (success) {
        emit(AuthState.verify(email: email));
      },
    );
  }

  Future<void> _verifyEvent(
    String email,
    String otp,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _verifyOtpUseCase(
      VerifyParams(email: email, otp: otp),
    );
    result.fold(
      (failure) {
        emit(AuthState.error(error: failure.message));
      },
      (success) {
        emit(AuthState.success());
      },
    );
  }

  Future<void> _signInEvent(
    String email,
    String password,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _signInUseCase(
      SigninParams(email: email, password: password),
    );
    result.fold(
      (failure) {
        emit(AuthState.error(error: failure.message));
      },
      (success) {
        emit(AuthState.success());
      },
    );
  }

  Future<void> _forgotPasswordEvent(
    String email,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _forgotpasswordUsecase(
      ForgotPasswordParams(email: email),
    );
    result.fold(
      (failure) {
        emit(AuthState.error(error: failure.message));
      },
      (success) {
        emit(AuthState.verify(email: email));
      },
    );
  }

  Future<void> _resetPasswordEvent(
    String email,
    String otp,
    String newPassword,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _resetpasswordUsecase(
      ResetpasswordParams(email: email, otp: otp, newPassword: newPassword),
    );
    result.fold(
      (failure) {
        emit(AuthState.error(error: failure.message));
      },
      (success) {
        emit(AuthState.success());
      },
    );
  }

  Future<void> _logoutEvent(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await _logoutUseCase(const NoParams());
    result.fold(
      (failure) => emit(AuthState.error(error: failure.message)),
      (_) => emit(const AuthState.loggedOut()),
    );
  }
}
