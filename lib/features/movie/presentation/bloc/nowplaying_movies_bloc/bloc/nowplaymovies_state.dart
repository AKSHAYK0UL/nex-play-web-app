
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nex_play/core/paged_result/paged_resullt.dart' show PagedResullt;
import 'package:nex_play/features/movie/domain/entities/movie.dart';

part 'nowplaymovies_state.freezed.dart';



@freezed
abstract class NowPlayMoviesState with _$NowPlayMoviesState {
  const factory NowPlayMoviesState.initial() = _Initial;

  const factory NowPlayMoviesState.loading() = _NowPlayingLoading;

  const factory NowPlayMoviesState.error({required String error}) =
      _NowPlayMovieError;

  const factory NowPlayMoviesState.success({
    required PagedResullt<Movie> movies,
  }) = _NowPlayMoviesSuccess;
}
