import 'package:nex_play/core/paged_result/paged_resullt.dart';
import 'package:nex_play/features/shared/movie/domain/entities/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_rated_movies_state.freezed.dart';

@freezed
abstract class TopRatedMoviesState with _$TopRatedMoviesState {
  const factory TopRatedMoviesState.initial() = _Initial;

  const factory TopRatedMoviesState.loading() = _TopRatedMoviesStateLoading;

  const factory TopRatedMoviesState.error({required String error}) =
      _TopRatedMoviesStateError;

  const factory TopRatedMoviesState.success({
    required PagedResullt<Movie> movies,
  }) = _TopRatedMoviesStateSuccess;
}
