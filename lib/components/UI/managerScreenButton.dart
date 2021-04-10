import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:randevudemo/constants/constants.dart';

class ManagerScreenButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final String routeID;
  final Color color;

  /// • For [opacity] use [Colors.xxx.withOpacity()],
  ///
  /// [opacity] must be between 0.0 and 1.0
  ManagerScreenButton({this.icon, this.text, this.routeID, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: color ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            SizedBox(height: 5),
            FittedBox(
              fit: BoxFit.cover,
              child: Text(
                text,
                style:
                    kTextStyle.copyWith(fontSize: 18, color: Color(0xFF2D3B4A)),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, routeID);
      },
    );
  }
}
