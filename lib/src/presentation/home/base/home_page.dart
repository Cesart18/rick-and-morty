import 'package:rick_and_morty/core/foundation.dart';
import 'package:rick_and_morty/core/ui.dart';
import 'package:rick_and_morty/src/domain/domain.dart';

part 'package:rick_and_morty/src/presentation/home/bloc/home_bloc.dart';
part 'package:rick_and_morty/src/presentation/home/bloc/home_event.dart';
part 'package:rick_and_morty/src/presentation/home/bloc/home_state.dart';

part 'package:rick_and_morty/src/presentation/home/base/home_body.dart';
part '../widgets/card/character_card.dart';
part '../widgets/card/character_image.dart';
part '../widgets/card/character_info.dart';

part '../widgets/custom_app_bar.dart';
part '../constants/home_strings.dart';

part 'listeners/seach_input_listener.dart';

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

// NOTE: Declare all BlocListeners of Home here to handle navigation,
// showing dialogs, etc.
/// {@template home_view}
/// Displays the Body of HomeView
/// {@endtemplate}
///
class _HomeView extends StatelessWidget {
  /// {@macro home_view}
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [_SearchInputListener()],
      child: const _HomeBody(),
    );
  }
}
