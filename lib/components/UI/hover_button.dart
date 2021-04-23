import 'package:ayarla/constants/constants.dart';
import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color shadowColor;

  /// • A button that changes its appearance on hover, designed for web.
  ///
  /// • More features will be added.
  ///
  /// • [text] & [onPressed] are available for now.
  HoverButton({
    this.text,
    this.onPressed,
    this.backgroundColor,
    this.shadowColor,
    this.textColor,
  });

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width < 700 ? 150 : size.width / 5,
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 1),
      decoration: BoxDecoration(
        color: isHovered ? Colors.green : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: isHovered ? Colors.green : Colors.black12,
            offset: Offset(0.0, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: InkWell(
        onTap: widget.onPressed,
        onHover: (isHovering) {
          if (isHovering) {
            setState(() {
              isHovered = true;
            });
          } else
            setState(() {
              isHovered = false;
            });
        },
        child: Center(
          child: FittedBox(
            child: Text(
              widget.text,
              style: kTextStyle.copyWith(
                  color: isHovered ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}