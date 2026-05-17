abstract class Failures {
  final String message;
  Failures(this.message);
}

class ServerFailures extends Failures {
  ServerFailures([super.message = 'Server failure.']);
}

class NetworkFailures extends Failures {
  NetworkFailures([super.message = 'Network failure.']);
}

class CacheFailures extends Failures {
  CacheFailures([super.message = 'Cache failure.']);
}

class AuthFailures extends Failures {
  AuthFailures([super.message = 'Authentication failure.']);
}

class ParseFailures extends Failures {
  ParseFailures([super.message = 'Failed to parse server response.']);
}

class ValidationFailures extends Failures {
  ValidationFailures([super.message = 'Validation failure.']);
}
