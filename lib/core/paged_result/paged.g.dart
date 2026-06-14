// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Paged<T> _$PagedFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _Paged<T>(
  page: (json['page'] as num?)?.toInt() ?? 0,
  results: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
  totalPage: (json['total_pages'] as num?)?.toInt() ?? 0,
  totalResults: (json['total_results'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$PagedToJson<T>(
  _Paged<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'page': instance.page,
  'results': instance.results.map(toJsonT).toList(),
  'total_pages': instance.totalPage,
  'total_results': instance.totalResults,
};
