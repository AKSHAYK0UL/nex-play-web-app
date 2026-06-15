import 'package:fpdart/fpdart.dart';
import 'package:nex_play/core/errors/failures.dart';
import 'package:nex_play/core/usecases/base_usecase.dart';
import 'package:nex_play/features/movie/domain/entities/movie.dart';
import 'package:nex_play/features/movie/domain/repositories/movie_repository.dart';

class MovieDetailedUsecase implements Usecase<Movie, MovieDetailedParams> {
  final MovieRepository _movieRepository;

  MovieDetailedUsecase(this._movieRepository);
  @override
  Future<Either<Failure, Movie>> call(MovieDetailedParams params) =>
      _movieRepository.getMovieDetails(id: params.id, lang: params.lang);
}

class MovieDetailedParams {
  final int id;
  final String lang;

  MovieDetailedParams({required this.id, required this.lang});
}
