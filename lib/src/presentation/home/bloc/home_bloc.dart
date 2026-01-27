part of 'package:rick_and_morty/src/presentation/home/base/home_page.dart';

class _HomeBloc extends Bloc<_HomeEvent, _HomeState> {
  _HomeBloc() : super(const _HomeState()) {
    on<SearchFormInputChanged>(_onSearchFormInputChanged);
    on<_SearchDebounceCompleted>(_onSearchDebounceCompleted);
    on<_ScrollToTopRequested>(_onScrollToTopRequested);
    on<_StatusSelected>(_onStatusSelected);
    on<_GenderSelected>(_onGenderSelected);
  }

  Timer? _debounceTimer;

  void _onSearchFormInputChanged(
    SearchFormInputChanged event,
    Emitter<_HomeState> emit,
  ) {
    emit(
      state.copyWith(
        searchFormInput: event.searchFormInput,
        clearDebouncedValue: true,
      ),
    );

    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      add(_SearchDebounceCompleted(event.searchFormInput.value));
    });
  }

  void _onSearchDebounceCompleted(
    _SearchDebounceCompleted event,
    Emitter<_HomeState> emit,
  ) {
    emit(state.copyWith(debouncedSearchValue: event.value));
  }

  void _onScrollToTopRequested(
    _ScrollToTopRequested event,
    Emitter<_HomeState> emit,
  ) {
    emit(state.copyWith(scrollToTopTimestamp: DateTime.now()));
  }

  void _onStatusSelected(_StatusSelected event, Emitter<_HomeState> emit) {
    emit(state.copyWith(
      selectedStatus: event.status,
      clearSelectedStatus: event.status == null,
    ));
  }

  void _onGenderSelected(_GenderSelected event, Emitter<_HomeState> emit) {
    emit(state.copyWith(
      selectedGender: event.gender,
      clearSelectedGender: event.gender == null,
    ));
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
