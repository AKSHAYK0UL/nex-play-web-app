

import 'package:nex_play/features/shared/movie/domain/entities/movie.dart' as entity;
import 'package:nex_play/features/shared/movie/data/models/movie.dart' as model;


import 'collection_mapper.dart';
import 'genre_mapper.dart';
import 'production_company_mapper.dart';
import 'production_country_mapper.dart';
import 'spoken_language_mapper.dart';

extension MovieMapper on model.Movie {
  entity.Movie toEntity() {
    return entity.Movie(
      id: id,
      title: title,
      streamUrl: streamUrl,
      adult: adult,
      backdropPath: backdropPath,
      belongsToCollection: belongsToCollection?.toEntity(),
      budget: budget,
      genres: genres?.map((e) => e.toEntity()).toList(),
      homepage: homepage,
      imdbId: imdbId,
      originCountry: originCountry,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      productionCompanies:
          productionCompanies?.map((e) => e.toEntity()).toList(),
      productionCountries:
          productionCountries?.map((e) => e.toEntity()).toList(),
      releaseDate: releaseDate,
      revenue: revenue,
      runtime: runtime,
      spokenLanguages:
          spokenLanguages?.map((e) => e.toEntity()).toList(),
      status: status,
      tagline: tagline,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}