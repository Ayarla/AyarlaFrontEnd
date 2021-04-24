import 'package:flutter/material.dart';

const kTitleStyle = TextStyle(
  fontSize: 22.0,
  color: Colors.black87,
  fontWeight: FontWeight.w900,
  fontFamily: 'Round_Bold',
  letterSpacing: 1,
);

const kSmallTitleStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.black87,
  fontWeight: FontWeight.w900,
  fontFamily: 'Round_Bold',
  letterSpacing: 1,
);

const kTextStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.black87,
  fontWeight: FontWeight.w900,
  fontFamily: 'Round_Regular',
  letterSpacing: 1,
);

const kTextStylewoSize = TextStyle(
  // fontSize: 20.0,
  color: Colors.white,
  fontWeight: FontWeight.w900,
  fontFamily: 'Round_Regular',
  letterSpacing: 1,
);

const kSmallTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  fontFamily: 'Round_Regular',
  letterSpacing: 1,
);

const kCardShadow = BoxDecoration(
  borderRadius: BorderRadius.all(
    Radius.circular(8),
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black,
      blurRadius: 10.0,
      //spreadRadius: 1.0,
      offset: Offset(
        0.0,
        2.0,
      ),
    ),
  ],
  color: Color(0xFFE5EBEE),
);

const roundedShape =
    RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)));

enum Directions {
  top,
  bottom,
  right,
  left,
  all,
  none,
}
List month = [
  "Ocak",
  "Şubat",
  "Mart",
  "Nisan",
  "Mayıs",
  "Haziran",
  "Temmuz",
  "Ağustos",
  "Eylül",
  "Ekim",
  "Kasım",
  "Aralık"
];

List week = [
  "Pazartesi",
  "Salı",
  "Çarşamba",
  "Perşembe",
  "Cuma",
  "Cumartesi",
  "Pazar"
];
