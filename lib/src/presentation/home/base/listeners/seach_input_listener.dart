part of '../home_page.dart';

class _SearchInputListener extends BlocListener<_HomeBloc, _HomeState> {
  _SearchInputListener()
    : super(
        listenWhen: (previous, current) =>
            previous.debouncedSearchValue != current.debouncedSearchValue,
        listener: (context, state) {
          final searchValue = state.debouncedSearchValue;
          if (searchValue == null) return;

          // context.read<SearchedCharacteresBloc>().add(
          //   SearchCharacters(query: searchValue),
          // );

          // TODO: call the bloc to search the characters
        },
      );
}
