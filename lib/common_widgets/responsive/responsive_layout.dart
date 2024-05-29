import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobileScaffold,
    required this.desktopScaffold,
    required this.tabletScaffold,
  });
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth <= 995) {
        return mobileScaffold;
      } else if (constraint.maxWidth < 1420) {
        return tabletScaffold;
      } else {
        return desktopScaffold;
      }
    });
  }
}
