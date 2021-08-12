import 'package:ayarla/screens/loading_screen.dart';
import 'package:ayarla/services/locator.dart';
import 'package:ayarla/services/service_management.dart';
import 'package:ayarla/services/service_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/services/service_appointment.dart';
import 'package:ayarla/services/businessOrUser_data.dart';
import 'package:ayarla/services/service_gender.dart';
import 'package:ayarla/services/service_login.dart';
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
        ChangeNotifierProvider<AppointmentService>(create: (context) => AppointmentService()),
        ChangeNotifierProvider<ManagementService>(create: (context) => ManagementService()),
        ChangeNotifierProvider<UserService>(create: (context) => UserService()),
        ChangeNotifierProvider<GenderService>(create: (context) => GenderService()),
        ChangeNotifierProvider<LoginService>(create: (context) => LoginService()),
        ChangeNotifierProvider<BusinessAndUserData>(create: (context) => BusinessAndUserData()),
      ],
      child: LoadingScreen(),
    );
  }
}
