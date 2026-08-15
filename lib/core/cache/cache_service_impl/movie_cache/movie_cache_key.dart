import 'package:equatable/equatable.dart';
import 'package:nex_play/core/enums/cache_movie_key.dart';
import 'package:nex_play/core/enums/time_window.dart';

class MovieCacheKey extends Equatable {
  final MovieCacheKeyType type;
  final String endpoint;
  final int? movieId;
  final int page;
  final TimeWindow? time;

  const MovieCacheKey({
    required this.type,
    required this.endpoint,
    this.movieId,
    required this.page,
    this.time,
  });

  @override
  List<Object?> get props => [type, endpoint, movieId, page, time];
}
