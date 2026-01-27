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
    final charactersBloc = context.read<CharactersBloc>();
    final homeState = context.read<_HomeBloc>().state;
    final state = charactersBloc.state;

    final isLoading = state.status.isWaiting || state.status.isWaitingMore;
    if (!isLoading && state.hasMore) {
      charactersBloc.add(
        CharactersNextPageRequested(
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

  void _scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: WidthValues.spacingLg),
      child: Column(
        spacing: WidthValues.spacing2xl,
        children: [
          const _CharacterFilters(),

          Expanded(
            child: BlocListener<_HomeBloc, _HomeState>(
              listenWhen: (previous, current) =>
                  previous.scrollToTopTimestamp !=
                      current.scrollToTopTimestamp &&
                  current.scrollToTopTimestamp != null,
              listener: (context, state) => _scrollToTop(),

              child: BlocBuilder<CharactersBloc, CharactersState>(
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
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final character = state.characters[index];

                          return _CharacterCard(character: character);
                        }, childCount: state.characters.length),
                      ),

                      if (state.status.isWaitingMore)
                        const SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Center(
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
