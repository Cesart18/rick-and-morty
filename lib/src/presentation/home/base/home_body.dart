part of 'package:rick_and_morty/src/presentation/home/base/home_page.dart';

// NOTE: Declare all the UI widgets here, including BlocBuilders.
/// {@template home_body}
/// Body of the HomePage.
/// {@endtemplate}
class _HomeBody extends StatefulWidget {
  /// {@macro home_body}
  const _HomeBody();

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> {
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
    final bloc = context.read<CharactersBloc>();
    final state = bloc.state;

    // Only fetch if not loading and has more pages
    final isLoading = state.status.isWaiting || state.status.isWaitingMore;
    if (!isLoading && state.hasMore) {
      bloc.add(const CharactersNextPageRequested());
    }
  }

  bool get _isNearBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    // Trigger when 80% of the list is scrolled
    return currentScroll >= maxScroll * 0.8;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
      builder: (context, state) {
        if (state.status.isWaiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: WidthValues.spacingLg),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: WidthValues.spacingLg,
                  crossAxisSpacing: WidthValues.spacing2Md,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final character = state.characters[index];
                  return _CharacterCard(character: character);
                }, childCount: state.characters.length),
              ),
            ),
            // Loading indicator at the bottom
            if (state.status.isWaitingMore)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
