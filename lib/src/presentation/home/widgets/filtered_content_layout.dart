part of '../base/home_page.dart';

class _FilteredContentLayout extends StatelessWidget {
  const _FilteredContentLayout({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: WidthValues.spacingLg),
      child: Column(
        children: [
          Sizer.gap(WidthValues.spacingMd),
          const _CharacterFilters(),
          Sizer.gap(WidthValues.spacingXl),
          Expanded(child: child),
        ],
      ),
    );
  }
}
