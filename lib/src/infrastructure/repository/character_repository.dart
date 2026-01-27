import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/foundation.dart';
import 'package:rick_and_morty/src/domain/domain.dart';
import 'package:rick_and_morty/src/infrastructure/infrastructure.dart';

class CharacterRepository implements ICharacterRepository {
  CharacterRepository({required ICharacterApi characterApi})
    : _characterApi = characterApi;

  final ICharacterApi _characterApi;

  @override
  Future<Result<PageInfo<Character>, AppError>> getCharacters(
    GetCharactersParams param, {
    CancelToken? cancelToken,
  }) async {
    final result = await _characterApi.getCharacters(
      param,
      cancelToken: cancelToken,
    );

    if (result is Failure) {
      return Failure(AppError.fromServerError(result.error!));
    }

    return Success(result.data!);
  }
}
