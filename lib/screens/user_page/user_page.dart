import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/components/button_generic.dart';
import 'package:ayarla/components/unFocuser.dart';
import 'package:ayarla/services/service_user.dart';
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

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Functions functions = Functions();
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    Provider.of<UserService>(context, listen: false).redirect(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: DefaultAppBar(
        showIconButton: false,
        color: Colors.transparent,
        title: Center(child: Text(" ")),
        childrenColor: Colors.orange,
      ).build(context),
      body: UnFocuser(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Color(0xFF6CC4D7), Color(0xFFFEEDA8)]),
          ),
          child: AyarlaPage(
            child: OverScroll(
              child: Column(
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () => functions.showPicker(context),
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor: Colors.grey,
                            child: Provider.of<UserService>(context, listen: true).userImage != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Provider.of<UserService>(context, listen: true).userImage)
                                : Container(
                                    decoration:
                                        BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(50)),
                                    width: 100,
                                    height: 100,
                                    child: Icon(Icons.camera_alt, color: Colors.grey[800]),
                                  ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              Provider.of<UserService>(context, listen: false).currentUser.fullName ?? "Kullanıcı Adı",
                              style: kTextStyle.copyWith(color: Colors.black, fontSize: 25),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Flexible(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GenericButton(
                                  icon: Icons.favorite_border_rounded,
                                  iconColor: Colors.red,
                                  text: 'Favorilerim',
                                  onPressed: () => Navigator.pushNamed(context, "/Favorilerim"),
                                ),
                                GenericButton(
                                  icon: Icons.calendar_today_rounded,
                                  iconColor: Colors.blue,
                                  text: 'Randevularım',
                                  onPressed: () => Navigator.pushNamed(context, "/Randevularim"),
                                ),
                                GenericButton(
                                  icon: Icons.message_rounded,
                                  iconColor: Colors.green,
                                  text: 'Mesajlarım',
                                  onPressed: () => Navigator.pushNamed(context, "/Randevularim"),
                                ),

                                /// TODO: We need a role.
                                if (Provider.of<UserService>(context, listen: false).currentUser.roleNames.contains('Manager'))
                                  GenericButton(
                                    icon: Icons.business_center_outlined,
                                    iconColor: Colors.green,
                                    text: 'İşletme Ayarlarım',
                                    onPressed: () => Navigator.pushNamed(context, "/YoneticiAnasayfasi"),
                                  ),
                                if (Provider.of<UserService>(context, listen: false)
                                    .currentUser
                                    .roleNames
                                    .contains('Employee'))
                                  GenericButton(
                                    icon: Icons.assignment_ind_outlined,
                                    iconColor: Colors.green,
                                    text: 'Çalışan Ayarlarım',
                                    onPressed: () => Navigator.pushNamed(context, "/CalisanAyarlarim"),
                                  ),
                                GenericButton(
                                  icon: FontAwesomeIcons.userEdit,
                                  text: 'Profilimi Düzenle',
                                  iconColor: Colors.blueGrey,
                                  onPressed: () {
                                    FirebaseAnalytics().logEvent(name: 'user_edit_profile', parameters: null);
                                    Navigator.pushNamed(context, "/ProfilimiDuzenle");
                                  },
                                ),
                                GenericButton(
                                  icon: Icons.logout,
                                  iconColor: Colors.red,
                                  text: 'Çıkış Yap',
                                  onPressed: () {
                                    /// TODO: fix - Done, try now.
                                    Navigator.pushNamedAndRemoveUntil(context, "/GirisYapmaSayfasi", ModalRoute.withName('/'));
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
