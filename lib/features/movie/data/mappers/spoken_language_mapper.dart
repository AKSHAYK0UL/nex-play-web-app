import 'package:nex_play/features/movie/domain/entities/language.dart' as entity;
import 'package:nex_play/features/movie/data/models/language.dart' as model;

extension SpokenLanguageMapper on model.SpokenLanguage {
  entity.SpokenLanguage toEntity() {
    return entity.SpokenLanguage(
      iso6391: iso6391,
      name: name,
      englishName: englishName,
    );
  }
}
