import 'package:equatable/equatable.dart';

class ProductionCompany extends Equatable {
  final int id;
  final String name;
  final String? logoPath;
  final String? originCountry;

  const ProductionCompany({
    required this.id,
    required this.name,
    this.logoPath,
    this.originCountry,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        logoPath,
        originCountry,
      ];
}


class ProductionCountry extends Equatable {
  final String iso31661;
  final String name;

  const ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  @override
  List<Object?> get props => [
        iso31661,
        name,
      ];
}