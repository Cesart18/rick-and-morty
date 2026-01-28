part of 'package:rick_and_morty/src/presentation/home/base/home_page.dart';

abstract class _HomeEvent extends Equatable {
  const _HomeEvent();

  @override
  List<Object?> get props => [];
}

class _NameInputChanged extends _HomeEvent {
  const _NameInputChanged(this.value);
  final String value;
}

class _SpeciesInputChanged extends _HomeEvent {
  const _SpeciesInputChanged(this.value);
  final String value;
}

class _TypeInputChanged extends _HomeEvent {
  const _TypeInputChanged(this.value);
  final String value;
}

class _SearchDebounceCompleted extends _HomeEvent {
  const _SearchDebounceCompleted({this.name, this.species, this.type});

  final String? name;
  final String? species;
  final String? type;
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

class _SearchCleared extends _HomeEvent {
  const _SearchCleared();
}

class _FiltersCleared extends _HomeEvent {
  const _FiltersCleared();
}

class _SearchViewToggled extends _HomeEvent {
  const _SearchViewToggled();
}
