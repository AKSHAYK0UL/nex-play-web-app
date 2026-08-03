import 'package:equatable/equatable.dart';

class SpokenLanguage extends Equatable {
  final String iso6391;
  final String name;
  final String? englishName;

  const SpokenLanguage({
    required this.iso6391,
    required this.name,
    this.englishName,
  });

  @override
  List<Object?> get props => [
        iso6391,
        name,
        englishName,
      ];
}