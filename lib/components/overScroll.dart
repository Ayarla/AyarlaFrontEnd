import 'package:flutter/material.dart';

class OverScroll extends StatelessWidget {
  final Widget child;

  /// Simple widget that removes the blue trailing in the Scrollable Widgets.
  ///
  /// You may consider to use BouncingScrollPhysics() for ListView.
  ///
  /// • [child] parameter is required.
  OverScroll({@required this.child});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      // ignore: missing_return
      onNotification: (overScroll) {
        overScroll.disallowGlow();
      },
      child: child,
    );
  }
}
