import 'package:fpdart/fpdart.dart';
import 'package:nex_play/core/enums/time_window.dart';
import 'package:nex_play/core/errors/failures.dart';
import 'package:nex_play/core/paged_result/paged_resullt.dart';
import 'package:nex_play/core/usecases/base_usecase.dart';
import 'package:nex_play/features/shared/movie/domain/entities/movie.dart';
import 'package:nex_play/features/shared/movie/domain/repositories/movie_repository.dart';

class TrendingUsecase implements Usecase<PagedResullt<Movie>, TrendingParams> {
  final MovieRepository _movieRepository;

  TrendingUsecase(this._movieRepository);

  @override
  Future<Either<Failure, PagedResullt<Movie>>> call(TrendingParams params) =>
      _movieRepository.getTrending(
        lang: params.lang,
        time: params.time,
        page: params.page,
      );
}

class TrendingParams {
  final String lang;
  final TimeWindow time;
  final int page;

  TrendingParams({required this.lang, required this.time, required this.page});
}
