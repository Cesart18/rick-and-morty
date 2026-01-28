part of '../home_page.dart';

class _SearchInputListener extends BlocListener<_HomeBloc, _HomeState> {
  _SearchInputListener()
    : super(
        listenWhen: (previous, current) =>
            previous.debouncedName != current.debouncedName ||
            previous.debouncedSpecies != current.debouncedSpecies ||
            previous.debouncedType != current.debouncedType,
        listener: (context, state) {
          if (!state.hasSearchContent) return;

          context.read<SearchedCharacteresBloc>().add(
            SearchedCharactersNextPageRequested(
              name: state.debouncedName,
              species: state.debouncedSpecies,
              type: state.debouncedType,
              status: state.selectedStatus,
              gender: state.selectedGender,
            ),
          );
        },
      );
}
