
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nex_play/core/paged_result/paged_resullt.dart';
import 'package:nex_play/features/movie/domain/entities/movie.dart';

part 'trending_movies_state.freezed.dart';

@freezed
abstract class TrendingMoviesState with _$TrendingMoviesState {
  const factory TrendingMoviesState.initial() = _Initial;

  const factory TrendingMoviesState.loading() = _TrendingMoviesLoading;

  const factory TrendingMoviesState.error({required String error}) =
      _TrendingMoviesError;

  const factory TrendingMoviesState.success({
    required PagedResullt<Movie> movies,
  }) = _TrendingMoviesSuccess;
}
