import 'package:rick_and_morty/core/foundation.dart';
import 'package:rick_and_morty/src/domain/domain.dart';

class GetCharactersUseCase
    implements
        UseCaseWithParams<
          Result<PageInfo<Character>, AppError>,
          GetCharactersParams
        > {
  GetCharactersUseCase({required ICharacterRepository characterRepository})
    : _characterRepository = characterRepository;

  final ICharacterRepository _characterRepository;

  @override
  Future<Result<PageInfo<Character>, AppError>> execute(
    GetCharactersParams parameters,
  ) => _characterRepository.getCharacters(parameters);
}
