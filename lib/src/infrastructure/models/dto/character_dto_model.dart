import 'package:rick_and_morty/core/typedefs/data_map.dart';
import 'package:rick_and_morty/src/domain/domain.dart';
import 'package:rick_and_morty/src/infrastructure/infrastructure.dart';

class CharacterDtoModel extends Character {
  CharacterDtoModel({
    required super.id,
    required super.name,
    required super.image,
    required super.status,
    required super.species,
    required super.type,
    required super.gender,
    required super.origin,
    required super.location,
    required super.episodes,
    required super.url,
  });

  factory CharacterDtoModel.fromMap(DataMap map) {
    final id = (map['id'] as num?)?.toInt() ?? 0;

    final name = map['name'] as String? ?? '';
    final image = map['image'] as String? ?? '';
    final species = map['species'] as String? ?? '';
    final type = map['type'] as String? ?? '';
    final episodes = map['episode'] as List<dynamic>? ?? [];
    final url = map['url'] as String? ?? '';

    final originRaw = map['origin'];
    final locationRaw = map['location'];

    final originValue = originRaw is DataMap ? originRaw : <String, dynamic>{};
    final locationValue = locationRaw is DataMap
        ? locationRaw
        : <String, dynamic>{};

    final origin = CharacterResourceDtoModel.fromMap(originValue);
    final location = CharacterResourceDtoModel.fromMap(locationValue);

    final statusValue = (map['status'] as String? ?? '').toLowerCase();
    final genderValue = (map['gender'] as String? ?? '').toLowerCase();
    final status =
        CharacterStatusModel.fromValue(statusValue)?.toEntity() ??
        CharacterStatus.unknown;
    final gender =
        CharacterGenderModel.fromValue(genderValue)?.toEntity() ??
        CharacterGender.unknown;

    return CharacterDtoModel(
      id: id,
      name: name,
      image: image,
      status: status,
      species: species,
      type: type,
      gender: gender,
      origin: origin,
      location: location,
      episodes: episodes.map((e) => e.toString()).toList(),
      url: url,
    );
  }

  DataMap toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'status': status,
    'species': species,
    'type': type,
    'gender': gender,
    'origin': origin,
    'location': location,
    'episode': episodes,
  };
}
