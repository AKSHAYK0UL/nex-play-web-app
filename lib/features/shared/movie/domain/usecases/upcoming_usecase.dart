import 'package:fpdart/fpdart.dart';
import 'package:nex_play/core/errors/failures.dart';
import 'package:nex_play/core/paged_result/paged_resullt.dart';
import 'package:nex_play/core/usecases/base_usecase.dart';
import 'package:nex_play/features/shared/movie/domain/entities/movie.dart';
import 'package:nex_play/features/shared/movie/domain/repositories/movie_repository.dart';

class UpcomingUsecase implements Usecase<PagedResullt<Movie>, UpcomingParams> {
  final MovieRepository _movieRepository;

  UpcomingUsecase(this._movieRepository);

  @override
  Future<Either<Failure, PagedResullt<Movie>>> call(UpcomingParams params) =>
      _movieRepository.getUpcoming(lang: params.lang, page: params.page);
}

class UpcomingParams {
  final String lang;
  final int page;

  UpcomingParams({required this.lang, required this.page});
}
