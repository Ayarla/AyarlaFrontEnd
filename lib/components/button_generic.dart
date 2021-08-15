import 'package:ayarla/constants/constants.dart';
import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final bool showShadow;

  GenericButton({
    this.onPressed,
    @required this.text,
    this.icon,
    this.iconColor,
    this.backgroundColor,
    this.showShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      onPressed: onPressed,
      child: Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: showShadow
              ? [BoxShadow(color: Colors.black12, offset: Offset(0.0, 3), blurRadius: 5)]
              : null,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 20),
              child: Icon(
                icon,
                size: size.width <= 400 ? size.width / 16.6 : 24,
                color: iconColor ?? Colors.black,
              ),
            ),
            Text(
              text,
              style: kTextStyle.copyWith(
                  color: iconColor, fontSize: size.width <= 400 ? size.width / 20 : 20),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.keyboard_arrow_right,
                size: size.width <= 400 ? size.width / 16.6 : 24,
                color: iconColor ?? Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
