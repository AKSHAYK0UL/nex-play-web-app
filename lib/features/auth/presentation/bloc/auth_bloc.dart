import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nex_play/features/auth/domain/usecases/signup_usecase.dart';
import 'package:nex_play/features/auth/domain/usecases/verify_usecase.dart';

import 'package:nex_play/features/auth/presentation/bloc/auth_event.dart';
import 'package:nex_play/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignupUsecase _signUpUseCase;
  final VerifyUsecase _verifyOtpUseCase;
  final VerifyUsecase _signInUseCase;

  AuthBloc({
    required SignupUsecase signUpUseCase,
    required VerifyUsecase verifyOtpUseCase,
    required VerifyUsecase signInUseCase,
  }) : _signUpUseCase = signUpUseCase,
       _verifyOtpUseCase = verifyOtpUseCase,
       _signInUseCase = signInUseCase,
       super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        signUp: (name, email, password) =>
            _signUpEvent(name, email, password, emit),
        verify: (email, otp) => _verifyEvent(email, otp, emit),
        signIn: (email, password) => _signInEvent(email, password, emit),
      );
    });
  }

  _signUpEvent(
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

  _verifyEvent(String email, String otp, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await _verifyOtpUseCase(
      VerifyParams(email: email, otp: otp),
    );
    result.fold(
      (failure) {
        emit(AuthState.error(error: failure.message));
      },
      (success) {
        emit(AuthState.success(tokens: success));
      },
    );
  }

  _signInEvent(String email, String password, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await _signInUseCase(
      VerifyParams(email: email, otp: password),
    );
    result.fold(
      (failure) {
        emit(AuthState.error(error: failure.message));
      },
      (success) {
        emit(AuthState.success(tokens: success));
      },
    );
  }
}
