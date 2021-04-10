import 'package:flutter/material.dart';
import 'package:ayarla/components/UI/logos&icons&texts.dart' as UI;
import 'package:ayarla/components/UI/managerScreenButton.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/screens/manager_screens/business_info_page.dart';
import 'package:ayarla/screens/manager_screens/employee_page.dart';
import 'package:ayarla/screens/manager_screens/manager_notes_page.dart';
import 'package:ayarla/screens/manager_screens/manager_send_message_page.dart';
import 'employee_management.dart';

class ManagerHome extends StatefulWidget {
  static const String id = "ManagerHome";

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
                Text(
                  "İşletme Yönetim Paneli",
                  textAlign: TextAlign.center,
                  style: kTitleStyle,
                ),
                SizedBox(height: 15),

                /// Icons
                Container(
                    width: size.width,
                    height: size.height / 1.6,
                    child: GridView.count(
                        physics: BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: <Widget>[
                          ManagerScreenButton(
                              icon: UI.homeIcon,
                              color: Colors.white.withOpacity(.4),
                              text: 'İşletmem',
                              routeID: BusinessInfoPage.id),
                          ManagerScreenButton(
                              icon: UI.employeesIcon,
                              color: Colors.white.withOpacity(.4),
                              text: 'Çalışanlarım',
                              routeID: EmployeeManagement.id),
                          ManagerScreenButton(
                              icon: UI.calenderIcon,
                              color: Colors.white.withOpacity(.4),
                              text: 'Ayarlarım',
                              routeID: EmployeePage.id),
                          ManagerScreenButton(
                              icon: UI.notesIcon,
                              color: Colors.white.withOpacity(.4),
                              text: 'Notlarım',
                              routeID: ManagerNotesPage.id),
                          ManagerScreenButton(
                              icon: UI.messageIcon,
                              color: Colors.white.withOpacity(.4),
                              text: 'Mesajlaşma',
                              routeID: ManagerSendMessage.id),
                          ManagerScreenButton(
                              icon: UI.notificationIcon,
                              color: Colors.white.withOpacity(.4),
                              text: 'Randevu Hatırlatma',
                              routeID: ManagerSendMessage.id),
                        ]))
              ]),
            )),
      ),
    );
  }
}
