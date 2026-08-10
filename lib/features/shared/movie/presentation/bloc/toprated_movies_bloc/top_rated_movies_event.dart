import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_rated_movies_event.freezed.dart';

@freezed
abstract class TopRatedMoviesEvent with _$TopRatedMoviesEvent {
  const factory TopRatedMoviesEvent.getTopRatedMovies({
    required String lang,
    required int page,
  }) = _GetTopRatedMovies;
}
