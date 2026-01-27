part of '../home_page.dart';

class _CharacterFiltersListener extends BlocListener<_HomeBloc, _HomeState> {
  _CharacterFiltersListener()
    : super(
        listenWhen: (previous, current) =>
            previous.selectedStatus != current.selectedStatus ||
            previous.selectedGender != current.selectedGender,
        listener: (context, state) {
          context.read<CharactersBloc>().add(
            CharactersNextPageRequested(
              status: state.selectedStatus,
              gender: state.selectedGender,
            ),
          );
        },
      );
}
