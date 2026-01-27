import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/foundation.dart';
import 'package:rick_and_morty/src/domain/domain.dart';

// ignore: one_member_abstracts
abstract class ICharacterApi {
  /// Fetches the characters from the repository.
  ///
  /// [param] is the parameters for the characters.
  /// [cancelToken] is the token to cancel the request.
  ///
  /// Returns a [Result] with the [PageInfo] of the characters and an error if
  /// the operation fails.
  Future<Result<PageInfo<Character>, ServerError>> getCharacters(
    GetCharactersParams param, {
    CancelToken? cancelToken,
  });
}
