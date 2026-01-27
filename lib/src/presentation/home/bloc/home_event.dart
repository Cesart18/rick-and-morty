part of 'package:rick_and_morty/src/presentation/home/base/home_page.dart';

abstract class _HomeEvent extends Equatable {
  const _HomeEvent();

  @override
  List<Object?> get props => [];
}

class SearchFormInputChanged extends _HomeEvent {
  const SearchFormInputChanged({required this.searchFormInput});

  final SearchFormInput searchFormInput;

  @override
  List<Object?> get props => [searchFormInput];
}

class _SearchDebounceCompleted extends _HomeEvent {
  const _SearchDebounceCompleted(this.value);

  final String value;
}

class _ScrollToTopRequested extends _HomeEvent {
  const _ScrollToTopRequested();
}

class _StatusSelected extends _HomeEvent {
  const _StatusSelected({this.status});

  final CharacterStatus? status;
}

class _GenderSelected extends _HomeEvent {
  const _GenderSelected({this.gender});

  final CharacterGender? gender;
}
