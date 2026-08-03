import 'package:freezed_annotation/freezed_annotation.dart';

part 'nowplaymovies_event.freezed.dart';

@freezed
abstract class NowPlayMoviesEvent with _$NowPlayMoviesEvent {
  const factory NowPlayMoviesEvent.getNowPlaying({required String lang, required int page}) = _NowPlayingGetNowPlaying;
}