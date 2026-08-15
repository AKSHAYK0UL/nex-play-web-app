import 'package:equatable/equatable.dart';

import 'collection.dart';
import 'genre.dart';
import 'language.dart';
import 'production.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String? streamUrl;
  final bool? adult;
  final String? backdropPath;
  final Collection? belongsToCollection;
  final int? budget;
  final List<Genre>? genres;
  final String? homepage;
  final String? imdbId;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompany>? productionCompanies;
  final List<ProductionCountry>? productionCountries;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguage>? spokenLanguages;
  final String? status;
  final String? tagline;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  const Movie({
    required this.id,
    required this.title,
    this.streamUrl,
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        streamUrl,
        adult,
        backdropPath,
        belongsToCollection,
        budget,
        genres,
        homepage,
        imdbId,
        originCountry,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        productionCompanies,
        productionCountries,
        releaseDate,
        revenue,
        runtime,
        spokenLanguages,
        status,
        tagline,
        video,
        voteAverage,
        voteCount,
      ];
}