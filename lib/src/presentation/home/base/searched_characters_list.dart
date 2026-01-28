part of 'package:rick_and_morty/src/presentation/home/base/home_page.dart';

/// {@template searched_characters_list}
/// Displays search results with filters and pagination.
/// {@endtemplate}
class _SearchedCharactersList extends StatefulWidget {
  /// {@macro searched_characters_list}
  const _SearchedCharactersList();

  @override
  State<_SearchedCharactersList> createState() =>
      _SearchedCharactersListState();
}

class _SearchedCharactersListState extends State<_SearchedCharactersList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_isNearBottom) return;
    _fetchNextPageIfNeeded();
  }

  void _fetchNextPageIfNeeded() {
    final searchedBloc = context.read<SearchedCharacteresBloc>();
    final homeState = context.read<_HomeBloc>().state;
    final state = searchedBloc.state;

    final isLoading = state.status.isWaiting || state.status.isWaitingMore;
    if (!isLoading && state.hasMore) {
      searchedBloc.add(
        SearchedCharactersNextPageRequested(
          name: homeState.debouncedName ?? homeState.nameInput,
          species: homeState.debouncedSpecies ?? homeState.speciesInput,
          type: homeState.debouncedType ?? homeState.typeInput,
          status: homeState.selectedStatus,
          gender: homeState.selectedGender,
        ),
      );
    }
  }

  bool get _isNearBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    return currentScroll >= maxScroll * 0.8;
  }

  @override
  Widget build(BuildContext context) {
    return _FilteredContentLayout(
      child: BlocBuilder<SearchedCharacteresBloc, SearchedCharacteresState>(
        buildWhen: (previous, current) =>
            previous.status != current.status ||
            previous.characters != current.characters,
        builder: (context, state) {
          if (state.status.isWaiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.hasError || state.isEmpty) {
            return Center(
              child: Text(
                _HomeStrings.noResultsFound,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: ColorValues.textSecondary(context),
                ),
              ),
            );
          }

          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: WidthValues.spacingLg,
                  crossAxisSpacing: WidthValues.spacing2Md,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final character = state.characters[index];
                    return _CharacterCard(character: character);
                  },
                  childCount: state.characters.length,
                ),
              ),
              if (state.status.isWaitingMore)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: WidthValues.spacingXl,
                    ),
                    child: Center(
                      child: SizedBox(
                        width: WidthValues.spacing9xl,
                        height: WidthValues.spacing9xl,
                        child: CircularProgressIndicator(
                          strokeWidth: WidthValues.spacingMd,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
