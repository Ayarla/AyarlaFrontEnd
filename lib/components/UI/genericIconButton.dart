import 'dart:ui';
import 'package:ayarla/components/textOverFlowHandler.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/constants/constants.dart';

class GenericIconButton extends StatelessWidget {
  final Widget iconContext;
  final String text;
  final TextStyle textStyle;
  final Color color;
  final Function onPressed;
  final double spaceBetween;
  final Axis axis;
  final EdgeInsets padding;
  final double width;

  /// • [axis] is vertical by default. [Axis.vertical], namely.
  ///
  /// • For [opacity], use [Colors.xxx.withOpacity()] for [color] parameter,
  /// [opacity] must be between 0.0 and 1.0
  GenericIconButton({
    this.iconContext,
    this.text,
    this.color = Colors.transparent,
    this.onPressed,
    this.textStyle,
    this.spaceBetween = 5,
    this.axis = Axis.vertical,
    this.padding = const EdgeInsets.all(8.0),
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: color,
        shape: roundedShape,
        elevation: 0,
        child: Container(
          width: width ?? null,
          padding: padding,
          child: Flex(
            mainAxisSize: MainAxisSize.max,
            direction: axis,
            children: [
              iconContext,
              axis == Axis.vertical
                  ? SizedBox(height: spaceBetween)
                  : SizedBox(width: spaceBetween),
              // Spacer(),
              TextOverFlowHandler(
                child: Text(
                  text,
                  style: textStyle ?? kTextStyle.copyWith(fontSize: 18, color: Color(0xFF2D3B4A)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
