part of 'package:rick_and_morty/src/presentation/home/base/home_page.dart';

/// {@template home_state}
/// _HomeState description
/// {@endtemplate}
class _HomeState extends Equatable {
  /// {@macro home_state}
  const _HomeState({
    this.searchFormInput = const SearchFormInput.pure(),
    this.debouncedSearchValue,
  });

  final SearchFormInput searchFormInput;

  final String? debouncedSearchValue;

  @override
  List<Object?> get props => [searchFormInput, debouncedSearchValue];

  /// Creates a copy of the current _HomeState with property change
  _HomeState copyWith({
    SearchFormInput? searchFormInput,
    String? debouncedSearchValue,
    bool clearDebouncedValue = false,
  }) {
    return _HomeState(
      searchFormInput: searchFormInput ?? this.searchFormInput,
      debouncedSearchValue: clearDebouncedValue
          ? null
          : debouncedSearchValue ?? this.debouncedSearchValue,
    );
  }
}
