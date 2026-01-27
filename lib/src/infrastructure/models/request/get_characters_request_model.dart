import 'package:rick_and_morty/core/typedefs/data_map.dart';
import 'package:rick_and_morty/src/domain/domain.dart';

class GetCharactersRequestModel extends GetCharactersParams {
  GetCharactersRequestModel({
    required super.page,
    required super.name,
    required super.status,
    required super.gender,
    required super.species,
    required super.type,
  });

  factory GetCharactersRequestModel.fromEntity(GetCharactersParams params) =>
      GetCharactersRequestModel(
        page: params.page,
        name: params.name,
        status: params.status,
        gender: params.gender,
        species: params.species,
        type: params.type,
      );

  DataMap toQueryParameters() => {
    'page': page,
    'name': name,
    'status': status?.name,
    'gender': gender?.name,
    'species': species,
    'type': type,
  };
}
