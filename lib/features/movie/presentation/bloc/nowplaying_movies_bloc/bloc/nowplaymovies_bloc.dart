import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nex_play/features/movie/domain/usecases/now_playing_usecase.dart';
import 'package:nex_play/features/movie/presentation/bloc/nowplaying_movies_bloc/bloc/nowplaymovies_event.dart';
import 'package:nex_play/features/movie/presentation/bloc/nowplaying_movies_bloc/bloc/nowplaymovies_state.dart';


class NowPlayMoviesBloc extends Bloc<NowPlayMoviesEvent, NowPlayMoviesState> {
  final NowPlayingUsecase _nowPlayingUsecase;
  NowPlayMoviesBloc({required NowPlayingUsecase nowPlayingUsecase})
    : _nowPlayingUsecase = nowPlayingUsecase,

      super(NowPlayMoviesState.initial()) {
    on<NowPlayMoviesEvent>((event, emit) async {
      await event.when(
        getNowPlaying: (lang, page) => _getNowPlaying(lang, page, emit),
      );
    });
  }

  Future<void> _getNowPlaying(
    String lang,
    int page,
    Emitter<NowPlayMoviesState> emit,
  ) async {
    emit(NowPlayMoviesState.loading());

    final result = await _nowPlayingUsecase(
      NowPlayingParams(lang: lang, page: page),
    );
    result.fold(
      (failure) {
        emit(NowPlayMoviesState.error(error: failure.message));
      },
      (movies) {
        emit(NowPlayMoviesState.success(movies: movies));
      },
    );
  }
}
