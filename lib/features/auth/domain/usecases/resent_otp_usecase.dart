import 'package:fpdart/fpdart.dart';
import 'package:nex_play/core/errors/failures.dart';
import 'package:nex_play/core/usecases/base_usecase.dart';
import 'package:nex_play/features/auth/domain/repositories/auth_repository.dart';

class ResentOtpUsecase implements Usecase<String, ResentOTPParams> {
  final AuthRepository _authRepository;

  ResentOtpUsecase(this._authRepository);

  @override
  Future<Either<Failure, String>> call(ResentOTPParams params) =>
      _authRepository.resentOTP(email: params.email, purpose: params.purpose);
}

class ResentOTPParams {
  final String email;
  final String purpose;

  ResentOTPParams({required this.email, required this.purpose});
}
