import 'package:rick_and_morty/core/foundation.dart';
import 'package:rick_and_morty/src/domain/entities/entities.dart';

class CharacterResourceDtoModel extends CharacterResource {
  CharacterResourceDtoModel({required super.name, required super.url});

  factory CharacterResourceDtoModel.fromMap(DataMap map) {
    final name = map['name'] as String? ?? '';
    final url = map['url'] as String? ?? '';
    return CharacterResourceDtoModel(name: name, url: url);
  }

  DataMap toJson() => {'name': name, 'url': url};
}
