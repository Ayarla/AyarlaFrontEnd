import 'package:flutter/material.dart';
import 'package:ayarla/constants/constants.dart';

class CircularParent extends StatelessWidget {
  final double radius;
  final Directions direction;
  final Color color;
  final Widget child;
  final Gradient gradient;
  final BoxShadow boxShadow;

  /// Provides a container that has circular edges.
  ///
  /// For an appbar with edges are circular, do not forget to set elevation : 0
  /// and background color: transparent for the current appbar.
  ///
  /// For a component, e.g for a Bottom Sheet, do not forget to set background
  /// color transparent for the current component.
  ///
  /// -> [radius] is required.
  ///
  /// -> [direction] is required.
  ///
  /// -> If [color] parameter is not attached, it will be null. Not transparent.
  ///

  CircularParent({
    @required this.radius,
    @required this.direction,
    this.color,
    this.child,
    this.gradient,
    this.boxShadow,
  });

  bool tl = false;
  bool tr = false;
  bool bl = false;
  bool br = false;

  setDirection() {
    if (direction == Directions.top) {
      tl = true;
      tr = true;
    } else if (direction == Directions.bottom) {
      bl = true;
      br = true;
    } else if (direction == Directions.all) {
      bl = true;
      br = true;
      tl = true;
      tr = true;
    } else if (direction == Directions.right) {
      tr = true;
      br = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    setDirection();
    return Container(
      decoration: BoxDecoration(
        color: color ?? null,
        gradient: gradient ?? null,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(tr ? radius : 0),
          topLeft: Radius.circular(tl ? radius : 0),
          bottomLeft: Radius.circular(bl ? radius : 0),
          bottomRight: Radius.circular(br ? radius : 0),
        ),
      ),
      child: child ?? null,
    );
  }
}
