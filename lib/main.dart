import 'package:ayarla/services/analytics_service.dart';
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

class Ayarla extends StatefulWidget {
  @override
  _AyarlaState createState() => _AyarlaState();
}

class _AyarlaState extends State<Ayarla> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      highlightColor: Colors.white.withOpacity(0.25),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        splashColor: Colors.white.withOpacity(0.25),
      ),
    );

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
      child: MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        navigatorObservers: [
          locator<AnalyticsService>().getAnalyticsObserver(),
        ],
        onGenerateRoute: Routers.router.generator,
        initialRoute: "/",
      ),
    );
  }
}
