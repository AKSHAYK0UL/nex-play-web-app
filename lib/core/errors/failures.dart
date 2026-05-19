abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure([super.message = 'Server failure.']);
}

class NetworkFailure extends Failure {
  NetworkFailure([super.message = 'Network failure.']);
}

class CacheFailure extends Failure {
  CacheFailure([super.message = 'Cache failure.']);
}

class AuthFailure extends Failure {
  AuthFailure([super.message = 'Authentication failure.']);
}

class ParseFailure extends Failure {
  ParseFailure([super.message = 'Failed to parse server response.']);
}

class ValidationFailure extends Failure {
  ValidationFailure([super.message = 'Validation failure.']);
}
