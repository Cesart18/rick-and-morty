part of 'characters_bloc.dart';

class CharactersState extends Equatable {
  const CharactersState({
    this.status = PaginatedDataStatus.initial,
    this.characters = const [],
    this.currentPage = 0,
    this.totalPages = 0,
  });

  final PaginatedDataStatus status;
  final List<Character> characters;
  final int currentPage;
  final int totalPages;

  bool get hasMore => currentPage < totalPages;
  bool get isLoadingMore =>
      status == PaginatedDataStatus.waitingMore && characters.isNotEmpty;

  bool get isInitialLoading =>
      status == PaginatedDataStatus.waiting && characters.isEmpty;

  bool get isEmpty =>
      status == PaginatedDataStatus.loaded && characters.isEmpty;

  bool get hasError => status == PaginatedDataStatus.failure;

  @override
  List<Object?> get props => [status, characters, currentPage, totalPages];

  CharactersState copyWith({
    PaginatedDataStatus? status,
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
