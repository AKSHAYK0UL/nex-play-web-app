import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nex_play/core/enums/time_window.dart';

part 'trending_movies_event.freezed.dart';

@freezed
abstract class TrendingMoviesEvent with _$TrendingMoviesEvent {
  const factory TrendingMoviesEvent.getTrending({required String lang, required int page,required TimeWindow timeWindow})= _TrendingMoviesGetTrending;
}