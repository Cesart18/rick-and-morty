part of 'searched_characteres_bloc.dart';

sealed class SearchedCharacteresEvent extends Equatable {
  const SearchedCharacteresEvent();

  @override
  List<Object?> get props => [];
}

class SearchedCharactersNextPageRequested extends SearchedCharacteresEvent {
  const SearchedCharactersNextPageRequested({
    this.name,
    this.type,
    this.species,
    this.status,
    this.gender,
  });

  final String? name;
  final String? type;
  final String? species;
  final CharacterStatus? status;
  final CharacterGender? gender;

  @override
  List<Object?> get props => [name, type, species, status, gender];
}

class SearchedCharactersCleared extends SearchedCharacteresEvent {
  const SearchedCharactersCleared();
}
