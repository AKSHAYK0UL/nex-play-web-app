import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nex_play/core/paged_result/paged_resullt.dart';
import 'package:nex_play/features/shared/movie/domain/entities/movie.dart';

part 'similar_movies_state.freezed.dart';

@freezed
abstract class SimilarMoviesState with _$SimilarMoviesState {
  const factory SimilarMoviesState.initial() = _Initial;
  const factory SimilarMoviesState.loading()=_SimilarMoviesLoading;

const factory SimilarMoviesState.error({required String error})=_SimilarMoviesError;

const factory SimilarMoviesState.success({ required PagedResullt<Movie> movies})=_SimilarMoviesStateSuccess;

}
