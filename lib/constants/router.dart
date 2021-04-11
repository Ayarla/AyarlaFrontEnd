import 'package:ayarla/models/coiffeurModel.dart';
import 'package:ayarla/screens/comments_page.dart';
import 'package:ayarla/screens/confirmation_page.dart';
import 'package:ayarla/screens/manager_screens/manager_home.dart';
import 'package:ayarla/screens/user_page/favorites_page.dart';
import 'package:ayarla/screens/user_page/user_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/screens/coiffure_detail_page.dart';
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

  /// User Pages
  static Handler _userPage = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          UserPage());

  static Handler _favoritesPage = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          FavoritesPage());

  /// Manager Pages
  static Handler _managerHome = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ManagerHome());


  static void setupRouter() {
    router.define("/", handler: _loadingPage);
    router.define("/Hosgeldiniz", handler: _welcomePage);
    router.define("/AramaSayfası", handler: _searchPage);
    router.define("/Isletme/:name", handler: _detailPage);
    router.define("/Isletme/:name/Yorumlar", handler: _commentsPage);
    router.define("/OnaySayfası", handler: _confirmationPage);
    router.define("/KullanıcıSayfası", handler: _userPage);
    router.define("/Favorilerim", handler: _favoritesPage);
    router.define("/YöneticiAnasayfa", handler: _managerHome);
  }
}
