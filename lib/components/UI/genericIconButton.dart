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
  final double width;
  final double height;
  final Axis axis;

  /// • [width] & [height] are size.width / 3 by default.
  ///
  /// • [width] & [height] override iconSize when an icon is mounted by iconContext.
  ///
  /// • Consider [width] & [height] > [iconSize] when this is the case.
  ///
  /// • [axis] is vertical by default. [Axis.vertical], namely.
  ///
  /// • For [opacity], use [Colors.xxx.withOpacity()] for [color] parameter,
  /// [opacity] must be between 0.0 and 1.0
  GenericIconButton({
    this.iconContext,
    this.text,
    this.color,
    this.onPressed,
    this.textStyle,
    this.spaceBetween,
    this.width,
    this.height,
    this.axis,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
        width: width ?? size.width / 3,
        height: height ?? size.width / 3,
        child: Card(
          color: color ?? Colors.transparent,
          shape: roundedShape,
          elevation: 0,
          child: (axis ?? Axis.vertical) == Axis.vertical
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    iconContext,
                    SizedBox(height: spaceBetween ?? 5),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: TextOverFlowHandler(
                        child: Text(
                          text,
                          style: textStyle ??
                              kTextStyle.copyWith(fontSize: 18, color: Color(0xFF2D3B4A)),
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    iconContext,
                    SizedBox(height: spaceBetween ?? 5),
                    TextOverFlowHandler(
                      child: Text(
                        text,
                        style: textStyle ??
                            kTextStyle.copyWith(fontSize: 18, color: Color(0xFF2D3B4A)),
                      ),
                    ),
                  ],
                ),
        ),
      ),
      onTap: onPressed,
    );
  }
}
