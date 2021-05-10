import 'package:flutter/material.dart';
import 'package:ayarla/constants/constants.dart';

class FloatingTextButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Gradient gradient;
  final Color color;

  /// • If you are using a [Row] for [floatingActionButton], consider to use
  ///
  /// [floatingActionButtonLocation]: [FloatingActionButtonLocation.centerFloat]
  /// for a good alignment in the Scaffold,
  FloatingTextButton({
    this.text,
    this.onPressed,
    this.gradient,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FloatingActionButton.extended(
      onPressed: onPressed,
      heroTag: null,
      elevation: 0,
      highlightElevation: 0,
      focusElevation: 0,
      focusColor: Colors.transparent,
      hoverElevation: 0,
      hoverColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      splashColor: Colors.white.withOpacity(0),
      label: Container(
        width: size.width < 700 ? size.width / 3 : 150,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color ?? Colors.orange,
          borderRadius: BorderRadius.circular(15),
          gradient: gradient ?? null,
        ),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: kTextStyle.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
