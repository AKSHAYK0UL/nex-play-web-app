import 'package:dio/dio.dart';
import 'package:nex_play/core/errors/exceptions.dart';
import 'package:nex_play/core/utils/logger.dart';
import 'package:nex_play/features/auth/data/models/req/signin_req.dart';
import 'package:nex_play/features/auth/data/models/req/signup_req.dart';
import 'package:nex_play/features/auth/data/models/req/verify_req.dart';
import 'package:nex_play/features/auth/data/models/res/signin_res.dart';
import 'package:nex_play/features/auth/data/models/res/signup_res.dart';
import 'package:nex_play/features/auth/data/models/res/verify_res.dart';
import 'package:nex_play/features/auth/data/remote/auth_api_service.dart';

abstract interface class AuthRemoteDatasource {
  Future<SignupRes> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<VerifyRes> verify({required String email, required String otp});

  Future<SigninRes> signIn({required String email, required String password});
}

//Impl
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final AuthApiService _apiService;

  AuthRemoteDatasourceImpl(this._apiService);

  @override
  Future<SignupRes> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      AppLogger.info('Attempting SignUp for: $email');

      final response = await _apiService.signUp(
        SignUpReq(name: name, email: email, password: password),
      );

      AppLogger.info(response.message);

      return response;
    } on DioException catch (e) {
      AppLogger.error('SignUp failed', error: e);
      _handleDioError(e);
    }
  }

  @override
  Future<VerifyRes> verify({required String email, required String otp}) async {
    try {
      AppLogger.info('Attempting verify for: $email');

      final response = await _apiService.verify(
        VerifyReq(email: email, otp: otp),
      );

      AppLogger.info(response.success ? "Verify Success" : "Verify Failed");

      return response;
    } on DioException catch (e) {
      AppLogger.error('Verify failed', error: e);
      _handleDioError(e);
    }
  }

  @override
  Future<SigninRes> signIn({
    required String email,
    required String password,
  }) async {
    try {
      AppLogger.info('Attempting SignIn for: $email');

      final response = await _apiService.signIn(
        SigninReq(email: email, password: password),
      );

      AppLogger.info(response.success ? "SignIn Success" : "SignIn Failed");

      return response;
    } on DioException catch (e) {
      AppLogger.error('SignIn failed', error: e);

      _handleDioError(e);
    }
  }
}

Never _handleDioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionError:
      throw const NetworkException('No internet or connection timed out.');
    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;
      if (statusCode == 401 || statusCode == 403) {
        throw AuthException(
          e.response?.data?['message'] ?? 'Invalid credentials.',
        );
      }
      throw ServerException(
        e.response?.data?['message'] ?? 'Server error: $statusCode',
      );
    default:
      throw ServerException(e.message ?? 'An unexpected error occurred.');
  }
}
