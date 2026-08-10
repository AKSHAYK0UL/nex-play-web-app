import 'package:nex_play/core/paged_result/paged_resullt.dart';
import 'package:nex_play/features/shared/movie/domain/entities/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'upcoming_movies_state.freezed.dart';

@freezed
abstract class UpcomingMoviesState with _$UpcomingMoviesState {
  const factory UpcomingMoviesState.initial() = _Initial;

  const factory UpcomingMoviesState.loading() = _UpcomingMoviesLoading;
  const factory UpcomingMoviesState.error({required String error}) =
      _UpcomingMoviesError;

  const factory UpcomingMoviesState.success({
    required PagedResullt<Movie> movies,
  }) = _UpcomingMoviesSuccess;
}
