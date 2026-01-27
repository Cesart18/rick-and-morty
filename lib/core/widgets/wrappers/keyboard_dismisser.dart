import 'package:provider/single_child_widget.dart';
import 'package:rick_and_morty/core/ui.dart';

/// {@template keyboard_dismiss}
/// This widget dismisses the keyboard when the user taps outside of the
/// focused text field on the screen.
/// {@endtemplate}
class KeyboardDismisser extends SingleChildStatelessWidget {
  /// {@macro keyboard_dismiss}
  const KeyboardDismisser({this.child, super.key}) : super(child: child);

  final Widget? child;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    assert(
      child != null,
      '$runtimeType used outside of Nested must specify a child',
    );

    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}
