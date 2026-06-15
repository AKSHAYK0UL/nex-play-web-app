import 'package:nex_play/features/movie/domain/entities/production.dart'
    as entity;
import 'package:nex_play/features/movie/data/models/production.dart' as model;

extension ProductionCountryMapper on model.ProductionCountry {
  entity.ProductionCountry toEntity() {
    return entity.ProductionCountry(iso31661: iso31661, name: name);
  }
}
