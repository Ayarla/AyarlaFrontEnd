import 'package:ayarla/components/new_icon.dart';
import 'package:ayarla/constants/router.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/components/UI/logos&icons&texts.dart' as UI;
import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/constants/constants.dart';

class ManagerHome extends StatefulWidget {
  @override
  _ManagerHomeState createState() => _ManagerHomeState();
}

class _ManagerHomeState extends State<ManagerHome> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFFeceff1),
      appBar: DefaultAppBar(
        title: UI.appBarTitleManager,
        color: Color(0xFF90a4ae).withOpacity(0.4),
      ).build(context),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/new/new1.jpg'),
          scale: .8,
          fit: BoxFit.cover,
        )),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: OverScroll(
              child: Column(children: <Widget>[
                SizedBox(height: size.height / 7),
                UI.generalLogo,
                SizedBox(height: 15),
                Text("İşletme Yönetim Paneli",
                    textAlign: TextAlign.center, style: kTitleStyle),
                SizedBox(height: 15),

                /// Icons
                Container(
                    width: size.width,
                    height: size.height / 1.6,
                    child: size.width < 700
                        ? GridView.count(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.all(20),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            children: <Widget>[
                                GenericIconButton(
                                  iconContext: NewIcon(
                                    size: size.width / 5,
                                    iconName: UI.homeIconName,
                                  ),
                                  color: Colors.white.withOpacity(.4),
                                  text: 'İşletmem',
                                  onPressed: () => Routers.router
                                      .navigateTo(context, "/Isletmem"),
                                ),
                                GenericIconButton(
                                  iconContext: NewIcon(
                                    size: size.width / 5,
                                    iconName: UI.employeesIconName,
                                  ),
                                  color: Colors.white.withOpacity(.4),
                                  text: 'Çalışanlarım',
                                  onPressed: () => Routers.router
                                      .navigateTo(context, "/Calisanlarim"),
                                ),
                                GenericIconButton(
                                  iconContext: NewIcon(
                                    size: size.width / 5,
                                    iconName: UI.calenderIconName,
                                  ),
                                  color: Colors.white.withOpacity(.4),
                                  text: 'Ayarlarım',
                                  onPressed: () => Routers.router
                                      .navigateTo(context, "/Ayarlarim"),
                                ),
                                GenericIconButton(
                                  iconContext: NewIcon(
                                    size: size.width / 5,
                                    iconName: UI.notesIconName,
                                  ),
                                  color: Colors.white.withOpacity(.4),
                                  text: 'Notlarım',
                                  onPressed: () => Routers.router
                                      .navigateTo(context, "/Notlarim"),
                                ),
                                GenericIconButton(
                                  iconContext: NewIcon(
                                    size: size.width / 5,
                                    iconName: UI.messageIconName,
                                  ),
                                  color: Colors.white.withOpacity(.4),
                                  text: 'Mesajlaşma',
                                  onPressed: () => Routers.router
                                      .navigateTo(context, "/MesajYolla"),
                                ),
                                // GenericIconButton(
                                //   iconContext: UI.messageIcon,
                                //   color: Colors.white.withOpacity(.4),
                                //   text: 'Mesajlaşma',
                                //   // onPressed: ManagerSendMessage.id,
                                // ),

                                // GenericIconButton(
                                //   iconContext: UI.NewIcon(
                                //     size: size.width / 5,
                                //     iconName: UI.notificationIcon,
                                //   ),
                                //   color: Colors.white.withOpacity(.4),
                                //   text: 'Randevu Hatırlatma',
                                //   // onPressed: ManagerSendMessage.id,
                                // ),
                              ])
                        : GridView.count(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.all(20),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 4,
                            children: <Widget>[
                                GenericIconButton(
                                  iconContext: NewIcon(
                                    size: size.width / 8,
                                    iconName: UI.homeIconName,
                                  ),
                                  color: Colors.white.withOpacity(.4),
                                  text: 'İşletmem',
                                  onPressed: () => Routers.router
                                      .navigateTo(context, "/Isletmem"),
                                ),
                                GenericIconButton(
                                  iconContext: NewIcon(
                                    size: size.width / 8,
                                    iconName: UI.employeesIconName,
                                  ),
                                  color: Colors.white.withOpacity(.4),
                                  text: 'Çalışanlarım',
                                  onPressed: () => Routers.router
                                      .navigateTo(context, "/Calisanlarim"),
                                ),
                                GenericIconButton(
                                  iconContext: NewIcon(
                                    size: size.width / 8,
                                    iconName: UI.calenderIconName,
                                  ),
                                  color: Colors.white.withOpacity(.4),
                                  text: 'Ayarlarım',
                                  onPressed: () => Routers.router
                                      .navigateTo(context, "/Ayarlarim"),
                                ),
                                GenericIconButton(
                                  iconContext: NewIcon(
                                    size: size.width / 8,
                                    iconName: UI.notesIconName,
                                  ),
                                  color: Colors.white.withOpacity(.4),
                                  text: 'Notlarım',
                                  onPressed: () => Routers.router
                                      .navigateTo(context, "/Notlarim"),
                                ),
                                GenericIconButton(
                                  iconContext: NewIcon(
                                    size: size.width / 8,
                                    iconName: UI.messageIconName,
                                  ),
                                  color: Colors.white.withOpacity(.4),
                                  text: 'Mesajlaşma',
                                  onPressed: () => Routers.router
                                      .navigateTo(context, "/MesajYolla"),
                                ),

                                // GenericIconButton(
                                //   iconContext: UI.NewIcon(
                                //     size: size.width / 5,
                                //     iconName: UI.notificationIcon,
                                //   ),
                                //   color: Colors.white.withOpacity(.4),
                                //   text: 'Randevu Hatırlatma',
                                //   // onPressed: ManagerSendMessage.id,
                                // ),
                              ])),
              ]),
            )),
      ),
    );
  }
}
