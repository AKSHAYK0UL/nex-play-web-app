//This class implements the AuthRepository interface defined in
// the Domain layer. It's the bridge between Domain and Data.

import 'package:fpdart/fpdart.dart';
import 'package:nex_play/core/errors/exceptions.dart';
import 'package:nex_play/core/errors/failures.dart';
import 'package:nex_play/features/auth/data/local/auth_local_datasource.dart';
import 'package:nex_play/features/auth/data/remote/auth_remote_datasource.dart';
import 'package:nex_play/features/auth/domain/entities/auth_tokens.dart';
import 'package:nex_play/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remoteDataSource;
  final AuthLocalDatasource _localDataSource;

  AuthRepositoryImpl({
    required AuthRemoteDatasource remoteDataSource,
    required AuthLocalDatasource localDataSource,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource;

  @override
  Future<Either<Failure, String>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _remoteDataSource.signUp(
        name: name,
        email: email,
        password: password,
      );
      return Right(response.message);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthTokens>> verify({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await _remoteDataSource.verify(email: email, otp: otp);
      await _localDataSource.saveTokens(
        response.data.accessToken,
        response.data.refreshToken,
      );
      return right(
        AuthTokens(
          token: response.data.accessToken,
          refreshToken: response.data.refreshToken,
        ),
      );
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthTokens>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _remoteDataSource.signIn(
        email: email,
        password: password,
      );
      await _localDataSource.saveTokens(
        response.data.accessToken,
        response.data.refreshToken,
      );
      return right(
        AuthTokens(
          token: response.data.accessToken,
          refreshToken: response.data.refreshToken,
        ),
      );
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
