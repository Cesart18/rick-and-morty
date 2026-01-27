import 'package:rick_and_morty/core/foundation.dart';
import 'package:rick_and_morty/src/domain/domain.dart';

enum CharacterStatusModel implements BaseEnum<CharacterStatus, String> {
  alive('alive'),
  dead('dead'),
  unknown('unknown');

  const CharacterStatusModel(this.value);

  @override
  final String value;

  @override
  CharacterStatus toEntity() {
    switch (this) {
      case CharacterStatusModel.alive:
        return CharacterStatus.alive;
      case CharacterStatusModel.dead:
        return CharacterStatus.dead;
      case CharacterStatusModel.unknown:
        return CharacterStatus.unknown;
    }
  }

  static CharacterStatusModel fromEntity(CharacterStatus status) {
    switch (status) {
      case CharacterStatus.alive:
        return CharacterStatusModel.alive;
      case CharacterStatus.dead:
        return CharacterStatusModel.dead;
      case CharacterStatus.unknown:
        return CharacterStatusModel.unknown;
    }
  }

  static CharacterStatusModel? fromValue(String value) {
    return CharacterStatusModel.values
            .cast<BaseEnum<CharacterStatus, String>>()
            .findByValue(value)
        as CharacterStatusModel?;
  }
}
