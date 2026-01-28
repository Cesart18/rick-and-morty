part of 'package:rick_and_morty/src/presentation/home/base/home_page.dart';

/// {@template home_body}
/// Body of the HomePage that decides which content to display.
/// {@endtemplate}
class _HomeBody extends StatelessWidget {
  /// {@macro home_body}
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<_HomeBloc, _HomeState>(
      buildWhen: (previous, current) =>
          previous.isSearchViewActive != current.isSearchViewActive ||
          previous.hasSearchContent != current.hasSearchContent,
      builder: (context, state) {
        final showSearchResults =
            state.isSearchViewActive && state.hasSearchContent;
        return showSearchResults
            ? const _SearchedCharactersList()
            : const _CharactersList();
      },
    );
  }
}
