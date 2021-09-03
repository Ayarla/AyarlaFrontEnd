import 'dart:async';

import 'package:ayarla/components/map/BusinessFlutterMap.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/models/model_coiffure.dart';
import 'package:ayarla/screens/calendar_page.dart';
import 'package:ayarla/screens/coiffure_detail_page/coiffure_detail_page.dart';
import 'package:ayarla/screens/comments_page.dart';
import 'package:ayarla/screens/confirmation_page.dart';
import 'package:ayarla/screens/manager_screens/business_info_page/business_info_page.dart';
import 'package:ayarla/screens/manager_screens/employee_management_page/employee_manage_page.dart';
import 'package:ayarla/screens/manager_screens/manager_home.dart';
import 'package:ayarla/screens/page_not_found.dart';
import 'package:ayarla/screens/user_page/appointments_page.dart';
import 'package:ayarla/screens/user_page/edit_profile_page.dart';
import 'package:ayarla/screens/user_page/employee_page.dart';
import 'package:ayarla/screens/user_page/favorites_page.dart';
import 'package:ayarla/screens/user_page/user_comments_page.dart';
import 'package:ayarla/screens/user_page/user_page.dart';
import 'package:ayarla/services/analytics_service.dart';
import 'package:ayarla/services/locator.dart';
import 'package:ayarla/services/service_management.dart';
import 'package:ayarla/services/service_user.dart';
import 'package:ayarla/virtual_data_base/manager_data.dart';
import 'package:ayarla/virtual_data_base/temporaryLists.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/services/service_appointment.dart';
import 'package:ayarla/services/service_gender.dart';
import 'package:ayarla/services/service_login.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:ayarla/screens/search_page.dart';
import 'package:ayarla/screens/welcome_page.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  setupLocator();
  setPathUrlStrategy();
  runApp(Ayarla());
}

class Ayarla extends StatelessWidget {
  final ThemeData themeData = ThemeData(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        foregroundColor: MaterialStateProperty.all(Colors.orange[300]),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppointmentService>(create: (context) => AppointmentService()),
        ChangeNotifierProvider<ManagementService>(create: (context) => ManagementService()),
        ChangeNotifierProvider<UserService>(create: (context) => UserService()),
        ChangeNotifierProvider<GenderService>(create: (context) => GenderService()),
        ChangeNotifierProvider<LoginService>(create: (context) => LoginService()),
        ChangeNotifierProvider<ManagerData>(create: (context) => ManagerData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: [locator<AnalyticsService>().getAnalyticsObserver()],
        theme: themeData,
        routes: ayarlaRoutes,
        onGenerateRoute: (settings) => onFlyRoute(settings),
        onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) => NotFoundPage()),
      ),
    );
  }
}

Future<List> getter(context) async {
  coiffureList = await Provider.of<AppointmentService>(context, listen: false).getAllCoiffures();
  return coiffureList;
}

Route<dynamic> onFlyRoute(settings) {
  /// Handle '/'
  if (settings.name == '/') MaterialPageRoute(builder: (context) => WelcomePage());

  /// Handle '/isletme/:name'
  if (settings.name.contains('/Isletme/') && !settings.name.contains('/Yorumlar')) {
    var returnValue;
    return MaterialPageRoute(
      builder: (context) {
        if (coiffureList.isEmpty) {
          getter(context).then((value) {
            for (var x in coiffureList) {
              if ('/Isletme/${createURL(x.name)}' == settings.name) {
                returnValue = x;
                // print('Inside ${x.name}');
                // print('value: ${returnValue.name}');
              }
            }
          });
        } else
          for (var x in coiffureList) {
            if ('/Isletme/${createURL(x.name)}' == settings.name) {
              returnValue = x;
              // print('Inside ${x.name}');
              // print('value: ${returnValue.name}');
            }
          }

        return CoiffureDetailPage(coiffureModel: returnValue);
      },
      settings: RouteSettings(
        name: '${settings.name}',
        arguments: returnValue,
      ),
    );
  }

  /// Handle '/isletme/:name/Yorumlar'
  // if (settings.name.contains('/Yorumlar')) {
  //   return MaterialPageRoute(
  //     builder: (context) => CommentsPage(),
  //     settings: RouteSettings(
  //       name: '/Isletme/${createURL(coiffureList[0].name)}/Yorumlar',
  //     ),
  //   );
  // }

  return MaterialPageRoute(builder: (context) => WelcomePage());
}

Object ayarlaRoutes = {
  '/': (context) => WelcomePage(),
  '/Hosgeldiniz': (context) => WelcomePage(),
  '/AramaSayfasi': (context) => SearchPage(),
  '/Isletme/:name': (context) => CoiffureDetailPage(),
  "/Isletme/:name/Yorumlar": (context) => CommentsPage(),
  "/OnaySayfasi": (context) => ConfirmationPage(),
  "/SaatSecimi": (context) => CalendarPage(),
  "/SayfaBulunamadi": (context) => NotFoundPage(),

  /// User pages
  "/KullaniciSayfasi": (context) => UserPage(),
  "/Favorilerim": (context) => FavoritesPage(),
  "/Randevularim": (context) => AppointmentsPage(),
  "/ProfilimiDuzenle": (context) => EditProfilePage(),
  "/Yorumlarim": (context) => UserCommentsPage(),
  "/CalisanAyarlarim": (context) => EmployeePage(),

  /// Manager Pages
  "/YoneticiAnasayfasi": (context) => ManagerHome(),
  "/Isletmem": (context) => BusinessInfoPage(),
  "/Calisanlarim": (context) => EmployeeManage(),
  "/Harita": (context) => BusinessFlutterMap(),
};
