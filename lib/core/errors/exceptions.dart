//The Data layer (datasources) catches raw Dart/Dio exceptions and re-throws these custom exceptions

class ServerException implements Exception {
  final String message;
  const ServerException([this.message = 'Server error.']);
}

class CacheException implements Exception {
  final String message;
  const CacheException([this.message = 'Cache error.']);
}

class NetworkException implements Exception {
  final String message;
  const NetworkException([this.message = 'Network error.']);
}

class AuthException implements Exception {
  final String message;
  const AuthException([this.message = 'Authentication error.']);
}
