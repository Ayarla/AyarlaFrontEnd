import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ayarla/components/UI/linearGradientMask.dart';
import 'package:ayarla/constants/constants.dart';

/// GENERAL LOGO
Container generalLogo = Container(
  child: SizedBox(
    height: 100,
    child: Image(
      image: AssetImage('assets/genel_logo.png'),
      alignment: AlignmentDirectional.center,
    ),
  ),
);

/// NEW ICONS


String homeIconName = 'assets/icons/icon_home.svg';
String employeesIconName = 'assets/icons/icon_users.svg';
String calenderIconName = 'assets/icons/icon_calendar.svg';
String messageIconName = 'assets/icons/icon_message.svg';
String notesIconName = 'assets/icons/icon_notes.svg';

Widget notificationIcon = LinearGradientMask(
    child: SvgPicture.asset(
  'assets/icons/icon_bell.svg',
  // width: 70,
  color: Colors.white,
));

Widget settings2Icon = LinearGradientMask(
    child: SvgPicture.asset(
  'assets/icons/icon_settings2.svg',
  width: 40,
  color: Colors.white,
));

Widget settingsIcon = LinearGradientMask(
    child: SvgPicture.asset(
  'assets/icons/icon_settings.svg',
  width: 30,
  color: Colors.white,
));

Widget maleUserIcon = LinearGradientMask(
    child: SvgPicture.asset(
  'assets/icons/icon_user_male.svg',
  width: 35,
  color: Colors.white,
));

Widget femaleUserIcon = LinearGradientMask(
    child: SvgPicture.asset(
  'assets/icons/icon_user_female.svg',
  width: 35,
  color: Colors.white,
));

Widget addUserIcon = LinearGradientMask(
    child: SvgPicture.asset(
  'assets/icons/icon_add_user.svg',
  width: 35,
  color: Colors.white,
));

class HeartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LinearGradientMask(
        child: SvgPicture.asset(
      'assets/icons/icon_heart.svg',
      width: 30,
      color: Colors.white,
    ));
  }
}

Widget heartIcon = LinearGradientMask(
    child: SvgPicture.asset(
  'assets/icons/icon_heart.svg',
  width: 40,
  color: Colors.white,
));

Widget searchIcon = LinearGradientMask(
    child: SvgPicture.asset(
  'assets/icons/icon_search.svg',
  width: 40,
  color: Colors.white,
));

/// APPBAR TEXTS
class AppBarTitleCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Merhaba Nilsu",
            style: kTitleStyle.copyWith(
                color: Colors.white,
                fontSize: size.width < 700 ? size.width / 31.8 : 22),
          ),
          Text(
            "Haydi randevunu ayarlayalım!",
            style: kSmallTextStyle.copyWith(
                fontSize: size.width < 700 ? size.width / 50 : 14),
          )
        ],
      ),
    );
  }
}

Container appBarTitleCustomer = Container(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Merhaba Nilsu",
        style: kTitleStyle.copyWith(color: Colors.white),
      ),
      Text(
        "Haydi randevunu ayarlayalım!",
        style: kSmallTextStyle,
      )
    ],
  ),
);

Row appBarTitleManager = Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    SizedBox(width: 10),
    Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "Merhaba Nilsu",
              style: kTitleStyle.copyWith(color: Colors.white),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "Haydi işletmeni ayarlayalım!",
              style: kSmallTextStyle.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    ),
  ],
);

class AppBarTitleFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Center(
        child: Text(
          "Favorilerim",
          style: kTitleStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
