import 'package:rick_and_morty/src/domain/domain.dart';

class Config {
  const Config({required this.characterRepository});

  final ICharacterRepository characterRepository;
}
