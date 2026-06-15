import 'package:fpdart/fpdart.dart';
import 'package:nex_play/core/enums/time_window.dart';
import 'package:nex_play/core/errors/exceptions.dart';
import 'package:nex_play/core/errors/failures.dart';
import 'package:nex_play/core/paged_result/paged_mapper.dart';
import 'package:nex_play/core/paged_result/paged_resullt.dart';
import 'package:nex_play/features/movie/data/mappers/movie_mapper.dart';
import 'package:nex_play/features/movie/data/remote/movie_remote_datasource.dart';
import 'package:nex_play/features/movie/domain/entities/movie.dart';
import 'package:nex_play/features/movie/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDatasource _movieRemoteDatasource;

  MovieRepositoryImpl(this._movieRemoteDatasource);

  @override
  Future<Either<Failure, Movie>> getMovieDetails({
    required int id,
    required String lang,
  }) async {
    try {
      final movieDetails = await _movieRemoteDatasource.getMovieDetails(
        id: id,
        lang: lang,
      );

      return right(movieDetails.toEntity());
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PagedResullt<Movie>>> getNowPlaying({
    required String lang,
    required int page,
  }) async {
    try {
      final nowPlaying = await _movieRemoteDatasource.getNowPlaying(
        lang: lang,
        page: page,
      );

      return right(nowPlaying.toEntityMapped((m) => m.toEntity()));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PagedResullt<Movie>>> getPopular({
    required String lang,
    required int page,
  }) async {
    try {
      final popularMovie = await _movieRemoteDatasource.getPopular(
        lang: lang,
        page: page,
      );
      return right(popularMovie.toEntityMapped((m) => m.toEntity()));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PagedResullt<Movie>>> getRecommendations({
    required int id,
    required String lang,
    required int page,
  })async {
     try {
      final movieRecommendations = await _movieRemoteDatasource.getRecommendations(
        id: id,
        lang: lang,
        page: page,
      );
      return right(movieRecommendations.toEntityMapped((m) => m.toEntity()));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PagedResullt<Movie>>> getSimilar({
    required int id,
    required String lang,
    required int page,
  }) async{
    try {
      final similarMovie = await _movieRemoteDatasource.getSimilar(
        id: id,
        lang: lang,
        page: page,
      );
      return right(similarMovie.toEntityMapped((m) => m.toEntity()));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PagedResullt<Movie>>> getTopRated({
    required String lang,
    required int page,
  }) async{
     try {
      final topRatedMovie = await _movieRemoteDatasource.getTopRated(
        lang: lang,
        page: page,
      );
      return right(topRatedMovie.toEntityMapped((m) => m.toEntity()));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PagedResullt<Movie>>> getTrending({
    required String lang,
    required TimeWindow time,
    required int page,
  }) async{
    try {
      final trendingMovie = await _movieRemoteDatasource.getTrending(
        lang: lang,
        time: time,
        page: page,
      );
      return right(trendingMovie.toEntityMapped((m) => m.toEntity()));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PagedResullt<Movie>>> getUpcoming({
    required String lang,
    required int page,
  }) async{
     try {
      final upcomingMovie = await _movieRemoteDatasource.getUpcoming(
        lang: lang,
        page: page,
      );
      return right(upcomingMovie.toEntityMapped((m) => m.toEntity()));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
