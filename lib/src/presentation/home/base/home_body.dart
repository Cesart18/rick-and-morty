part of 'package:rick_and_morty/src/presentation/home/base/home_page.dart';

// NOTE: Declare all the UI widgets here, including BlocBuilders.
/// {@template home_body}
/// Body of the HomePage.
/// {@endtemplate}
class _HomeBody extends StatelessWidget {
  /// {@macro home_body}
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<_HomeBloc, _HomeState>(
      builder: (context, state) {
        return const Center(child: Text('HomePage'));
      },
    );
  }
}
