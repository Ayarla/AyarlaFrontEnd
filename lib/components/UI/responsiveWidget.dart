import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  const ResponsiveWidget({
    this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  });

  static bool isSmallScreen(BuildContext context) {
    /// 700
    return MediaQuery.of(context).size.width < 479;
  }

  static bool isLargeScreen(BuildContext context) {
    /// 1200
    return MediaQuery.of(context).size.width > 767;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 479 &&
        MediaQuery.of(context).size.width <= 767;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 767) {
          return largeScreen;
        } else if (constraints.maxWidth <= 767 &&
            constraints.maxWidth >= 479) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}
