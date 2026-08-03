import 'package:nex_play/features/shared/movie/domain/entities/genre.dart' as entity;
import 'package:nex_play/features/shared/movie/data/models/genre.dart' as model;

extension GenreMapper on model.Genre {
  entity.Genre toEntity() {
    return entity.Genre(id: id, name: name);
  }
}
