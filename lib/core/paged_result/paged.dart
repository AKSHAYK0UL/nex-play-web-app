// //used in data/models

// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'paged.freezed.dart';

// part 'paged.g.dart';

// @Freezed(genericArgumentFactories: true)
// abstract class Paged<T> with _$Paged<T> {
//   const factory Paged({
//     @JsonKey(name: 'page') @Default(0) int page,
//     @JsonKey(name: 'results') required List<T> results,
//     @JsonKey(name: 'total_pages') @Default(0) int totalPage,
//     @JsonKey(name: 'total_results') @Default(0) int totalResults,
//   }) = _Paged<T>;

//   factory Paged.fromJson(
//     Map<String, dynamic> json,
//     T Function(Object?) fromJsonT,
//   ) => _$PagedFromJson(json, fromJsonT);
// }

//
//used in data/models

import 'package:freezed_annotation/freezed_annotation.dart';

part 'paged.freezed.dart';

part 'paged.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class Paged<T> with _$Paged<T> {
  const factory Paged({
    @JsonKey(name: 'success') @Default(false) bool success,
    @JsonKey(name: 'page') @Default(0) int page,
    @JsonKey(name: 'results') required List<T> results,
    @JsonKey(name: 'total_pages') @Default(0) int totalPages,
    @JsonKey(name: 'total_results') @Default(0) int totalResults,
  }) = _Paged<T>;

  factory Paged.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$PagedFromJson(
        (json['data'] as Map<String, dynamic>?) != null
            ? {
                ...(json['data'] as Map<String, dynamic>),
                'success': json['success'] ?? false,
              }
            : json,
        fromJsonT,
      );
}
