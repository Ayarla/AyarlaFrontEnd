import 'package:ayarla/components/UI/responsiveWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ayarla/components/UI/linearGradientMask.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';

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
Widget homeIcon = LinearGradientMask(
    child: SvgPicture.asset(
  'assets/icons/icon_home.svg',
  width: 70,
  color: Colors.white,
));

Widget employeesIcon = LinearGradientMask(
    child: SvgPicture.asset(
  'assets/icons/icon_users.svg',
  width: 70,
  color: Colors.white,
));

Widget calenderIcon = LinearGradientMask(
    child: SvgPicture.asset(
  'assets/icons/icon_calendar.svg',
  width: 70,
  color: Colors.white,
));

Widget messageIcon = LinearGradientMask(
    child: SvgPicture.asset(
  'assets/icons/icon_message.svg',
  width: 80,
  color: Colors.white,
));

Widget notesIcon = LinearGradientMask(
    child: SvgPicture.asset(
  'assets/icons/icon_notes.svg',
  width: 70,
  color: Colors.white,
));

Widget notificationIcon = LinearGradientMask(
    child: SvgPicture.asset(
  'assets/icons/icon_bell.svg',
  width: 70,
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
    // print(size.width);
    return ResponsiveWidget(
      smallScreen: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Merhaba Nilsu",
              style: kTitleStyle.copyWith(
                  color: Colors.white, fontSize: size.width / 28),
            ),
            Text(
              "Haydi randevunu ayarlayalım!",
              style: kSmallTextStyle.copyWith(fontSize: size.width / 30),
            )
          ],
        ),
      ),
      mediumScreen: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Merhaba Nilsu",
              style: kTitleStyle.copyWith(color: Colors.white),
            ),
            Text(
              "Haydi randevunu ayarlayalım!",
              // style: kSmallTextStyle,
              style: kSmallTextStyle,
            )
          ],
        ),
      ),
      largeScreen: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Merhaba Nilsu",
              style: kTitleStyle.copyWith(color: Colors.white),
            ),
            Text(
              "Haydi randevunu ayarlayalım!",
              // style: kSmallTextStyle,
              style: kSmallTextStyle,
            )
          ],
        ),
      ),
    );
  }
}

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
              // style: kTextStylewoSize,
              style: kTitleStyle.copyWith(color: Colors.white),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "Haydi işletmeni ayarlayalım!",
              // style: kTextStylewoSize,
              style: kSmallTextStyle.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    ),
  ],
);

Row appBarTitleFavorites = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Container(
      child: Functions().titleLength(
          inputName: "Favorilerim",
          textStyle: kTitleStyle.copyWith(
              color: Colors.white, letterSpacing: 2, fontSize: 25),
          ctrlLength: 20),
    ),
    Container(),
  ],
);
