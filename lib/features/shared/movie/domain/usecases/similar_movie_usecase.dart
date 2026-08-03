import 'package:fpdart/fpdart.dart';
import 'package:nex_play/core/errors/failures.dart';
import 'package:nex_play/core/paged_result/paged_resullt.dart';
import 'package:nex_play/core/usecases/base_usecase.dart';
import 'package:nex_play/features/shared/movie/domain/entities/movie.dart';
import 'package:nex_play/features/shared/movie/domain/repositories/movie_repository.dart';

class SimilarMovieUsecase
    implements Usecase<PagedResullt<Movie>, SimilarMovieParams> {
  final MovieRepository _movieRepository;

  SimilarMovieUsecase(this._movieRepository);

  @override
  Future<Either<Failure, PagedResullt<Movie>>> call(
    SimilarMovieParams params,
  ) => _movieRepository.getSimilar(
    id: params.id,
    lang: params.lang,
    page: params.page,
  );
}

class SimilarMovieParams {
  final int id;
  final String lang;
  final int page;

  SimilarMovieParams({
    required this.id,
    required this.lang,
    required this.page,
  });
}
