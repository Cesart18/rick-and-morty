import 'package:rick_and_morty/core/foundation.dart';
import 'package:rick_and_morty/src/domain/domain.dart';

enum CharacterGenderModel implements BaseEnum<CharacterGender, String> {
  male('male'),
  female('female'),
  genderless('genderless'),
  unknown('unknown');

  const CharacterGenderModel(this.value);

  @override
  final String value;

  @override
  CharacterGender toEntity() {
    switch (this) {
      case CharacterGenderModel.male:
        return CharacterGender.male;
      case CharacterGenderModel.female:
        return CharacterGender.female;
      case CharacterGenderModel.genderless:
        return CharacterGender.genderless;
      case CharacterGenderModel.unknown:
        return CharacterGender.unknown;
    }
  }

  static CharacterGenderModel fromEntity(CharacterGender gender) {
    switch (gender) {
      case CharacterGender.male:
        return CharacterGenderModel.male;
      case CharacterGender.female:
        return CharacterGenderModel.female;
      case CharacterGender.genderless:
        return CharacterGenderModel.genderless;
      case CharacterGender.unknown:
        return CharacterGenderModel.unknown;
    }
  }

  static CharacterGenderModel? fromValue(String value) {
    return CharacterGenderModel.values
            .cast<BaseEnum<CharacterGender, String>>()
            .findByValue(value)
        as CharacterGenderModel?;
  }
}
