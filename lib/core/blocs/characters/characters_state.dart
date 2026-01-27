part of 'characters_bloc.dart';

enum CharactersStatus {
  initial,
  waiting,
  waitingMore,
  loaded,
  failure;

  bool get isInitial => this == CharactersStatus.initial;
  bool get isWaiting => this == CharactersStatus.waiting;
  bool get isWaitingMore => this == CharactersStatus.waitingMore;
  bool get isLoaded => this == CharactersStatus.loaded;
  bool get isFailure => this == CharactersStatus.failure;
}

class CharactersState extends Equatable {
  const CharactersState({
    this.status = CharactersStatus.initial,
    this.characters = const [],
    this.currentPage = 0,
    this.totalPages = 0,
  });

  final CharactersStatus status;
  final List<Character> characters;
  final int currentPage;
  final int totalPages;

  bool get hasMore => currentPage < totalPages;
  bool get isLoadingMore =>
      status == CharactersStatus.waitingMore && characters.isNotEmpty;

  bool get isInitialLoading =>
      status == CharactersStatus.waiting && characters.isEmpty;

  bool get isEmpty => status == CharactersStatus.loaded && characters.isEmpty;

  bool get hasError => status == CharactersStatus.failure;

  @override
  List<Object?> get props => [status, characters, currentPage, totalPages];

  CharactersState copyWith({
    CharactersStatus? status,
    List<Character>? characters,
    int? currentPage,
    int? totalPages,
  }) => CharactersState(
    status: status ?? this.status,
    characters: characters ?? this.characters,
    currentPage: currentPage ?? this.currentPage,
    totalPages: totalPages ?? this.totalPages,
  );
}
