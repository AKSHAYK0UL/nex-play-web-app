import 'package:nex_play/core/paged_result/paged.dart' as model;
import 'package:nex_play/core/paged_result/paged_resullt.dart' as entity;

extension PagedMapper<T> on model.Paged<T> {
  entity.PagedResullt<R> toEntityMapped<R>(R Function(T) mapper) {
    return entity.PagedResullt<R>(
      page: page,
      results: results.map(mapper).toList(),
      totalPage: totalPage,
      totalResults: totalResults,
    );
  }
}
