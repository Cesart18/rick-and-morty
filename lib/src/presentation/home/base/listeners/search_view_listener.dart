part of '../home_page.dart';

class _SearchViewListener extends BlocListener<_HomeBloc, _HomeState> {
  _SearchViewListener()
    : super(
        listenWhen: (previous, current) =>
            previous.isSearchViewActive != current.isSearchViewActive,
        listener: (context, state) {
          if (!state.isSearchViewActive) {
            context.read<CharactersBloc>().add(
              CharactersNextPageRequested(
                status: state.selectedStatus,
                gender: state.selectedGender,
              ),
            );
          } else if (state.hasSearchContent) {
            context.read<SearchedCharacteresBloc>().add(
              SearchedCharactersNextPageRequested(
                name: state.debouncedName ?? state.nameInput,
                species: state.debouncedSpecies ?? state.speciesInput,
                type: state.debouncedType ?? state.typeInput,
                status: state.selectedStatus,
                gender: state.selectedGender,
              ),
            );
          }
        },
      );
}
