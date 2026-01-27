part of 'characters_bloc.dart';

sealed class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object?> get props => [];
}

class CharactersNextPageRequested extends CharactersEvent {
  const CharactersNextPageRequested({this.gender, this.status});

  final CharacterStatus? status;
  final CharacterGender? gender;
}

class CharactersCleared extends CharactersEvent {
  const CharactersCleared();
}
