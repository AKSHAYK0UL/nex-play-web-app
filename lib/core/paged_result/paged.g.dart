// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Paged<T> _$PagedFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _Paged<T>(
  success: json['success'] as bool? ?? false,
  page: (json['page'] as num?)?.toInt() ?? 0,
  results: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
  totalPages: (json['total_pages'] as num?)?.toInt() ?? 0,
  totalResults: (json['total_results'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$PagedToJson<T>(
  _Paged<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'success': instance.success,
  'page': instance.page,
  'results': instance.results.map(toJsonT).toList(),
  'total_pages': instance.totalPages,
  'total_results': instance.totalResults,
};
