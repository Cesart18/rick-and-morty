import 'package:rick_and_morty/src/domain/entities/entities.dart';

class Character {
  const Character({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.episodes,
    required this.url,
  });

  final int id;
  final String name;
  final String image;
  final CharacterStatus status;
  final String species;
  final String type;
  final CharacterGender gender;
  final CharacterResource origin;
  final CharacterResource location;
  final List<String> episodes;
  final String url;
}
