import 'package:rick_and_morty/core/ui.dart';
import 'package:rick_and_morty/src/domain/domain.dart';
import 'package:rick_and_morty/src/presentation/character_details/character_details.dart';
import 'package:rick_and_morty/src/presentation/home/home.dart';

/// {@template app_router}
/// The root router for the app. Call [AppRouter.router] to get the router.
/// {@endtemplate}
class AppRouter {
  /// The root navigator key for the app. Use this to navigate from the root
  /// of the router (i.e. out of the bottom navigation bar).
  static final rootNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'root_navigator',
  );

  static final rootScaffoldKey = GlobalKey<ScaffoldState>(
    debugLabel: 'root_scaffold',
  );

  static const String rootPath = '/';

  /// The root router for the app. Singleton instance.
  static final GoRouter _router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: HomePage.path,
    routes: [
      GoRoute(
        path: HomePage.path,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: CharacterDetailsPage.path,
        builder: (context, state) {
          final character = state.extra! as Character;
          return CharacterDetailsPage(character: character);
        },
      ),
    ],
  );

  /// The root router for the app.
  static GoRouter get router => _router;
}
