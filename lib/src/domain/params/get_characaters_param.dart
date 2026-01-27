import 'package:rick_and_morty/src/domain/domain.dart';

class GetCharactersParams {
  GetCharactersParams({
    this.page,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
  });

  final int? page;
  final String? name;
  final CharacterStatus? status;
  final String? species;
  final String? type;
  final CharacterGender? gender;
}
