

import 'package:nex_play/features/shared/movie/domain/entities/production.dart' as entity;
import 'package:nex_play/features/shared/movie/data/models/production.dart' as model;

extension ProductionCompanyMapper on model.ProductionCompany {
  entity.ProductionCompany toEntity() {
    return entity.ProductionCompany(
      id: id,
      name: name,
      logoPath: logoPath,
      originCountry: originCountry,
    );
  }
}