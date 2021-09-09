import 'package:ayarla/models/functions.dart';
import 'package:ayarla/models/model_coiffure.dart';
import 'package:ayarla/screens/manager_screens/manager_info_message_page.dart';
import 'package:ayarla/screens/page_not_found.dart';
import 'package:ayarla/services/analytics_service.dart';
import 'package:ayarla/services/locator.dart';
import 'package:ayarla/services/service_appointment.dart';
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

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getter(context);
    super.initState();
  }

  Future<List> getter(context) async {
    Provider.of<AppointmentService>(context, listen: false).mainCoiffureList.clear();
    Provider.of<AppointmentService>(context, listen: false).mainCoiffureList =
        await Provider.of<AppointmentService>(context, listen: false).getAllCoiffures();
    return Provider.of<AppointmentService>(context, listen: false).mainCoiffureList;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
    );
    return Provider.of<AppointmentService>(context, listen: true).mainCoiffureList.length <= 0
        ? Container()
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorObservers: [locator<AnalyticsService>().getAnalyticsObserver()],
            theme: themeData,
            routes: ayarlaRoutes,
            onGenerateRoute: (settings) => onFlyRoute(settings, context),
            onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) => NotFoundPage()),
          );
  }
}

Route<dynamic> onFlyRoute(settings, context) {
  /// Handle '/'
  if (settings.name == '/') MaterialPageRoute(builder: (context) => WelcomePage());

  /// Handle '/isletme/:name'
  if (settings.name.toString().contains('/Isletme/') &&
      !settings.name.toString().contains('/Yorumlar')) {
    CoiffureModel _coiffureModel;

    for (CoiffureModel x
        in Provider.of<AppointmentService>(context, listen: false).mainCoiffureList) {
      if ('/Isletme/${createURL(x.name)}' == settings.name.toString()) {
        _coiffureModel = x;
      }
    }

    return MaterialPageRoute(
      builder: (bc) => CoiffureDetailPage(coiffureModel: _coiffureModel),
      settings: RouteSettings(
        name: '/Isletme/${createURL(_coiffureModel.name)}',
        arguments: _coiffureModel,
      ),
    );
  }

  /// Handle '/isletme/:name/Yorumlar'
  if (settings.name.toString().contains('/Yorumlar')) {
    CoiffureModel _coiffureModel;
    for (CoiffureModel x
        in Provider.of<AppointmentService>(context, listen: false).mainCoiffureList) {
      if ('/Isletme/${createURL(x.name)}/Yorumlar' == settings.name.toString()) {
        _coiffureModel = x;
      }
    }
    return MaterialPageRoute(
      builder: (context) => CommentsPage(),
      settings: RouteSettings(name: '/Isletme/${createURL(_coiffureModel.name)}/Yorumlar'),
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
  "/BilgilendirmeMesaji": (context) => ManagerInformationMessagePage(),
};
