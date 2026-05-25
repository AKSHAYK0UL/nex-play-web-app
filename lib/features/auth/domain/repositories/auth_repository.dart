import 'package:fpdart/fpdart.dart';
import 'package:nex_play/core/errors/failures.dart';
import 'package:nex_play/features/auth/domain/entities/auth_tokens.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthTokens>> verify({
    required String email,
    required String otp,
  });

  Future<Either<Failure, AuthTokens>> signIn({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> forgotPassword({required String email});

  Future<Either<Failure, AuthTokens>> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  });

  Future<Either<Failure, void>> logout();
}
