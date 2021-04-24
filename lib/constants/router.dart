import 'package:ayarla/components/map/mapBox.dart';
import 'package:ayarla/screens/calender_page.dart';
import 'file:///C:/Users/Nilsu/AndroidStudioProjects/AyarlaFrontEnd/lib/screens/manager_screens/business_info_page/business_info_page.dart';
import 'package:ayarla/screens/manager_screens/employee_management.dart';
import 'package:ayarla/screens/manager_screens/employee_page.dart';
import 'package:ayarla/screens/manager_screens/manager_notes_page.dart';
import 'package:ayarla/screens/manager_screens/manager_send_message_page.dart';
import 'package:ayarla/screens/popUpScreens/registrationPopUp.dart';
import 'package:ayarla/screens/registrationPage.dart';
import 'package:ayarla/screens/user_page/appontments_page.dart';
import 'package:ayarla/screens/user_page/edit_profile_page.dart';
import 'package:ayarla/screens/user_page/message_page.dart';
import 'package:ayarla/screens/user_page/past_appointments_page.dart';
import 'package:ayarla/webService/view_webFunctions.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/screens/comments_page.dart';
import 'package:ayarla/screens/confirmation_page.dart';
import 'package:ayarla/screens/manager_screens/manager_home.dart';
import 'package:ayarla/screens/user_page/favorites_page.dart';
import 'package:ayarla/screens/user_page/user_page.dart';
import 'package:ayarla/screens/coiffure_detail_page/coiffure_detail_page.dart';
import 'package:ayarla/screens/loading_screen.dart';
import 'package:ayarla/screens/search_page.dart';
import 'package:ayarla/screens/welcome_page.dart';

class Routers {
  static FluroRouter router = FluroRouter();

  static Handler _loadingPage = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          LoadingScreen());

  static Handler _welcomePage = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          WelcomePage());

  static Handler _searchPage = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          SearchPage());

  static Handler _detailPage =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    final CoiffureDetailPage args = ModalRoute.of(context).settings.arguments;
    return CoiffureDetailPage(
        coiffureModel: args?.coiffureModel,
        name: params['${args.coiffureModel.name.toString()}']);
  });

  static Handler _commentsPage = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          CommentsPage());

  static Handler _confirmationPage = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ConfirmationPage());

  static Handler _timeSelectionPage = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          CalenderPage());

  /// User Pages
  static Handler _userPage = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          UserPage());

  static Handler _favoritesPage = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          FavoritesPage());

  static Handler _appointmentsPage = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          AppointmentsPage());

  static Handler _editProfilePage = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          EditProfilePage());

  static Handler _userMessagePage = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          UserMessagePage());

  static Handler _pastAppointmentPage = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          PastAppointmentsPage());

  static Handler _employeeSettingsPage = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          EmployeePage());

  /// Manager Pages
  static Handler _managerHome = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ManagerHome());

  static Handler _businessInfoPage = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          BusinessInfoPage());

  static Handler _employeeManagement = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          EmployeeManagement());

  static Handler _managerNotesPage = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ManagerNotesPage());

  static Handler _managerSendMessagePage = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ManagerSendMessage());

  static Handler _mapBox = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          MapBox());

  /// WebServices
  static Handler _webServicePage = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ViewWebFunctions());

  /// Reg
  static Handler _regPopUp = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ViewWebFunctions());

  static Handler _regPage = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          RegistrationPage());

  static void setupRouter() {
    /// General Pages
    router.define("/", handler: _loadingPage);
    router.define("/Hosgeldiniz", handler: _welcomePage);
    router.define("/AramaSayfasi", handler: _searchPage);
    router.define("/Isletme/:name", handler: _detailPage);
    router.define("/Isletme/:name/Yorumlar", handler: _commentsPage);
    router.define("/SaatSayfasi", handler: _timeSelectionPage);
    router.define("/OnaySayfasi", handler: _confirmationPage);

    /// User Pages
    router.define("/KullaniciSayfasi", handler: _userPage);
    router.define("/Favorilerim", handler: _favoritesPage);
    router.define("/Randevularim", handler: _appointmentsPage);
    router.define("/Mesajlarim", handler: _userMessagePage);
    router.define("/GecmisRandevularim", handler: _pastAppointmentPage);
    router.define("/ProfilimiDuzenle", handler: _editProfilePage);

    /// Manager Pages
    router.define("/YoneticiAnasayfasi", handler: _managerHome);
    router.define("/Isletmem", handler: _businessInfoPage);
    router.define("/Calisanlarim", handler: _employeeManagement);
    router.define("/Notlarim", handler: _managerNotesPage);
    router.define("/MesajYolla", handler: _managerSendMessagePage);
    router.define("/Harita", handler: _mapBox);
    router.define("/WebServisleri", handler: _webServicePage);
    router.define("/KayitPopUp", handler: _regPopUp);
    router.define("/KayitSayfasi", handler: _regPage);
    router.define("/Ayarlarim", handler: _employeeSettingsPage);
  }
}
