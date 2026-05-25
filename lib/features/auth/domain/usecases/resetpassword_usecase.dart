import 'package:fpdart/fpdart.dart';
import 'package:nex_play/core/errors/failures.dart';
import 'package:nex_play/core/usecases/base_usecase.dart';
import 'package:nex_play/features/auth/domain/entities/auth_tokens.dart';

import 'package:nex_play/features/auth/domain/repositories/auth_repository.dart';

class ResetpasswordUsecase implements Usecase<AuthTokens, ResetpasswordParams> {
  final AuthRepository _authRepository;

  ResetpasswordUsecase(this._authRepository);

  @override
  Future<Either<Failure, AuthTokens>> call(params) =>
      _authRepository.resetPassword(
        email: params.email,
        otp: params.otp,
        newPassword: params.newPassword,
      );
}

class ResetpasswordParams {
  final String email;
  final String otp;
  final String newPassword;

  ResetpasswordParams({
    required this.email,
    required this.otp,
    required this.newPassword,
  });
}
