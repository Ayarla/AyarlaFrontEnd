import 'package:ayarla/components/UI/responsiveWidget.dart';
import 'package:ayarla/constants/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/components/UI/logos&icons&texts.dart' as UI;
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/menuItem.dart';
import 'package:ayarla/constants/constants.dart';

class WelcomePage extends StatelessWidget {
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
              SizedBox(height: 20),
              UI.generalLogo,
              SizedBox(height: 30),
              Text("Yeni Nesil, Akıllı Randevu Danışmanı",
                  textAlign: TextAlign.center, style: kTitleStyle),
              SizedBox(height: 15),
              ResponsiveWidget(
                smallScreen: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width / 50, vertical: 10),
                  child: MenuSection(
                    FittedBox(
                      fit: BoxFit.cover,
                      child: Text('Kuaför Randevumu Ayarla',
                          style: kTextStylewoSize),
                    ),
                    Colors.white,
                    Colors.white,
                    [
                      MenuItemData(label: 'Kadın'),
                      MenuItemData(label: 'Erkek'),
                      MenuItemData(label: 'Unisex'),
                    ],
                  ),
                ),
                mediumScreen: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width / 6, vertical: 10),
                  child: MenuSection(
                    Row(
                      children: [
                        Container(
                          child: Text(
                            'Kuaför Randevumu Ayarla',
                            style: kTextStyle.copyWith(
                                color: Colors.white, fontSize: size.width / 30),
                          ),
                        ),
                      ],
                    ),
                    Colors.white,
                    Colors.white,
                    [
                      MenuItemData(label: 'Kadın'),
                      MenuItemData(label: 'Erkek'),
                      MenuItemData(label: 'Unisex'),
                    ],
                  ),
                ),
                largeScreen: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width / 3.5, vertical: 10),
                  child: MenuSection(
                    Row(
                      children: [
                        Container(
                          child: Text(
                            'Kuaför Randevumu Ayarla',
                            style: kTextStyle.copyWith(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Colors.white,
                    Colors.white,
                    [
                      MenuItemData(label: 'Kadın'),
                      MenuItemData(label: 'Erkek'),
                      MenuItemData(label: 'Unisex'),
                    ],
                  ),
                ),
              ),
              TextButton(
                  child: Text('debug'),
                  onPressed: () =>
                      Routers.router.navigateTo(context, "/WebServisleri")),

            ],
          ),
        ),
      ),
    );
  }
}