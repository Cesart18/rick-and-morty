part of 'package:rick_and_morty/src/presentation/home/base/home_page.dart';

/// {@template home_state}
/// _HomeState description
/// {@endtemplate}
class _HomeState extends Equatable {
  /// {@macro home_state}
  const _HomeState({
    this.searchFormInput = const SearchFormInput.pure(),
    this.debouncedSearchValue,
    this.scrollToTopTimestamp,
    this.selectedStatus,
    this.selectedGender,
  });

  final SearchFormInput searchFormInput;

  final String? debouncedSearchValue;

  final DateTime? scrollToTopTimestamp;
  final CharacterStatus? selectedStatus;
  final CharacterGender? selectedGender;

  @override
  List<Object?> get props => [
    searchFormInput,
    debouncedSearchValue,
    scrollToTopTimestamp,
    selectedStatus,
    selectedGender,
  ];

  _HomeState copyWith({
    SearchFormInput? searchFormInput,
    String? debouncedSearchValue,
    bool clearDebouncedValue = false,
    DateTime? scrollToTopTimestamp,
    CharacterStatus? selectedStatus,
    bool clearSelectedStatus = false,
    CharacterGender? selectedGender,
    bool clearSelectedGender = false,
  }) {
    return _HomeState(
      searchFormInput: searchFormInput ?? this.searchFormInput,
      debouncedSearchValue: clearDebouncedValue
          ? null
          : debouncedSearchValue ?? this.debouncedSearchValue,
      scrollToTopTimestamp: scrollToTopTimestamp ?? this.scrollToTopTimestamp,
      selectedStatus:
          clearSelectedStatus ? null : selectedStatus ?? this.selectedStatus,
      selectedGender:
          clearSelectedGender ? null : selectedGender ?? this.selectedGender,
    );
  }
}
