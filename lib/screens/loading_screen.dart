import 'package:ayarla/constants/router.dart';
import 'package:ayarla/services/analytics_service.dart';
import 'package:ayarla/services/locator.dart';
import 'package:ayarla/virtual_data_base/temporaryLists.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/services/service_appointment.dart';
import 'coiffure_detail_page/coiffure_detail_page.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [locator<AnalyticsService>().getAnalyticsObserver()],
      initialRoute: "/Hosgeldiniz",
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      onGenerateRoute: (settings) {
        if (Routers.routeNames.contains(settings.name)) {
          return Routers.router.generator(RouteSettings(name: settings.name));

          /// Has to be static !
        } else if (settings.name ==
            '/Isletme/Silver-Hair-Studio-Bekir-Ozdemir-&-Emre-Baris-Cakir') {
          return Routers.router.generator(RouteSettings(
              name: settings.name, arguments: CoiffureDetailPage(coiffureModel: coiffureList[0])));
        } else
          return Routers.router.generator(RouteSettings(name: '/Hosgeldiniz'));
      },
    );
  }
}
