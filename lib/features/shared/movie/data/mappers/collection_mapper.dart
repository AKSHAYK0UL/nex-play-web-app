import 'package:nex_play/features/shared/movie/domain/entities/collection.dart' as entity;
import 'package:nex_play/features/shared/movie/data/models/collection.dart' as model;

extension CollectionMapper on model.Collection {
  entity.Collection toEntity() {
    return entity.Collection(
      id: id,
      name: name,
      posterPath: posterPath,
      backdropPath: backdropPath,
    );
  }
}
