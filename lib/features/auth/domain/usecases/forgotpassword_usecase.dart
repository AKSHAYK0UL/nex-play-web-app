

import 'package:fpdart/fpdart.dart';
import 'package:nex_play/core/errors/failures.dart';
import 'package:nex_play/core/usecases/base_usecase.dart';
import 'package:nex_play/features/auth/domain/repositories/auth_repository.dart';

class ForgotpasswordUsecase implements Usecase<String, ForgotPasswordParams> {

  final AuthRepository _authRepository;

  ForgotpasswordUsecase(this._authRepository) ;
  @override
  Future<Either<Failure, String>> call(params) => _authRepository.forgotPassword(email: params.email);
}

class ForgotPasswordParams {
  final String email;

  ForgotPasswordParams({required this.email});
}