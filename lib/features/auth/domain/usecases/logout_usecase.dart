import 'package:fpdart/fpdart.dart';
import 'package:nex_play/core/errors/failures.dart';
import 'package:nex_play/core/usecases/base_usecase.dart';
import 'package:nex_play/features/auth/domain/repositories/auth_repository.dart';

class LogoutUsecase implements Usecase<void, NoParams> {
  final AuthRepository _repository;

  LogoutUsecase(this._repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) => _repository.logout();
}
