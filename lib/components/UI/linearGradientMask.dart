import 'package:flutter/material.dart';

class LinearGradientMask extends StatelessWidget {
  final Widget child;
  final Color firstColor;
  final Color secondColor;
  final Alignment alignment;
  final double radius;

  /// • Applies a ShaderMask to its child.
  ///
  /// • Not supported by web.
  ///
  /// • [child] parameter is required.
  LinearGradientMask(
      {@required this.child,
      this.firstColor,
      this.secondColor,
      this.alignment,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return RadialGradient(
          center: Alignment.bottomLeft,
          radius: radius ?? 1.7,
          colors: [firstColor ?? Colors.blue, secondColor ?? Colors.red],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
