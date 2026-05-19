import 'package:fpdart/fpdart.dart';
import 'package:nex_play/core/errors/failures.dart';

// ignore: avoid_types_as_parameter_names
abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {
  const NoParams();
}
