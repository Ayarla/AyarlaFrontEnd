import 'package:ayarla/services/service_login.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:provider/provider.dart';

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

/// APPBARS
class AppBarTitleCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Provider.of<LoginService>(context, listen: false).isLoggedIn
                ? "Merhaba " + Provider.of<LoginService>(context, listen: false).currentUser.fullName
                : "Merhaba",
            style: kTitleStyle.copyWith(color: Colors.white, fontSize: size.width < 425 ? size.width / 19.3 : 22),
          ),
          Text(
            "Haydi randevunu ayarlayalım!",
            style: kSmallTextStyle.copyWith(fontSize: size.width < 425 ? size.width / 30.3 : 14),
          )
        ],
      ),
    );
  }
}

class AppBarTitleManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Merhaba Nilsu",
            style: kTitleStyle.copyWith(color: Colors.white, fontSize: size.width < 425 ? size.width / 19.3 : 22),
          ),
          Text(
            "Haydi işletmeni ayarlayalım!",
            style: kSmallTextStyle.copyWith(fontSize: size.width < 425 ? size.width / 30.3 : 14),
          )
        ],
      ),
    );
  }
}

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
