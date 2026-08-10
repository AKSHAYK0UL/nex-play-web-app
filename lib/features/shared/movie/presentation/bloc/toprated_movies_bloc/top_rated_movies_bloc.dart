import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nex_play/features/shared/movie/domain/usecases/toprated_usecase.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/toprated_movies_bloc/top_rated_movies_event.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/toprated_movies_bloc/top_rated_movies_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  final TopratedUsecase _topratedUsecase;
  TopRatedMoviesBloc({required TopratedUsecase topratedUsecase})
    : _topratedUsecase = topratedUsecase,
      super(TopRatedMoviesState.initial()) {
    on<TopRatedMoviesEvent>((event, emit) async {
      await event.when(
        getTopRatedMovies: (lang, page) => _getTopRatedMovies(lang, page, emit),
      );
    });
  }

  Future<void> _getTopRatedMovies(
    String lang,
    int page,
    Emitter<TopRatedMoviesState> emit,
  ) async {
    emit(TopRatedMoviesState.loading());

    final result = await _topratedUsecase(
      TopratedParams(lang: lang, page: page),
    );

    result.fold(
      (failure) {
        emit(TopRatedMoviesState.error(error: failure.message));
      },
      (movies) {
        emit(TopRatedMoviesState.success(movies: movies));
      },
    );
  }
}
