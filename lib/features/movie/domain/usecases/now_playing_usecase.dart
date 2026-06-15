import 'package:fpdart/fpdart.dart';
import 'package:nex_play/core/errors/failures.dart';
import 'package:nex_play/core/paged_result/paged_resullt.dart';
import 'package:nex_play/core/usecases/base_usecase.dart';
import 'package:nex_play/features/movie/domain/entities/movie.dart';
import 'package:nex_play/features/movie/domain/repositories/movie_repository.dart';

class NowPlayingUsecase
    implements Usecase<PagedResullt<Movie>, NowPlayingParams> {
  final MovieRepository _movieRepository;

  NowPlayingUsecase(this._movieRepository);

  @override
  Future<Either<Failure, PagedResullt<Movie>>> call(NowPlayingParams params) =>
      _movieRepository.getNowPlaying(lang: params.lang, page: params.page);
}

class NowPlayingParams {
  final String lang;
  final int page;

  NowPlayingParams({required this.lang, required this.page});
}
