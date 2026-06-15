import 'package:fpdart/fpdart.dart';
import 'package:nex_play/core/errors/failures.dart';
import 'package:nex_play/core/paged_result/paged_resullt.dart';
import 'package:nex_play/core/usecases/base_usecase.dart';
import 'package:nex_play/features/movie/domain/entities/movie.dart';
import 'package:nex_play/features/movie/domain/repositories/movie_repository.dart';

class TopratedUsecase implements Usecase<PagedResullt<Movie>, TopratedParams> {
  final MovieRepository _movieRepository;

  TopratedUsecase(this._movieRepository);

  @override
  Future<Either<Failure, PagedResullt<Movie>>> call(TopratedParams params) =>
      _movieRepository.getTopRated(lang: params.lang, page: params.page);
}

class TopratedParams {
  final String lang;
  final int page;

  TopratedParams({required this.lang, required this.page});
}
