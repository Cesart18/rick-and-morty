part of 'searched_characteres_bloc.dart';

sealed class SearchedCharacteresEvent extends Equatable {
  const SearchedCharacteresEvent();

  @override
  List<Object> get props => [];
}

class CharactersSearched extends SearchedCharacteresEvent {
  const CharactersSearched({required this.query});

  final String query;

  @override
  List<Object> get props => [query];
}
