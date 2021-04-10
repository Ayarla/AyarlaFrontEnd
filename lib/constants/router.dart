import 'package:ayarla/models/coiffeurModel.dart';
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

  // static Handler _searchPage = Handler(
  //     handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
  //         SearchPage());

  static void setupRouter() {
    router.define("/", handler: _loadingPage);
    router.define("/Hosgeldiniz", handler: _welcomePage);
    router.define("/AramaSayfası", handler: _searchPage);
    router.define("/Isletme/:name", handler: _detailPage);
  }
}
