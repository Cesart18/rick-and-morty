import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/foundation.dart';
import 'package:rick_and_morty/src/domain/domain.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc({required GetCharactersUseCase useCase})
    : _useCase = useCase,
      super(const CharactersState()) {
    on<CharactersNextPageRequested>(
      _onNextPageRequested,
      transformer: droppable(),
    );
    on<CharactersCleared>(_onCleared);

    add(const CharactersNextPageRequested());
  }

  final GetCharactersUseCase _useCase;

  CancelToken? _cancelToken;

  GetCharactersParams _currentParams = GetCharactersParams();

  void _cancelCurrentRequest() {
    _cancelToken?.cancel(HttpConstants.cancelRequestMessage);
    _cancelToken = CancelToken();
  }

  Future<void> _onNextPageRequested(
    CharactersNextPageRequested event,
    Emitter<CharactersState> emit,
  ) async {
    final filtersChanged =
        event.gender != _currentParams.gender ||
        event.status != _currentParams.status;

    if (filtersChanged) {
      _cancelCurrentRequest();
      emit(const CharactersState());
    } else {
      final isLoading = state.status.isWaiting || state.status.isWaitingMore;
      if (isLoading || (!state.hasMore && !state.status.isInitial)) {
        return;
      }
      _cancelToken = CancelToken();
    }

    final nextPage = filtersChanged ? 1 : state.currentPage + 1;
    _currentParams = GetCharactersParams(
      page: nextPage,
      status: event.status,
      gender: event.gender,
    );

    final loadingStatus = state.characters.isEmpty || filtersChanged
        ? PaginatedDataStatus.waiting
        : PaginatedDataStatus.waitingMore;

    emit(state.copyWith(status: loadingStatus));

    await _fetchCharacters(
      emit,
      params: _currentParams,
      cancelToken: _cancelToken,
      append: !filtersChanged,
    );
  }

  void _onCleared(CharactersCleared event, Emitter<CharactersState> emit) {
    _cancelCurrentRequest();
    _currentParams = GetCharactersParams();
    emit(const CharactersState());
  }

  Future<void> _fetchCharacters(
    Emitter<CharactersState> emit, {
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
