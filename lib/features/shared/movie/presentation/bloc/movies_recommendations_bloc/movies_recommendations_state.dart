
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nex_play/core/paged_result/paged_resullt.dart';
import 'package:nex_play/features/shared/movie/domain/entities/movie.dart';

part 'movies_recommendations_state.freezed.dart';

@freezed
abstract class MovieRecommendationsState with _$MovieRecommendationsState {
   const factory MovieRecommendationsState.initial() = _Initial;

  const factory MovieRecommendationsState.loading() = _MovieRecommendationsLoading;

  const factory MovieRecommendationsState.error({required String error}) =
      _MovieRecommendationsError;

  const factory MovieRecommendationsState.success({
    required PagedResullt<Movie> movies,
  }) = _MovieRecommendationsStateSuccess;
}

