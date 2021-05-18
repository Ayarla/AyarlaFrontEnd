import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/constants/router.dart';
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
  double smallIconSize = 18.0;
  double bigIconSize = 24.0;
  double smallTextSize = 16.0;
  double bigTextSize = 20.0;

  List<String> nameList = [
    "Favorilerim",
    "Mesajlarım",
    "Randevularım",
    "Profilimi Düzenle",
  ];

  List<IconData> iconList = [
    Icons.favorite_border_outlined,
    Icons.chat_outlined,
    Icons.date_range_outlined,
    Icons.edit_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool smallScreenCondition = size.width < 400;
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
        body: AyarlaPage(
          child: OverScroll(
            child: ListView(
              children: [
                ///if the user is not logged in then it opens the authentication page for login or signup
                if (!Provider.of<Login>(context, listen: true).isLoggedIn)
                  Center(child: AuthenticationPage()),

                ///otherwise it opens the profile of the user
                if (Provider.of<Login>(context, listen: true).isLoggedIn)
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 8.0,
                      ),
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

                          ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (BuildContext bc, int index) {
                              return TextButton(
                                onPressed: () {
                                  Routers.router
                                      .navigateTo(context, nameList[index]);
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.0, right: 20),
                                      child: Icon(
                                        iconList[index],
                                        size: smallScreenCondition
                                            ? smallIconSize
                                            : bigIconSize,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      nameList[index],
                                      style: kTextStyle.copyWith(
                                          fontSize: smallScreenCondition
                                              ? smallTextSize
                                              : bigTextSize),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: Icon(
                                        Icons.keyboard_arrow_right,
                                        size: smallScreenCondition
                                            ? smallIconSize
                                            : bigIconSize,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext bc, int index) =>
                                Divider(thickness: 1),
                            itemCount: 4,
                          ),

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
                  ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        Provider.of<Login>(context, listen: false)
                            .loggedInUser();
                      });

                      ///TODO check and push somewhere
                    },
                    child: Text(
                      'User Girişi',
                      style: kTextStyle.copyWith(
                          color: Colors.black, fontSize: 25),
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Routers.router.navigateTo(context, "YoneticiAnasayfasi");
                      Provider.of<Login>(context, listen: false)
                          .loggedInManager();

                      ///TODO check and push somewhere
                    },
                    child: Text(
                      'Manager Girişi',
                      style: kTextStyle.copyWith(
                          color: Colors.black, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
