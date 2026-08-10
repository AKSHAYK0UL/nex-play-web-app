import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nex_play/features/shared/movie/domain/usecases/upcoming_usecase.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/upcoming_movies_bloc/upcoming_movies_event.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/upcoming_movies_bloc/upcoming_movies_state.dart';

class UpcomingMoviesBloc
    extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  final UpcomingUsecase _upcomingUsecase;

  UpcomingMoviesBloc({required UpcomingUsecase upcomingUsecase})
    : _upcomingUsecase = upcomingUsecase,
      super(UpcomingMoviesState.initial()) {
    on<UpcomingMoviesEvent>((event, emit) async {
      await event.when(
        getUpcomingMovies: (lang, page) => _getUpcomingMovies(lang, page, emit),
      );
    });
  }

  Future<void> _getUpcomingMovies(
    String lang,
    int page,
    Emitter<UpcomingMoviesState> emit,
  ) async {
    emit(UpcomingMoviesState.loading());
    final result = await _upcomingUsecase(
      UpcomingParams(lang: lang, page: page),
    );

    result.fold(
      (failure) {
        emit(UpcomingMoviesState.error(error: failure.message));
      },
      (movies) {
        emit(UpcomingMoviesState.success(movies: movies));
      },
    );
  }
}
