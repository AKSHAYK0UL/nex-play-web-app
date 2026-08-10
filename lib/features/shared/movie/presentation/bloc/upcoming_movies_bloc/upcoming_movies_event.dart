
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upcoming_movies_event.freezed.dart';

@freezed
abstract class UpcomingMoviesEvent with _$UpcomingMoviesEvent {
  const factory UpcomingMoviesEvent.getUpcomingMovies({required String lang, required int page}) = _GetUUpcomingMovies;
}