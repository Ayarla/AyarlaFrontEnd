import 'package:ayarla/components/textOverFlowHandler.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/constants/constants.dart';

class FloatingButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Gradient gradient;
  final Color color;

  FloatingButton({
    this.text,
    this.onPressed,
    this.gradient,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      heroTag: null,
      elevation: 0,
      backgroundColor: Colors.transparent,
      highlightElevation: 0,
      label: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color ?? Colors.orange,
          borderRadius: BorderRadius.circular(15),
          gradient: gradient ?? null,
        ),
        child: Center(
          child: TextOverFlowHandler(
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
