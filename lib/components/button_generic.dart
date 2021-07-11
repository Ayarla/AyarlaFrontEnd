import 'package:ayarla/constants/constants.dart';
import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final IconData icon;
  final Color iconColor;

  GenericButton({
    this.onPressed,
    @required this.text,
    @required this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextButton(
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent)),
      onPressed: onPressed,
      child: Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 3),
              blurRadius: 5,
            ),
          ],
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
                  fontSize: size.width <= 400 ? size.width / 20 : 20),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.keyboard_arrow_right,
                size: size.width <= 400 ? size.width / 16.6 : 24,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
