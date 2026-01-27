import 'package:rick_and_morty/core/ui.dart';

enum CharacterGender {
  male,
  female,
  genderless,
  unknown;

  bool get isMale => this == CharacterGender.male;
  bool get isFemale => this == CharacterGender.female;
  bool get isGenderless => this == CharacterGender.genderless;
  bool get isUnknown => this == CharacterGender.unknown;

  String get displayText => name.capitalize;
}
