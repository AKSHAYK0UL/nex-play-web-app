import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nex_play/features/shared/movie/domain/usecases/similar_movie_usecase.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/similar_movies_bloc/similar_movies_event.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/similar_movies_bloc/similar_movies_state.dart';

class SimilarMoviesBloc extends Bloc<SimilarMoviesEvent, SimilarMoviesState> {
  final SimilarMovieUsecase _similarMovieUsecase;
  SimilarMoviesBloc({required SimilarMovieUsecase similarMovieUsecase})
    : _similarMovieUsecase = similarMovieUsecase,
      super(SimilarMoviesState.initial()) {
    on<SimilarMoviesEvent>((event, emit) async {
     await event.when(
        getSimilarMovies: (id, lang, page) =>
            _getSimilarMovies(id, lang, page, emit),
      );
    });
  }
  Future<void> _getSimilarMovies(
    int id,
    String lang,
    int page,
    Emitter<SimilarMoviesState> emit,
  ) async {
    emit(SimilarMoviesState.loading());
    final result = await _similarMovieUsecase(
      SimilarMovieParams(id: id, lang: lang, page: page),
    );

    result.fold(
      (failure) {
        emit(SimilarMoviesState.error(error: failure.message));
      },
      (movies) {
        emit(SimilarMoviesState.success(movies: movies));
      },
    );
  }
}
