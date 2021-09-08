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

const roundedShape = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)));

enum Directions {
  top,
  bottom,
  right,
  left,
  all,
  none,
}

enum Gender { female, male, unisex }

List<String> month = [
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

List<String> week = ["Pazartesi", "Salı", "Çarşamba", "Perşembe", "Cuma", "Cumartesi", "Pazar"];

List<String> dividedHours = <String>[
  '00:00',
  '00:30',
  '01:30',
  '02:00',
  '02:30',
  '03:00',
  '03:30',
  '04:00',
  '04:30',
  '05:00',
  '05:30',
  '06:00',
  '06:30',
  '07:00',
  '07:30',
  '08:00',
  '08:30',
  '09:00',
  '09:30',
  '10:00',
  '10:30',
  '11:00',
  '11:30',
  '12:00',
  '12:30',
  '13:00',
  '13:30',
  '14:00',
  '14:30',
  '15:00',
  '15:30',
  '16:00',
  '16:30',
  '17:00',
  '17:30',
  '18:00',
  '18:30',
  '19:00',
  '19:30',
  '20:00',
  '20:30',
  '21:00',
  '21:30',
  '22:00',
  '22:30',
  '23:00',
  '23:30',
];

List<String> dividedMinutes = <String>[
  '0',
  '5',
  '10',
  '15',
  '20',
  '25',
  '30',
  '35',
  '40',
  '45',
  '50',
  '55',
  '60'
];

List<String> nameList = [
  "Favorilerim",
  "Randevularım",
  "Mesajlarım",
  "Yorumlarım",
];

List<Color> colorList = [
  Colors.red,
  Colors.green,
  Colors.yellow,
];

List<IconData> iconList = [
  Icons.favorite_border_outlined,
  Icons.date_range_outlined,
  Icons.chat_outlined,
  Icons.chat_outlined,
];

List<String> userFireBaseFunctions = [
  'user_favorites',
  'user_appointments',
  'user_messages',
  'user_edit_profile',
];
