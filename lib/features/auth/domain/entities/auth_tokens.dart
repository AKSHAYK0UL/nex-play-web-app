import 'package:equatable/equatable.dart';

class AuthTokens extends Equatable {
  final String token;
  final String refreshToken;

  const AuthTokens({required this.token, required this.refreshToken});

  @override
  List<Object?> get props => [token, refreshToken];
}
