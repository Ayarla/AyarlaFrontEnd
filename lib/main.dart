import 'package:ayarla/screens/loading_screen.dart';
import 'package:ayarla/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:ayarla/virtual_data_base/businessOrUser_data.dart';
import 'package:ayarla/virtual_data_base/genderSelection.dart';
import 'package:ayarla/virtual_data_base/login.dart';
import 'package:url_strategy/url_strategy.dart';
import 'constants/router.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  Routers.setupRouter();
  setupLocator();
  setPathUrlStrategy();
  runApp(Ayarla());
}

class Ayarla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppointmentData>(
            create: (context) => AppointmentData()),
        ChangeNotifierProvider<GenderSelection>(
            create: (context) => GenderSelection()),
        ChangeNotifierProvider<Login>(create: (context) => Login()),
        ChangeNotifierProvider<BusinessAndUserData>(
            create: (context) => BusinessAndUserData()),
      ],
      child: LoadingScreen(),
    );
  }
}
