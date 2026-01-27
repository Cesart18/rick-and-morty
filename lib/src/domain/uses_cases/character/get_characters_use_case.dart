import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/foundation.dart';
import 'package:rick_and_morty/src/domain/domain.dart';

class GetCharactersUseCase {
  GetCharactersUseCase({required ICharacterRepository characterRepository})
    : _characterRepository = characterRepository;

  final ICharacterRepository _characterRepository;

  Future<Result<PageInfo<Character>, AppError>> execute(
    GetCharactersParams parameters, {
    CancelToken? cancelToken,
  }) => _characterRepository.getCharacters(
    parameters,
    cancelToken: cancelToken,
  );
}
