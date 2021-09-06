import 'package:ayarla/models/functions.dart';
import 'package:ayarla/models/model_coiffure.dart';
import 'package:ayarla/screens/page_not_found.dart';
import 'package:ayarla/services/analytics_service.dart';
import 'package:ayarla/services/locator.dart';
import 'package:ayarla/services/service_appointment.dart';
import 'package:ayarla/virtual_data_base/temporaryLists.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'coiffure_detail_page/coiffure_detail_page.dart';
import 'package:ayarla/components/map/BusinessFlutterMap.dart';
import 'package:ayarla/screens/calendar_page.dart';
import 'package:ayarla/screens/coiffure_detail_page/coiffure_detail_page.dart';
import 'package:ayarla/screens/comments_page.dart';
import 'package:ayarla/screens/confirmation_page.dart';
import 'package:ayarla/screens/manager_screens/business_info_page/business_info_page.dart';
import 'package:ayarla/screens/manager_screens/employee_management_page/employee_manage_page.dart';
import 'package:ayarla/screens/manager_screens/manager_home.dart';
import 'package:ayarla/screens/user_page/appointments_page.dart';
import 'package:ayarla/screens/user_page/edit_profile_page.dart';
import 'package:ayarla/screens/user_page/employee_page.dart';
import 'package:ayarla/screens/user_page/favorites_page.dart';
import 'package:ayarla/screens/user_page/user_comments_page.dart';
import 'package:ayarla/screens/user_page/user_page.dart';
import 'package:ayarla/screens/search_page.dart';
import 'package:ayarla/screens/welcome_page.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [locator<AnalyticsService>().getAnalyticsObserver()],
      theme: themeData,
      routes: ayarlaRoutes,
      onGenerateRoute: (settings) => onFlyRoute(settings, context),
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) => NotFoundPage()),
    );
  }
}

List localList = [];
Future<List> getter(context) async {
  Provider.of<AppointmentService>(context, listen: false).mainCoiffureList.clear();
  Provider.of<AppointmentService>(context, listen: false).mainCoiffureList =
      await Provider.of<AppointmentService>(context, listen: false).getAllCoiffures();
  localList = Provider.of<AppointmentService>(context, listen: false).mainCoiffureList;
  return coiffureList;
}

Route<dynamic> onFlyRoute(settings, context) {
  /// Handle '/'
  if (settings.name == '/') MaterialPageRoute(builder: (context) => WelcomePage());

  /// Handle '/isletme/:name'
  if (settings.name.contains('/Isletme/') && !settings.name.contains('/Yorumlar')) {
    var returnValue;
    // if (localList.isEmpty) {
    print(settings.name);
    getter(context).whenComplete(() {
      print('vol1');
      for (var x in localList) {
        if ('/Isletme/${createURL(x.name)}' == settings.name) {
          returnValue = x;
        }
      }
      print('vol3');
      // }
      // } else
      //   for (var x in localList) {
      //     if ('/Isletme/${createURL(x.name)}' == settings.name) {
      //       returnValue = x;
      //     }
      //   }
      print(returnValue.name);
    }).whenComplete(() => MaterialPageRoute(
          builder: (context) => CoiffureDetailPage(),
          settings: RouteSettings(
            name: '/Isletme/${createURL(returnValue.name)}',
            arguments: returnValue,
          ),
        ));
  }

  /// Handle '/isletme/:name/Yorumlar'
  if (settings.name.contains('/Yorumlar')) {
    return MaterialPageRoute(
      builder: (context) => CommentsPage(),
      settings: RouteSettings(name: '${settings.name}'),
    );
  }

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
