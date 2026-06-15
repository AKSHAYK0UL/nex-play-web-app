import 'package:fpdart/fpdart.dart';
import 'package:nex_play/core/enums/time_window.dart';
import 'package:nex_play/core/errors/failures.dart';
import 'package:nex_play/core/paged_result/paged_resullt.dart';
import 'package:nex_play/features/movie/domain/entities/movie.dart';

abstract interface class MovieRepository {
  Future<Either<Failure, Movie>> getMovieDetails({
    required int id,
    required String lang,
  });

  Future<Either<Failure, PagedResullt<Movie>>> getNowPlaying({
    required String lang,
    required int page,
  });

  Future<Either<Failure, PagedResullt<Movie>>> getPopular({
    required String lang,
    required int page,
  });

  Future<Either<Failure, PagedResullt<Movie>>> getRecommendations({
    required int id,
    required String lang,
    required int page,
  });

  Future<Either<Failure, PagedResullt<Movie>>> getSimilar({
    required int id,
    required String lang,
    required int page,
  });

  Future<Either<Failure, PagedResullt<Movie>>> getTopRated({
    required String lang,
    required int page,
  });

  Future<Either<Failure, PagedResullt<Movie>>> getTrending({
    required String lang,
    required TimeWindow time,
    required int page,
  });

  Future<Either<Failure, PagedResullt<Movie>>> getUpcoming({
    required String lang,
    required int page,
  });
}
