import 'package:provider/single_child_widget.dart';
import 'package:rick_and_morty/core/ui.dart';

class AccesibilityOverrides extends SingleChildStatelessWidget {
  const AccesibilityOverrides({this.child, super.key}) : super(child: child);

  final Widget? child;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    assert(
      child != null,
      '$runtimeType used outside of Nested must specify a child',
    );
    // Clamp text scale factor to prevent extreme scaling
    // minScaleFactor must be strictly less than maxScaleFactor
    final constrainedTextScaleFactor = MediaQuery.textScalerOf(
      context,
    ).clamp(minScaleFactor: 0.8, maxScaleFactor: 1.2);
    return MediaQuery(
      data: MediaQuery.of(
        context,
      ).copyWith(textScaler: constrainedTextScaleFactor),
      child: child!,
    );
  }
}
