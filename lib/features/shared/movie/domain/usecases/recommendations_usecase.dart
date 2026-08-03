import 'package:fpdart/fpdart.dart';
import 'package:nex_play/core/errors/failures.dart';
import 'package:nex_play/core/paged_result/paged_resullt.dart';
import 'package:nex_play/core/usecases/base_usecase.dart';
import 'package:nex_play/features/shared/movie/domain/entities/movie.dart';
import 'package:nex_play/features/shared/movie/domain/repositories/movie_repository.dart';

class RecommendationsUsecase
    implements Usecase<PagedResullt<Movie>, RecommendationsParams> {
  final MovieRepository _movieRepository;

  RecommendationsUsecase(this._movieRepository);

  @override
  Future<Either<Failure, PagedResullt<Movie>>> call(
    RecommendationsParams params,
  ) => _movieRepository.getRecommendations(
    id: params.id,
    lang: params.lang,
    page: params.page,
  );
}

class RecommendationsParams {
  final int id;
  final String lang;
  final int page;

  RecommendationsParams({
    required this.id,
    required this.lang,
    required this.page,
  });
}
