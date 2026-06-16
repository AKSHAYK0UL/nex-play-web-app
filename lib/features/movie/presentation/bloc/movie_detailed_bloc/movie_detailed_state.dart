import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nex_play/features/movie/domain/entities/movie.dart';

part 'movie_detailed_state.freezed.dart';

@freezed
abstract class MovieDetailedState with _$MovieDetailedState {
  const factory MovieDetailedState.initial() = _MovieDetailedInitial;
  const factory MovieDetailedState.loading() = _MovieDetailedLoading;
  const factory MovieDetailedState.error() = MovieDetailedError;

  const factory MovieDetailedState.success({required Movie movie}) =
      MovieDetailedSuccess;
}
