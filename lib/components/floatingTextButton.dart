import 'package:flutter/material.dart';
import 'package:ayarla/constants/constants.dart';

class FloatingTextButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Gradient gradient;
  final Color color;

  /// • For a good alignment in the Scaffold, use
  ///
  /// [floatingActionButtonLocation]: [FloatingActionButtonLocation.centerFloat],
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
      backgroundColor: Colors.transparent,
      highlightElevation: 0,
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
