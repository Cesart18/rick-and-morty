import 'package:rick_and_morty/core/foundation.dart';
import 'package:rick_and_morty/src/domain/domain.dart';
import 'package:rick_and_morty/src/infrastructure/data_sources/character_api/character_api_rest_endpoints.dart';
import 'package:rick_and_morty/src/infrastructure/infrastructure.dart';

class CharacterApiRest implements ICharacterApi {
  CharacterApiRest({required HttpManager client}) : _client = client;

  final HttpManager _client;

  @override
  Future<Result<PageInfo<Character>, ServerError>> getCharacters(
    GetCharactersParams param,
  ) async {
    final request = GetCharactersRequestModel.fromEntity(param);
    try {
      final response = await _client.get<DataMap>(
        CharacterApiRestEndpoints.characters,
        queryParameters: request.toQueryParameters(),
      );

      final pageInfo = PageInfoDtoModel<Character>.fromMap(
        data: response.data!,
        mapper: CharacterDtoModel.fromMap,
      );

      return Success(pageInfo);
    } on ServerError catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(ServerError(message: 'Error inesperado: $e'));
    }
  }
}
