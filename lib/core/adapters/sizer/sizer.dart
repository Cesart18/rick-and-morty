import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/single_child_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Sizer extends SingleChildStatelessWidget {
  const Sizer({
    this.child,
    super.key,
  }) : super(child: child);

  final Widget? child;

  static double h(num height) => Adaptive.h(height);

  static double w(num width) => Adaptive.w(width);

  static Widget gap(double mainAxisExtent) => Gap(mainAxisExtent);

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    assert(
      child != null,
      '$runtimeType used outside of Nested must specify a child',
    );
    return ResponsiveSizer(builder: (p0, p1, p2) => child!);
  }
}
