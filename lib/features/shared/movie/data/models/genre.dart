import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

@freezed
abstract class Genre with _$Genre {
  const factory Genre({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) =>
      _$GenreFromJson(json);
}