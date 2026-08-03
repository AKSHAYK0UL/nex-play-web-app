import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nex_play/core/enums/time_window.dart';
import 'package:nex_play/features/shared/movie/domain/usecases/trending_usecase.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/trending_movies_bloc/bloc/trending_movies_event.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/trending_movies_bloc/bloc/trending_movies_state.dart';

class TrendingMoviesBloc
    extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  final TrendingUsecase _trendingUsecase;
  TrendingMoviesBloc({required TrendingUsecase trendingUsecase})
    : _trendingUsecase = trendingUsecase,
      super(TrendingMoviesState.initial()) {
    on<TrendingMoviesEvent>((event, emit) async {
      await event.when(
        getTrending: (lang, page, timeWindow) =>
            _getTrending(lang, page, timeWindow, emit),
      );
    });
  }

  Future<void> _getTrending(
    String lang,
    int page,
    TimeWindow timeWindow,
    Emitter<TrendingMoviesState> emit,
  ) async {
    emit(const TrendingMoviesState.loading());

    final result = await _trendingUsecase.call(
      TrendingParams(lang: lang, time: timeWindow, page: page),
    );

    result.fold(
      (failure) {
        emit(TrendingMoviesState.error(error: failure.message));
      },
      (trendingMovies) {
        emit(TrendingMoviesState.success(movies: trendingMovies));
      },
    );
  }
}
