import 'package:ayarla/components/UI/logos&icons&texts.dart' as UI;
import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/components/button_generic.dart';
import 'package:ayarla/constants/router.dart';
import 'package:ayarla/screens/manager_screens/business_info_page/business_info_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/screens/authentication_page.dart';
import 'package:ayarla/services/businessOrUser_data.dart';
import 'package:ayarla/services/service_login.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Functions functions = Functions();
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DefaultAppBar(
        showIconButton: false,
        backButtonFunction: () {
          Provider.of<BusinessAndUserData>(context, listen: false).checkBox = false;
          Navigator.pop(context);
        },
        color: Colors.transparent,
        title: Center(child: Text(" ")),
        childrenColor: Colors.orange,
      ).build(context),
      body: Unfocuser(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xFF6CC4D7), Color(0xFFFEEDA8)]),
          ),
          child: AyarlaPage(
            child: OverScroll(
              child: Column(
                children: [
                  if (!Provider.of<LoginService>(context, listen: true).isLoggedIn) SizedBox(height: 30),
                  if (!Provider.of<LoginService>(context, listen: true).isLoggedIn) UI.generalLogo,
                  if (!Provider.of<LoginService>(context, listen: true).isLoggedIn) SizedBox(height: 30),

                  ///if the user is not logged in then it opens the authentication
                  ///page for login or sign up
                  if (!Provider.of<LoginService>(context, listen: true).isLoggedIn) AuthenticationPage(),

                  ///otherwise it opens the profile of the user
                  if (Provider.of<LoginService>(context, listen: true).isLoggedIn)
                    Flexible(
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          GestureDetector(
                            onTap: () => functions.showPicker(context),
                            child: CircleAvatar(
                              radius: 55,
                              backgroundColor: Colors.grey,
                              child: Provider.of<BusinessAndUserData>(context, listen: true)
                                          .userImage !=
                                      null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Provider.of<BusinessAndUserData>(context, listen: true)
                                          .userImage)
                                  : Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: BorderRadius.circular(50)),
                                      width: 100,
                                      height: 100,
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                "Nilsu Öz",
                                style: kTextStyle.copyWith(color: Colors.black, fontSize: 25),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Flexible(
                            child: SingleChildScrollView(
                              child: Column(
                                // mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GenericButton(
                                    icon: Icons.business_center_outlined,
                                    iconColor: Colors.green,
                                    text: 'Favorilerim',
                                    onPressed: () {
                                      Routers.router.navigateTo(context, "/Favorilerim",
                                          clearStack: false, replace: false);
                                    },
                                  ),
                                  GenericButton(
                                    icon: Icons.business_center_outlined,
                                    iconColor: Colors.green,
                                    text: 'Randevularım',
                                    onPressed: () {
                                      Routers.router.navigateTo(context, "/Randevularım",
                                          clearStack: false, replace: false);
                                    },
                                  ),
                                  GenericButton(
                                    icon: Icons.business_center_outlined,
                                    iconColor: Colors.green,
                                    text: 'Mesajlarım',
                                    onPressed: () {
                                      Routers.router.navigateTo(context, "/Mesajlarim",
                                          clearStack: false, replace: false);
                                    },
                                  ),
                                  GenericButton(
                                    icon: Icons.business_center_outlined,
                                    iconColor: Colors.green,
                                    text: 'Çalışan Ayarlarım',
                                    onPressed: () {
                                      Routers.router.navigateTo(context, "/Ayarlarim",
                                          clearStack: false, replace: false);
                                    },
                                  ),
                                  GenericButton(
                                    icon: FontAwesomeIcons.userEdit,
                                    text: 'Profilimi Düzenle',
                                    iconColor: Colors.blueGrey,
                                    onPressed: () {
                                      FirebaseAnalytics()
                                          .logEvent(name: 'user_edit_profile', parameters: null);
                                      Routers.router.navigateTo(context, "/Profilimi Düzenle");
                                    },
                                  ),
                                  GenericButton(
                                    icon: Icons.logout,
                                    iconColor: Colors.red,
                                    text: 'Çıkış Yap',
                                    onPressed: () {
                                      Provider.of<LoginService>(context, listen: false).loggedInUser();
                                      Routers.router.navigateTo(context, '/KullaniciSayfasi',
                                          clearStack: false, replace: true);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
