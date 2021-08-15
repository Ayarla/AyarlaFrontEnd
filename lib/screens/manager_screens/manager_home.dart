import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/constants/iconNames.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/components/UI/logos&icons&texts.dart' as UI;
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';

class ManagerHome extends StatefulWidget {
  @override
  _ManagerHomeState createState() => _ManagerHomeState();
}

class _ManagerHomeState extends State<ManagerHome> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isSmallScreen = size.width < 650;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFFeceff1),
      appBar: DefaultAppBar(
        title: UI.AppBarTitleManager(),
        color: Color(0xFF90a4ae).withOpacity(0.4),
      ).build(context),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/new/new1.jpg'),
          scale: .8,
          fit: BoxFit.cover,
        )),
        child: AyarlaPage(
          child: ListView(
            shrinkWrap: true,
            children: [
              isSmallScreen ? SizedBox(height: 40) : SizedBox(),
              UI.generalLogo,
              SizedBox(height: 15),
              Text("İşletme Yönetim Paneli", textAlign: TextAlign.center, style: kTitleStyle),
              isSmallScreen ? SizedBox(height: 15) : SizedBox(height: 50),
              GridView.count(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(20),
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.77,
                crossAxisCount: size.width < 650 ? 2 : 4,
                children: <Widget>[
                  // Image(image: AssetImage(homeIconName2)),
                  // Image(image: AssetImage(employeesIconName2)),
                  // Image(image: AssetImage(notesIconName2)),
                  // Image(image: AssetImage(messageIconName2)),
                  GenericIconButton(
                    padding: EdgeInsets.all(10),
                    spaceBetween: 15,
                    iconContext: Image.asset(homeIconName2),
                    color: Colors.white.withOpacity(.4),
                    text: 'İşletmem',
                    onPressed: () => Navigator.pushNamed(context, "/Isletmem"),
                  ),
                  GenericIconButton(
                    padding: EdgeInsets.all(10),
                    spaceBetween: 15,
                    iconContext: Image(image: AssetImage(employeesIconName2)),
                    color: Colors.white.withOpacity(.4),
                    text: 'Çalışanlarım',
                    onPressed: () => Navigator.pushNamed(context, "/Calisanlarim"),
                  ),
                  GenericIconButton(
                    padding: EdgeInsets.all(10),
                    spaceBetween: 15,
                    iconContext: Image(image: AssetImage(notesIconName2)),
                    color: Colors.white.withOpacity(.4),
                    text: 'Bilgilendirme Mesajlarım',
                    onPressed: () => Navigator.pushNamed(context, "/BilgilendirmeMesaji"),
                  ),
                  GenericIconButton(
                    padding: EdgeInsets.all(10),
                    spaceBetween: 15,
                    iconContext: Image(image: AssetImage(messageIconName2)),
                    color: Colors.white.withOpacity(.4),
                    text: 'Mesajlaşma',
                    onPressed: () => Navigator.pushNamed(context, "/MesajYolla"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
