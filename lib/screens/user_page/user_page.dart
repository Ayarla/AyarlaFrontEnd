import 'package:ayarla/constants/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/screens/authentication_page.dart';
import 'package:ayarla/screens/manager_screens/manager_home.dart';
import 'package:ayarla/screens/user_page/appontments_page.dart';
import 'package:ayarla/screens/user_page/edit_profile_page.dart';
import 'package:ayarla/screens/user_page/favorites_page.dart';
import 'package:ayarla/screens/user_page/message_page.dart';
import 'package:ayarla/screens/user_page/past_appointments_page.dart';
import 'package:ayarla/virtual_data_base/businessOrUser_data.dart';
import 'package:ayarla/virtual_data_base/login.dart';
import 'package:ayarla/components/UI/logos&icons&texts.dart' as UI;

class UserPage extends StatefulWidget {
  static const id = 'UserPage';
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Functions functions = Functions();

  bool isLoggedIn = false;

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(
          showIconButton: false,
          title: Center(
            child: Text(
              "ayarla",
              style: kTitleStyle.copyWith(color: Colors.white),
            ),
          ),
          gradient: functions.decideColor(context),
        ).build(context),
        body: OverScroll(
          child: ListView(
            children: [
              ///if the user is not logged in then it opens the authentication page for login or signup
              if (!Provider.of<Login>(context, listen: true).holder)
                AuthenticationPage(),

              ///otherwise it opens the profile of the user
              if (Provider.of<Login>(context, listen: true).holder)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    runSpacing: 10.0,
                    children: [
                      ///users photo and name
                      Center(
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                functions.showPicker(context);
                              },
                              child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.grey,
                                child: Provider.of<BusinessAndUserData>(context,
                                                listen: true)
                                            .userImage !=
                                        null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
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
                      Divider(color: Colors.black),

                      GestureDetector(
                        onTap: () {
                          Routers.router.navigateTo(context, "Favorilerim");
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 20),
                              // child: UI.HeartIcon(),
                              child: Icon(Icons.favorite_border_outlined),
                            ),
                            Text("Favorilerim", style: kTextStyle),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Icon(Icons.keyboard_arrow_right),
                            )
                          ],
                        ),
                      ),
                      Divider(color: Colors.black),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserMessagePage(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 20),
                              child: Icon(Icons.chat_outlined),
                              // child: UI.messageIcon,
                            ),
                            Text("Mesajlarım", style: kTextStyle),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Icon(Icons.keyboard_arrow_right),
                            )
                          ],
                        ),
                      ),
                      Divider(color: Colors.black),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppointmentsPage.id);
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 20),
                            // child: UI.calenderIcon,
                              child: Icon(Icons.date_range_outlined),
                            ),
                            Text("Randevularım", style: kTextStyle),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Icon(Icons.keyboard_arrow_right),
                            )
                          ],
                        ),
                      ),
                      Divider(color: Colors.black),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, PastAppointmentsPage.id);
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 20),
                              child: Icon(Icons.update_outlined),
                            ),
                            Text("Geçmiş Randevularım", style: kTextStyle),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Icon(Icons.keyboard_arrow_right),
                            )
                          ],
                        ),
                      ),
                      Divider(color: Colors.black),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, EditProfilePage.id);
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 20),
                              child: Icon(Icons.edit_outlined),
                              // child: UI.settingsIcon,
                            ),
                            Text("Profilimi Düzenle", style: kTextStyle),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Icon(Icons.keyboard_arrow_right),
                            )
                          ],
                        ),
                      ),
                      Divider(color: Colors.black),
                      Center(
                        child: Container(
                          height: 50,
                          width: 150,
                          margin: EdgeInsets.only(top: 10.0),
                          decoration: BoxDecoration(
                              gradient: functions.decideColor(context),
                              borderRadius: BorderRadius.circular(20)),
                          child: TextButton(
                            onPressed: () {
                              ///TODO logout button
                            },
                            child: Text(
                              'Çıkış',
                              style: kTextStyle.copyWith(
                                  color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              TextButton(
                onPressed: () {
                  setState(() {
                    Provider.of<Login>(context, listen: false).loggedInUser();
                  });

                  ///TODO check and push somewhere
                },
                child: Text(
                  'User Girişi',
                  style: kTextStyle.copyWith(color: Colors.black, fontSize: 25),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, ManagerHome.id);
                  Provider.of<Login>(context, listen: false).loggedInManager();

                  ///TODO check and push somewhere
                },
                child: Text(
                  'Manager Girişi',
                  style: kTextStyle.copyWith(color: Colors.black, fontSize: 25),
                ),
              ),
            ],
          ),
        ));
  }
}
