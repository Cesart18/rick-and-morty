part of 'package:rick_and_morty/src/presentation/home/base/home_page.dart';

/// {@template home_state}
/// _HomeState description
/// {@endtemplate}
class _HomeState extends Equatable {
  /// {@macro home_state}
  const _HomeState({
    this.isSearchViewActive = false,
    this.nameInput = '',
    this.speciesInput = '',
    this.typeInput = '',
    this.debouncedName,
    this.debouncedSpecies,
    this.debouncedType,
    this.scrollToTopTimestamp,
    this.selectedStatus,
    this.selectedGender,
  });

  final bool isSearchViewActive;

  final String nameInput;
  final String speciesInput;
  final String typeInput;

  final String? debouncedName;
  final String? debouncedSpecies;
  final String? debouncedType;

  final DateTime? scrollToTopTimestamp;
  final CharacterStatus? selectedStatus;
  final CharacterGender? selectedGender;

  bool get hasSearchContent =>
      nameInput.isNotEmpty || speciesInput.isNotEmpty || typeInput.isNotEmpty;

  @override
  List<Object?> get props => [
    isSearchViewActive,
    nameInput,
    speciesInput,
    typeInput,
    debouncedName,
    debouncedSpecies,
    debouncedType,
    scrollToTopTimestamp,
    selectedStatus,
    selectedGender,
  ];

  _HomeState copyWith({
    bool? isSearchViewActive,
    String? nameInput,
    String? speciesInput,
    String? typeInput,
    String? debouncedName,
    bool clearDebouncedName = false,
    String? debouncedSpecies,
    bool clearDebouncedSpecies = false,
    String? debouncedType,
    bool clearDebouncedType = false,
    DateTime? scrollToTopTimestamp,
    CharacterStatus? selectedStatus,
    bool clearSelectedStatus = false,
    CharacterGender? selectedGender,
    bool clearSelectedGender = false,
  }) {
    return _HomeState(
      isSearchViewActive: isSearchViewActive ?? this.isSearchViewActive,
      nameInput: nameInput ?? this.nameInput,
      speciesInput: speciesInput ?? this.speciesInput,
      typeInput: typeInput ?? this.typeInput,
      debouncedName: clearDebouncedName
          ? null
          : debouncedName ?? this.debouncedName,
      debouncedSpecies: clearDebouncedSpecies
          ? null
          : debouncedSpecies ?? this.debouncedSpecies,
      debouncedType: clearDebouncedType
          ? null
          : debouncedType ?? this.debouncedType,
      scrollToTopTimestamp: scrollToTopTimestamp ?? this.scrollToTopTimestamp,
      selectedStatus: clearSelectedStatus
          ? null
          : selectedStatus ?? this.selectedStatus,
      selectedGender: clearSelectedGender
          ? null
          : selectedGender ?? this.selectedGender,
    );
  }
}
