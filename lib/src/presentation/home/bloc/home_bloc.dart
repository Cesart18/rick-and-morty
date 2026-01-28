part of 'package:rick_and_morty/src/presentation/home/base/home_page.dart';

class _HomeBloc extends Bloc<_HomeEvent, _HomeState> {
  _HomeBloc() : super(const _HomeState()) {
    on<_NameInputChanged>(_onNameInputChanged);
    on<_SpeciesInputChanged>(_onSpeciesInputChanged);
    on<_TypeInputChanged>(_onTypeInputChanged);
    on<_SearchDebounceCompleted>(_onSearchDebounceCompleted);
    on<_ScrollToTopRequested>(_onScrollToTopRequested);
    on<_StatusSelected>(_onStatusSelected);
    on<_GenderSelected>(_onGenderSelected);
    on<_SearchCleared>(_onSearchCleared);
    on<_SearchViewToggled>(_onSearchViewToggled);
    on<_FiltersCleared>(_onFiltersCleared);
  }

  Timer? _debounceTimer;

  void _startDebounce() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      add(
        _SearchDebounceCompleted(
          name: state.nameInput.isNotEmpty ? state.nameInput : null,
          species: state.speciesInput.isNotEmpty ? state.speciesInput : null,
          type: state.typeInput.isNotEmpty ? state.typeInput : null,
        ),
      );
    });
  }

  void _onNameInputChanged(_NameInputChanged event, Emitter<_HomeState> emit) {
    emit(state.copyWith(nameInput: event.value, clearDebouncedName: true));
    _startDebounce();
  }

  void _onSpeciesInputChanged(
    _SpeciesInputChanged event,
    Emitter<_HomeState> emit,
  ) {
    emit(
      state.copyWith(speciesInput: event.value, clearDebouncedSpecies: true),
    );
    _startDebounce();
  }

  void _onTypeInputChanged(_TypeInputChanged event, Emitter<_HomeState> emit) {
    emit(state.copyWith(typeInput: event.value, clearDebouncedType: true));
    _startDebounce();
  }

  void _onSearchDebounceCompleted(
    _SearchDebounceCompleted event,
    Emitter<_HomeState> emit,
  ) {
    emit(
      state.copyWith(
        debouncedName: event.name,
        debouncedSpecies: event.species,
        debouncedType: event.type,
      ),
    );
  }

  void _onScrollToTopRequested(
    _ScrollToTopRequested event,
    Emitter<_HomeState> emit,
  ) {
    emit(state.copyWith(scrollToTopTimestamp: DateTime.now()));
  }

  void _onStatusSelected(_StatusSelected event, Emitter<_HomeState> emit) {
    emit(
      state.copyWith(
        selectedStatus: event.status,
        clearSelectedStatus: event.status == null,
      ),
    );
  }

  void _onGenderSelected(_GenderSelected event, Emitter<_HomeState> emit) {
    emit(
      state.copyWith(
        selectedGender: event.gender,
        clearSelectedGender: event.gender == null,
      ),
    );
  }

  void _onSearchCleared(_SearchCleared event, Emitter<_HomeState> emit) {
    _debounceTimer?.cancel();
    emit(const _HomeState());
  }

  void _onSearchViewToggled(
    _SearchViewToggled event,
    Emitter<_HomeState> emit,
  ) {
    emit(state.copyWith(isSearchViewActive: !state.isSearchViewActive));
  }

  void _onFiltersCleared(_FiltersCleared event, Emitter<_HomeState> emit) {
    emit(state.copyWith(clearSelectedStatus: true, clearSelectedGender: true));
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
