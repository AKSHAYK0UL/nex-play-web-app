import 'package:fpdart/src/either.dart';
import 'package:nex_play/core/errors/failures.dart';
import 'package:nex_play/core/usecases/base_usecase.dart';
import 'package:nex_play/features/auth/domain/entities/auth_tokens.dart';
import 'package:nex_play/features/auth/domain/repositories/auth_repository.dart';

class SigninUsecase implements Usecase<AuthTokens, SigninParams> {
  final AuthRepository _repository;

  SigninUsecase(this._repository);
  @override
  Future<Either<Failure, AuthTokens>> call(SigninParams params) =>
      _repository.signIn(email: params.email, password: params.password);
}

class SigninParams {
  final String email;
  final String password;

  SigninParams({required this.email, required this.password});
}
