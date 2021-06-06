import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/components/button_generic.dart';
import 'package:ayarla/constants/router.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/screens/authentication_page.dart';
import 'package:ayarla/virtual_data_base/businessOrUser_data.dart';
import 'package:ayarla/virtual_data_base/login.dart';

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
      appBar: DefaultAppBar(
        showIconButton: false,
        color: Colors.orange[300],
        title: Center(
          child: Text(
            "ayarla",
            style: kTitleStyle.copyWith(color: Colors.white),
          ),
        ),
        gradient: functions.decideColor(context),
      ).build(context),
      body: AyarlaPage(
        child: OverScroll(
          child: ListView(
            children: [
              ///if the user is not logged in then it opens the authentication
              ///page for login or sign up
              if (!Provider.of<Login>(context, listen: true).isLoggedIn)
                Center(child: AuthenticationPage()),

              ///otherwise it opens the profile of the user
              if (Provider.of<Login>(context, listen: true).isLoggedIn)
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      runSpacing: 10.0,
                      children: [
                        ///users photo and name
                        Center(
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: () => functions.showPicker(context),
                                child: CircleAvatar(
                                  radius: 55,
                                  backgroundColor: Colors.grey,
                                  child: Provider.of<BusinessAndUserData>(
                                                  context,
                                                  listen: true)
                                              .userImage !=
                                          null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.file(
                                            Provider.of<BusinessAndUserData>(
                                                    context,
                                                    listen: true)
                                                .userImage,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          width: 100,
                                          height: 100,
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              "Nilsu Öz",
                              style: kTextStyle.copyWith(
                                  color: Colors.black, fontSize: 25),
                            ),
                          ),
                        ),

                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (BuildContext bc, int index) {
                            return GenericButton(
                              icon: iconList[index],
                              text: nameList[index],
                              iconColor: Colors.orange[300],
                              onPressed: () {
                                Routers.router
                                    .navigateTo(context, nameList[index]);
                                FirebaseAnalytics().logEvent(
                                    name: userFireBaseFunctions[index],
                                    parameters: null);
                              },
                            );
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
                          icon: Icons.settings_outlined,
                          text: 'Profilimi Düzenle',
                          iconColor: Colors.blueGrey,
                          onPressed: () {
                            FirebaseAnalytics().logEvent(
                                name: 'user_edit_profile', parameters: null);
                            Routers.router
                                .navigateTo(context, "/Profilimi Düzenle");
                          },
                        ),
                        GenericButton(
                          icon: Icons.logout,
                          iconColor: Colors.red,
                          text: 'Çıkış Yap',
                          onPressed: () {
                            Provider.of<Login>(context, listen: false)
                                .loggedInUser();
                            Routers.router.navigateTo(
                                context, '/KullaniciSayfasi',
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
      ),
    );
  }
}
