import 'dart:math';

import 'package:ayarla/components/ayarla_bottom_sheet.dart';
import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/constants/router.dart';
import 'package:ayarla/virtual_data_base/genderSelection.dart';
import 'package:ayarla/virtual_data_base/login.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/components/UI/logos&icons&texts.dart' as UI;
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DefaultAppBar(
        title: UI.AppBarTitleCustomer(),
        color: Color(0xFF90a4ae).withOpacity(0.4),
        showBackButton: false,
      ).build(context),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xFF6CC4D7), Color(0xFFFEEDA8)]),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Center(
                child: TextButton(
                  onPressed: () {
                    Routers.router.navigateTo(context, "YoneticiAnasayfasi");
                    Provider.of<Login>(context, listen: false)
                        .loggedInManager();
                  },
                  child: Text(
                    'Manager Girişi',
                    style:
                        kTextStyle.copyWith(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(height: 20),
              UI.generalLogo,
              SizedBox(height: 30),
              Text("Yeni Nesil, Akıllı Randevu Danışmanı",
                  textAlign: TextAlign.center, style: kTitleStyle),
              SizedBox(height: 15),
              AyarlaPage(
                child: Expandable(
                  padding: EdgeInsets.all(0.0),
                  backgroundColor: Color(0xFF90a4ae).withOpacity(0.4),
                  showArrowIcon: true,
                  hoverOn: true,
                  arrowWidget: Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: Colors.white,
                    size: size.width < 423 ? 35 : 25,
                  ),
                  primaryWidget: Container(
                    height: 80,
                    child: Center(
                      child: Text(
                        'Kuaför Randevumu Ayarla',
                        style: kTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: size.width < 423 ? 35 : 25,
                        ),
                      ),
                    ),
                  ),
                  secondaryWidget: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Provider.of<GenderSelection>(context, listen: false)
                                .selectGender(Gender.female);
                            Routers.router.navigateTo(context, "/AramaSayfasi");
                            FirebaseAnalytics().logEvent(
                                name: 'female_button', parameters: null);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Kadın',
                                softWrap: true,
                                style: kTextStyle.copyWith(color: Colors.white),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.arrow_right_rounded,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        TextButton(
                          onPressed: () {
                            Provider.of<GenderSelection>(context, listen: false)
                                .selectGender(Gender.male);
                            Routers.router.navigateTo(context, "/AramaSayfasi");
                            FirebaseAnalytics().logEvent(
                                name: 'male_button', parameters: null);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Erkek',
                                softWrap: true,
                                style: kTextStyle.copyWith(color: Colors.white),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.arrow_right_rounded,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        TextButton(
                          onPressed: () {
                            Provider.of<GenderSelection>(context, listen: false)
                                .selectGender(Gender.unisex);
                            Routers.router.navigateTo(context, "/AramaSayfasi");
                            FirebaseAnalytics().logEvent(
                                name: 'unisex_button', parameters: null);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Unisex',
                                softWrap: true,
                                style: kTextStyle.copyWith(color: Colors.white),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.arrow_right_rounded,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  backgroundImage: DecorationImage(
                    image: AssetImage('assets/new/cfr2.png'),
                    repeat: ImageRepeat.repeatX,
                    scale: 1.4,
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
