import 'package:freezed_annotation/freezed_annotation.dart';

part 'similar_movies_event.freezed.dart';

@freezed
abstract class SimilarMoviesEvent with _$SimilarMoviesEvent {
  const factory SimilarMoviesEvent.getSimilarMovies({
    required int id,
    required String lang,
    required int page,
  }) = _GetSimilarMovies;
}
