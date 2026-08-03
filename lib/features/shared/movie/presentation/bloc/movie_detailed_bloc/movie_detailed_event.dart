import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detailed_event.freezed.dart';


@freezed
abstract class MovieDetailedEvent with _$MovieDetailedEvent {
  const factory MovieDetailedEvent.getMovieDetails({
    required int id,
    required String lang,
  }) = _MovieDetailedGetMovieDetails;
}
