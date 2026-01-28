part of '../../base/home_page.dart';

class _AppBarSearchToggle extends StatelessWidget {
  const _AppBarSearchToggle({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<_HomeBloc, _HomeState>(
      buildWhen: (previous, current) =>
          previous.isSearchViewActive != current.isSearchViewActive,
      builder: (context, state) {
        return IconButton(
          onPressed: onPressed,
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              state.isSearchViewActive ? Icons.close : Icons.search,
              key: ValueKey(state.isSearchViewActive),
              color: ColorValues.primary,
            ),
          ),
        );
      },
    );
  }
}
