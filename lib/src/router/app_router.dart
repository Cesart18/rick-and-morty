import 'package:rick_and_morty/core/ui.dart';
import 'package:rick_and_morty/src/presentation/home/home.dart';
// ignore_for_file: lines_longer_than_80_chars

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

  /// The root router for the app. Set [debug] to true to enable debug logging
  /// diagnostics.
  static GoRouter router({bool debug = false}) => GoRouter(
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: debug,
    initialLocation: HomePage.path,
    routes: [
      GoRoute(
        path: HomePage.path,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
