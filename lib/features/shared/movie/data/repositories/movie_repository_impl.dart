import 'package:fpdart/fpdart.dart';
import 'package:nex_play/core/cache/cache_service_impl/movie_cache/movie_cache_key.dart';
import 'package:nex_play/core/cache/cache_service_interface/cache_service_interface.dart';
import 'package:nex_play/core/constants/api_const.dart';
import 'package:nex_play/core/enums/cache_movie_key.dart';
import 'package:nex_play/core/enums/time_window.dart';
import 'package:nex_play/core/errors/exceptions.dart';
import 'package:nex_play/core/errors/failures.dart';
import 'package:nex_play/core/paged_result/paged.dart';
import 'package:nex_play/core/paged_result/paged_mapper.dart';
import 'package:nex_play/core/paged_result/paged_resullt.dart';
import 'package:nex_play/features/shared/movie/data/mappers/movie_mapper.dart';
import 'package:nex_play/features/shared/movie/data/remote/movie_remote_datasource.dart';
import 'package:nex_play/features/shared/movie/domain/entities/movie.dart';
import 'package:nex_play/features/shared/movie/domain/repositories/movie_repository.dart';
import 'package:nex_play/features/shared/movie/data/models/movie.dart' as dm;

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDatasource _movieRemoteDatasource;

  final CacheServiceInterface<MovieCacheKey, Paged<dm.Movie>> _cache;

  MovieRepositoryImpl(this._movieRemoteDatasource, this._cache);

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
  }) async {
    try {
      //cache ---------------------
      final key = MovieCacheKey(
        type: MovieCacheKeyType.recommendations,
        endpoint: MediaAPI.recommendations,
        page: page,
        movieId: id,
      );

      final cached = _cache.get(key);

      if (cached != null) {
        return right(cached.toEntityMapped((m) => m.toEntity()));
      }

      final movieRecommendations = await _movieRemoteDatasource
          .getRecommendations(id: id, lang: lang, page: page);

      await _cache.put(key, movieRecommendations);
      //cache ---------------------

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
  }) async {
    try {
      //cache ---------------------

      final key = MovieCacheKey(
        type: MovieCacheKeyType.similar,
        endpoint: MediaAPI.similar,
        page: page,
        movieId: id,
      );

      final cached = _cache.get(key);

      if (cached != null) {
        return right(cached.toEntityMapped((m) => m.toEntity()));
      }

      final similarMovie = await _movieRemoteDatasource.getSimilar(
        id: id,
        lang: lang,
        page: page,
      );
      await _cache.put(key, similarMovie);
      //cache ---------------------

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
  }) async {
    try {
      //cache ---------------------

      final key = MovieCacheKey(
        type: MovieCacheKeyType.topRated,
        endpoint: MediaAPI.topRated,
        page: page,
      );

      final cached = _cache.get(key);

      if (cached != null) {
        return right(cached.toEntityMapped((m) => m.toEntity()));
      }

      final topRatedMovie = await _movieRemoteDatasource.getTopRated(
        lang: lang,
        page: page,
      );
      await _cache.put(key, topRatedMovie);
      //cache ---------------------

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
  }) async {
    try {
      //cache ---------------------

      final key = MovieCacheKey(
        type: MovieCacheKeyType.trending,
        endpoint: MediaAPI.trending,
        page: page,
        time: time,
      );

      final cached = _cache.get(key);

      if (cached != null) {
        return right(cached.toEntityMapped((m) => m.toEntity()));
      }

      final trendingMovie = await _movieRemoteDatasource.getTrending(
        lang: lang,
        time: time,
        page: page,
      );
      await _cache.put(key, trendingMovie);
      //cache ---------------------

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
  }) async {
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
