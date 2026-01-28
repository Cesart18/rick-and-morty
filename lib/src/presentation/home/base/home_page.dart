import 'package:rick_and_morty/core/foundation.dart';
import 'package:rick_and_morty/core/ui.dart';
import 'package:rick_and_morty/src/domain/domain.dart';

part 'package:rick_and_morty/src/presentation/home/bloc/home_bloc.dart';
part 'package:rick_and_morty/src/presentation/home/bloc/home_event.dart';
part 'package:rick_and_morty/src/presentation/home/bloc/home_state.dart';

part 'package:rick_and_morty/src/presentation/home/base/home_body.dart';
part 'package:rick_and_morty/src/presentation/home/base/searched_body.dart';
part '../widgets/card/character_card.dart';
part '../widgets/card/character_image.dart';
part '../widgets/card/character_info.dart';

part '../widgets/custom_app_bar.dart';
part '../widgets/app_bar/app_bar_title.dart';
part '../widgets/app_bar/search_input.dart';
part '../widgets/app_bar/search_inputs_row.dart';
part '../widgets/app_bar/app_bar_search_toggle.dart';
part '../widgets/character_filters.dart';
part '../constants/home_strings.dart';

part 'listeners/seach_input_listener.dart';
part 'listeners/character_filters_listener.dart';
part 'listeners/search_view_listener.dart';

/// {@template home_page}
/// A description for HomePage
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({super.key});

  /// The path name of HomePage. Use for navigation.
  static const path = '/$routeName';

  /// The route name of HomePage. Use to navigate
  /// with named routes.
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _HomeBloc(),
      child: const Scaffold(appBar: CustomAppBar(), body: _HomeView()),
    );
  }
}

/// {@template home_view}
/// Displays the Body of HomeView
/// {@endtemplate}
class _HomeView extends StatelessWidget {
  /// {@macro home_view}
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        _SearchInputListener(),
        _CharacterFiltersListener(),
        _SearchViewListener(),
      ],
      child: BlocBuilder<_HomeBloc, _HomeState>(
        buildWhen: (previous, current) =>
            previous.isSearchViewActive != current.isSearchViewActive ||
            previous.hasSearchContent != current.hasSearchContent,
        builder: (context, state) {
          final showSearchResults =
              state.isSearchViewActive && state.hasSearchContent;
          return showSearchResults ? const _SearchedBody() : const _HomeBody();
        },
      ),
    );
  }
}
