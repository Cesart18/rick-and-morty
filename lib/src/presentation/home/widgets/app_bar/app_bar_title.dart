part of '../../base/home_page.dart';

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return ClipRect(
          child: Align(
            alignment: Alignment.centerLeft,
            widthFactor: 1.0 - animation.value,
            child: Opacity(
              opacity: 1.0 - animation.value,
              child: child,
            ),
          ),
        );
      },
      child: GestureDetector(
        onTap: () => context.read<_HomeBloc>().add(
          const _ScrollToTopRequested(),
        ),
        child: Text(
          _HomeStrings.appBarTitle,
          style: context.textTheme.titleLarge?.copyWith(
            color: ColorValues.textPrimary(context),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
