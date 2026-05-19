import 'package:fpdart/fpdart.dart';
import 'package:nex_play/core/errors/failures.dart';
import 'package:nex_play/core/usecases/base_usecase.dart';
import 'package:nex_play/features/auth/domain/repositories/auth_repository.dart';

class SignupUsecase implements Usecase<String, SignInParams> {
  final AuthRepository _repository;

  SignupUsecase(this._repository);

  @override
  Future<Either<Failure, String>> call(SignInParams params) =>
      _repository.signUp(
        name: params.name,
        email: params.email,
        password: params.password,
      );
}

class SignInParams {
  final String name;
  final String email;
  final String password;

  SignInParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
