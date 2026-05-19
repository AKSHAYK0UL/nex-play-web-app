import 'package:fpdart/fpdart.dart';
import 'package:nex_play/core/errors/failures.dart';
import 'package:nex_play/core/usecases/base_usecase.dart';
import 'package:nex_play/features/auth/domain/entities/auth_tokens.dart';
import 'package:nex_play/features/auth/domain/repositories/auth_repository.dart';

class VerifyUsecase implements Usecase<AuthTokens, VerifyParams> {
  final AuthRepository _repository;

  VerifyUsecase(this._repository);

  @override
  Future<Either<Failure, AuthTokens>> call(VerifyParams params) =>
      _repository.verify(email: params.email, otp: params.otp);
}

class VerifyParams {
  final String email;
  final String otp;

  VerifyParams({required this.email, required this.otp});
}
