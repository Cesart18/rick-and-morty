part of 'searched_characteres_bloc.dart';

class SearchedCharacteresState extends Equatable {
  const SearchedCharacteresState({
    this.status = PaginatedDataStatus.initial,
    this.characters = const [],
    this.currentPage = 0,
    this.totalPages = 0,
    this.currentName,
    this.currentType,
    this.currentSpecies,
  });

  final PaginatedDataStatus status;
  final List<Character> characters;
  final int currentPage;
  final int totalPages;

  final String? currentName;
  final String? currentType;
  final String? currentSpecies;

  bool get hasMore => currentPage < totalPages;

  bool get isLoadingMore =>
      status == PaginatedDataStatus.waitingMore && characters.isNotEmpty;

  bool get isInitialLoading =>
      status == PaginatedDataStatus.waiting && characters.isEmpty;

  bool get isEmpty =>
      status == PaginatedDataStatus.loaded && characters.isEmpty;

  bool get hasError => status == PaginatedDataStatus.failure;

  @override
  List<Object?> get props => [
    status,
    characters,
    currentPage,
    totalPages,
    currentName,
    currentType,
    currentSpecies,
  ];

  SearchedCharacteresState copyWith({
    PaginatedDataStatus? status,
    List<Character>? characters,
    int? currentPage,
    int? totalPages,
    String? currentName,
    bool clearCurrentName = false,
    String? currentType,
    bool clearCurrentType = false,
    String? currentSpecies,
    bool clearCurrentSpecies = false,
  }) => SearchedCharacteresState(
    status: status ?? this.status,
    characters: characters ?? this.characters,
    currentPage: currentPage ?? this.currentPage,
    totalPages: totalPages ?? this.totalPages,
    currentName: clearCurrentName ? null : currentName ?? this.currentName,
    currentType: clearCurrentType ? null : currentType ?? this.currentType,
    currentSpecies: clearCurrentSpecies
        ? null
        : currentSpecies ?? this.currentSpecies,
  );
}
