import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nex_play/features/shared/movie/domain/usecases/recommendations_usecase.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movies_recommendations_bloc/movies_recommendations_event.dart';
import 'package:nex_play/features/shared/movie/presentation/bloc/movies_recommendations_bloc/movies_recommendations_state.dart';

class MovieRecommendationsBloc
    extends Bloc<MovieRecommendationsEvent, MovieRecommendationsState> {
  final RecommendationsUsecase _recommendationsUsecase;
  MovieRecommendationsBloc({
    required RecommendationsUsecase recommendationsUsecase,
  }) : _recommendationsUsecase = recommendationsUsecase,
       super(MovieRecommendationsState.initial()) {
    on<MovieRecommendationsEvent>((event, emit) async {
      await event.when(
        getMoviesRecommendations: (id, lang, page) =>
            _getMoviesRecommendations(id, lang, page, emit),
      );
    });
  }

  Future<void> _getMoviesRecommendations(
    int id,
    String lang,
    int page,
    Emitter<MovieRecommendationsState> emit,
  ) async {
    emit(const MovieRecommendationsState.loading());

    final result = await _recommendationsUsecase(
      RecommendationsParams(id: id, lang: lang, page: page),
    );

    result.fold(
      (failure) {
        emit(MovieRecommendationsState.error(error: failure.message));
      },
      (movies) {
        emit(MovieRecommendationsState.success(movies: movies));
      },
    );
  }
}
