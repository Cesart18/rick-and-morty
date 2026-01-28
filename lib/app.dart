import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rick_and_morty/config.dart';
import 'package:rick_and_morty/core/foundation.dart';
import 'package:rick_and_morty/core/ui.dart';
import 'package:rick_and_morty/src/domain/domain.dart';
import 'package:rick_and_morty/src/router/app_router.dart';

class App extends StatelessWidget {
  const App({required this.config, super.key});

  final Config config;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _dependencies(config),
      child: MaterialApp.router(
        title: 'Rick and morty',
        theme: AppTheme.getTheme(context),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}

List<SingleChildWidget> _dependencies(Config config) {
  return [
    RepositoryProvider.value(value: config.characterRepository),

    BlocProvider(
      create: (context) => CharactersBloc(
        useCase: GetCharactersUseCase(
          characterRepository: config.characterRepository,
        ),
      ),
    ),
    BlocProvider(
      create: (context) => SearchedCharacteresBloc(
        useCase: GetCharactersUseCase(
          characterRepository: config.characterRepository,
        ),
      ),
    ),
  ];
}
