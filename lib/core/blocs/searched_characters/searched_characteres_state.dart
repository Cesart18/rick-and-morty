part of 'searched_characteres_bloc.dart';

enum SearchedCharacteresStatus {
  initial,
  waiting,
  loaded,
  failure;

  bool get isInitial => this == SearchedCharacteresStatus.initial;
  bool get isWaiting => this == SearchedCharacteresStatus.waiting;
  bool get isLoaded => this == SearchedCharacteresStatus.loaded;
  bool get isFailure => this == SearchedCharacteresStatus.failure;
}

enum SearchCharacterType {
  name,
  type,
  species;

  bool get isName => this == SearchCharacterType.name;
  bool get isType => this == SearchCharacterType.type;
  bool get isSpecies => this == SearchCharacterType.species;
}

class SearchedCharacteresState extends Equatable {
  const SearchedCharacteresState({
    this.status = SearchedCharacteresStatus.initial,
    this.type = SearchCharacterType.name,
    this.query = '',
  });

  final SearchedCharacteresStatus status;
  final SearchCharacterType type;
  final String query;

  @override
  List<Object> get props => [status, type, query];

  SearchedCharacteresState copyWith({
    SearchedCharacteresStatus? status,
    SearchCharacterType? type,
    String? query,
  }) => SearchedCharacteresState(
    status: status ?? this.status,
    type: type ?? this.type,
    query: query ?? this.query,
  );
}
