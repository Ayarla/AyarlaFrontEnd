import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/constants/iconNames.dart';
import 'package:ayarla/services/service_user.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/components/UI/logos&icons&texts.dart' as UI;
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:provider/provider.dart';

class ManagerHome extends StatefulWidget {
  @override
  _ManagerHomeState createState() => _ManagerHomeState();
}

class _ManagerHomeState extends State<ManagerHome> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isSmallScreen = size.width < 650;
    Provider.of<UserService>(context, listen: false).redirect(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFFeceff1),
      appBar: DefaultAppBar(title: UI.AppBarTitleManager(), color: Color(0xFF90a4ae).withOpacity(0.4)).build(context),
      body: Container(
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage('assets/new/new1.jpg'), scale: .8, fit: BoxFit.cover)),
        child: AyarlaPage(
          child: ListView(
            shrinkWrap: true,
            children: [
              isSmallScreen ? SizedBox(height: 40) : SizedBox(),
              UI.generalLogo,
              SizedBox(height: 15),
              Text("İşletme Yönetim Paneli", textAlign: TextAlign.center, style: kTitleStyle),
              isSmallScreen ? SizedBox(height: 15) : SizedBox(height: 50),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  GenericIconButton(
                    padding: EdgeInsets.all(20),
                    spaceBetween: 12,
                    iconContext: Image.asset(homeIconName2, width: 50),
                    color: Colors.white.withOpacity(.4),
                    text: 'İşletmem',
                    width: 155,
                    onPressed: () => Navigator.pushNamed(context, "/Isletmem"),
                  ),
                  GenericIconButton(
                    padding: EdgeInsets.all(20),
                    spaceBetween: 12,
                    iconContext: Image(image: AssetImage(employeesIconName2), width: 50),
                    color: Colors.white.withOpacity(.4),
                    text: 'Çalışanlarım',
                    width: 155,
                    onPressed: () => Navigator.pushNamed(context, "/Calisanlarim"),
                  ),
                  GenericIconButton(
                    padding: EdgeInsets.all(20),
                    spaceBetween: 12,
                    iconContext: Image(image: AssetImage(notesIconName2), width: 50),
                    color: Colors.white.withOpacity(.4),
                    text: 'Bilgilendirme Mesajlarım',
                    width: 155,
                    onPressed: () => Navigator.pushNamed(context, "/BilgilendirmeMesaji"),
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
