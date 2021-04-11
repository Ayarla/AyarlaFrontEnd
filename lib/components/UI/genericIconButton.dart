import 'dart:ui';
import 'package:ayarla/components/textOverFlowHandler.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/constants/constants.dart';

class GenericIconButton extends StatelessWidget {
  final Widget iconContext;
  final String text;
  final Color color;
  final Function onPressed;
  final TextStyle textStyle;
  final double spaceBetween;

  /// • For [opacity] use [Colors.xxx.withOpacity()],
  ///
  /// [opacity] must be between 0.0 and 1.0
  GenericIconButton({
    this.iconContext,
    this.text,
    this.color,
    this.onPressed,
    this.textStyle,
    this.spaceBetween,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: color ?? Colors.white,
        shape: roundedShape,
        elevation: 0,
        child: Column(
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
      onTap: onPressed,
    );
  }
}

