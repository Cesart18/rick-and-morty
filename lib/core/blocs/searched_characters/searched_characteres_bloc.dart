import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/foundation.dart';
import 'package:rick_and_morty/src/domain/domain.dart';

part 'searched_characteres_event.dart';
part 'searched_characteres_state.dart';

class SearchedCharacteresBloc
    extends Bloc<SearchedCharacteresEvent, SearchedCharacteresState> {
  SearchedCharacteresBloc({required GetCharactersUseCase useCase})
    : _useCase = useCase,
      super(const SearchedCharacteresState()) {
    on<SearchedCharactersNextPageRequested>(
      _onNextPageRequested,
      transformer: restartable(),
    );
    on<SearchedCharactersCleared>(_onCleared);
  }

  final GetCharactersUseCase _useCase;
  CancelToken? _cancelToken;
  GetCharactersParams _currentParams = GetCharactersParams();

  void _cancelCurrentRequest() {
    _cancelToken?.cancel(
      HttpConstants.cancelRequestMessage,
    );
    _cancelToken = CancelToken();
  }

  Future<void> _onNextPageRequested(
    SearchedCharactersNextPageRequested event,
    Emitter<SearchedCharacteresState> emit,
  ) async {
    final paramsChanged =
        event.name != _currentParams.name ||
        event.type != _currentParams.type ||
        event.species != _currentParams.species ||
        event.status != _currentParams.status ||
        event.gender != _currentParams.gender;

    if (paramsChanged) {
      _cancelCurrentRequest();
      emit(const SearchedCharacteresState());
    } else {
      final isLoading = state.status.isWaiting || state.status.isWaitingMore;
      if (isLoading || (!state.hasMore && !state.status.isInitial)) {
        return;
      }
      _cancelToken = CancelToken();
    }

    final nextPage = paramsChanged ? 1 : state.currentPage + 1;
    _currentParams = GetCharactersParams(
      page: nextPage,
      name: event.name,
      type: event.type,
      species: event.species,
      status: event.status,
      gender: event.gender,
    );

    final loadingStatus = state.characters.isEmpty || paramsChanged
        ? PaginatedDataStatus.waiting
        : PaginatedDataStatus.waitingMore;

    emit(
      state.copyWith(
        status: loadingStatus,
        currentName: event.name,
        currentType: event.type,
        currentSpecies: event.species,
      ),
    );

    await _fetchCharacters(
      emit,
      params: _currentParams,
      cancelToken: _cancelToken,
      append: !paramsChanged,
    );
  }

  void _onCleared(
    SearchedCharactersCleared event,
    Emitter<SearchedCharacteresState> emit,
  ) {
    _cancelCurrentRequest();
    _currentParams = GetCharactersParams();
    emit(const SearchedCharacteresState());
  }

  Future<void> _fetchCharacters(
    Emitter<SearchedCharacteresState> emit, {
    required GetCharactersParams params,
    CancelToken? cancelToken,
    bool append = false,
  }) async {
    final result = await _useCase.execute(params, cancelToken: cancelToken);

    result.resolve(
      (pageInfo) {
        final newCharacters = append
            ? [...state.characters, ...pageInfo.results]
            : pageInfo.results;

        emit(
          state.copyWith(
            status: PaginatedDataStatus.loaded,
            characters: newCharacters,
            currentPage: params.page ?? 1,
            totalPages: pageInfo.pages,
          ),
        );
      },
      (error) {
        if (error.message?.contains(
              HttpConstants.cancelledErrorMessage,
            ) ??
            false) {
          return;
        }

        emit(state.copyWith(status: PaginatedDataStatus.failure));
      },
    );
  }
}
