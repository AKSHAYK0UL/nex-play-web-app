import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nex_play/features/movie/domain/usecases/movie_detailed_usecase.dart';
import 'package:nex_play/features/movie/presentation/bloc/movie_detailed_bloc/movie_detailed_event.dart';
import 'package:nex_play/features/movie/presentation/bloc/movie_detailed_bloc/movie_detailed_state.dart';

class MovieDetailedBloc extends Bloc<MovieDetailedEvent, MovieDetailedState> {
  final MovieDetailedUsecase _movieDetailedUsecase;

  MovieDetailedBloc({required MovieDetailedUsecase movieDetailedUsecase})
    : _movieDetailedUsecase = movieDetailedUsecase,

      super(const MovieDetailedState.initial()) {
    on<MovieDetailedEvent>((event, emit) async {
      await event.when(
        getMovieDetails: (id, lang) => _getMovieDetails(id, lang, emit),
      );
    });
  }

  Future<void> _getMovieDetails(
    int id,
    String lang,
    Emitter<MovieDetailedState> emit,
  ) async {
    emit(const MovieDetailedState.loading());

    final result = await _movieDetailedUsecase(
      MovieDetailedParams(id: id, lang: lang),
    );

    result.fold(
      (failure) {
        emit(MovieDetailedState.error(error: failure.message));
      },
      (movie) {
        emit(MovieDetailedState.success(movie: movie));
      },
    );
  }
}
