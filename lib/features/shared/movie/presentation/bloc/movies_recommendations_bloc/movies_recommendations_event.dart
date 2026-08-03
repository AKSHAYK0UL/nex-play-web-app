
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_recommendations_event.freezed.dart';
@freezed
abstract class MovieRecommendationsEvent with _$MovieRecommendationsEvent {
  const factory MovieRecommendationsEvent.getMoviesRecommendations({ required int id,
    required String lang,
    required int page})=_GetMoviesRecommendations;
}