import 'package:ayarla/components/core/expandable.dart';
import 'package:flutter/material.dart';

class AyarlaExpandable extends Expandable {
  /// Provides an expandable widget for general use.
  ///
  /// See [Expandable] for more details.
  AyarlaExpandable({
    Widget primaryWidget,
    Widget secondaryWidget,
    Function onPressed,
    Color backGroundColor,
    double elevation,
    ShapeBorder shape,
    Padding padding,
    Duration animationDuration,
    Duration beforeAnimationDuration,
  })  : assert(primaryWidget != null || secondaryWidget != null),
        super(
          primaryWidget: primaryWidget,
          secondaryWidget: secondaryWidget,
          onPressed: onPressed,
          backGroundColor: backGroundColor,
          elevation: elevation,
          shape: shape,
          animationDuration: animationDuration,
          beforeAnimationDuration: beforeAnimationDuration,
          padding: padding,
        );

  /// Provides an expandable widget for a long text.
  ///
  /// See [Expandable] for more details.
  AyarlaExpandable.singleTextChild({
    String text,
    Color backGroundColor,
    double elevation,
    Padding padding,
    int maxLines = 2,
    ShapeBorder shape,
    Duration animationDuration,
    Function onPressed,
  })  : assert(text != null),
        super(
          backGroundColor: backGroundColor,
          text: text,
          elevation: elevation,
          padding: padding,
          maxLines: maxLines,
          shape: shape,
          animationDuration: animationDuration,
          onPressed: onPressed,
        );
}
