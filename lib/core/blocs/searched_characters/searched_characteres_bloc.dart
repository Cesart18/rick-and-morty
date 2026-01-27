import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'searched_characteres_event.dart';
part 'searched_characteres_state.dart';

class SearchedCharacteresBloc
    extends Bloc<SearchedCharacteresEvent, SearchedCharacteresState> {
  SearchedCharacteresBloc() : super(const SearchedCharacteresState());
}
