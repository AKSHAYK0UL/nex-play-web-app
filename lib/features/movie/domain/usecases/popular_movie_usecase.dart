import 'package:fpdart/fpdart.dart';
import 'package:nex_play/core/errors/failures.dart';
import 'package:nex_play/core/paged_result/paged_resullt.dart';
import 'package:nex_play/core/usecases/base_usecase.dart';
import 'package:nex_play/features/movie/domain/entities/movie.dart';
import 'package:nex_play/features/movie/domain/repositories/movie_repository.dart';

class PopularMovieUsecase
    implements Usecase<PagedResullt<Movie>, PopularMovieParams> {
  final MovieRepository _movieRepository;

  PopularMovieUsecase(this._movieRepository);

  @override
  Future<Either<Failure, PagedResullt<Movie>>> call(
    PopularMovieParams params,
  ) => _movieRepository.getPopular(lang: params.lang, page: params.page);
}

class PopularMovieParams {
  final String lang;
  final int page;

  PopularMovieParams(this.lang, this.page);
}
