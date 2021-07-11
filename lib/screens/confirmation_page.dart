import 'dart:ui';
import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/components/core/expandable_ayarla.dart';
import 'package:ayarla/components/floatingTextButton.dart';
import 'package:ayarla/components/map/flutterMap.dart';
import 'package:ayarla/constants/router.dart';
import 'package:ayarla/models/model_appointment.dart';
import 'package:ayarla/models/model_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/circularParent.dart';
import 'package:ayarla/components/pop-up.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/screens/user_page/user_page.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:ayarla/virtual_data_base/login.dart';

class ConfirmationPage extends StatefulWidget {
  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  Functions functions = Functions();
  bool isConfirmed;
  List<AppointmentInfo> localList = [];
  List<int> localPriceList = [];

  @override
  void initState() {
    super.initState();
    isConfirmed =
        Provider.of<AppointmentData>(context, listen: false).isConfirmed;
    Provider.of<AppointmentData>(context, listen: false).isConfirmed = false;
    localList = Provider.of<AppointmentData>(context, listen: false)
        .servicesAndEmployees;

    for (ServiceModel x in Provider.of<AppointmentData>(context, listen: false)
        .fullTimeServices) {
      for (AppointmentInfo y in localList) {
        if (y.service == x.name) {
          localPriceList.add(x.price);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    /// getting totalSum from Provider
    int total = Provider.of<AppointmentData>(context, listen: true).total;
    DateTime dateTime = Provider.of<AppointmentData>(context, listen: false)
        .servicesAndEmployees[0]
        .dateTime;

    String lastDay = '${dateTime.day} '
        '${month[dateTime.month - 1]} '
        '${week[dateTime.weekday - 1]}';

    Provider.of<AppointmentData>(context, listen: false).lastDate = lastDay;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: CircularParent(
          radius: 20,
          gradient: functions.decideColor(context),
          direction: Directions.bottom,
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 10),
          icon: isConfirmed
              ? Icon(Icons.home, color: Colors.white, size: 40.0)
              : BackButton(),
          onPressed: () {
            Routers.router
                .navigateTo(context, "/Hosgeldiniz", clearStack: true);
          },
        ),
        title: Center(
            child: Text(
          "ayarla",
          style: kTitleStyle.copyWith(
              color: Colors.white, letterSpacing: 3, fontSize: 25),
        )),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 30, left: 10),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => UserPage()));
            },
            icon: Icon(Icons.account_circle, color: Colors.white, size: 35),
          ),
        ],
      ),
      body: AyarlaPage(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: 20.0, bottom: 15.0, left: 10.0, right: 10.0),
              child: Text(
                isConfirmed
                    ? Provider.of<AppointmentData>(context).coiffureName
                    : 'Randevu Özeti',
                textAlign: TextAlign.center,
                style: kTitleStyle,
              ),
            ),
            Center(
              child: AyarlaExpandable.extended(
                showArrowIcon: false,
                initiallyExpanded: isConfirmed ? false : true,
                arrowColor: Colors.black,
                padding: EdgeInsets.all(10),
                elevation: 5,
                additionalWidget: Text(
                  'Randevu Detay',
                  textAlign: TextAlign.center,
                  style: kTitleStyle,
                ),
                primaryWidget: Container(
                  width: size.width < 600 ? size.width / 2 : size.width / 2.4,
                  child: Column(
                    children: [
                      Text(
                        ///prints coiffureName from Provider
                        isConfirmed
                            ? 'Randevu Talebiniz Alınmıştır,\n'
                                'İşletmeden Onay Bekleniyor'
                            : Provider.of<AppointmentData>(context)
                                .coiffureName,
                        textAlign: TextAlign.center,
                        style: kTextStyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.normal),
                      ),

                      /// prints day
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text("Gün: ", style: kTitleStyle),
                            Text(
                              '${dateTime.day} '
                              '${month[dateTime.month - 1]} '
                              '${week[dateTime.weekday - 1]}',
                              style: kTitleStyle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 7),

                      /// prints hour
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Saat: ", style: kTitleStyle),
                            Text(
                              "${Provider.of<AppointmentData>(context).servicesAndEmployees[0].time}",
                              style: kTitleStyle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
                secondaryWidget: Column(
                  children: [
                    Divider(thickness: 2),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: localList.length,
                      itemBuilder: (BuildContext bc, int index) {
                        return Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Saat:', style: kSmallTextStyle),
                                Spacer(),
                                Text(localList[index].time,
                                    style: kSmallTextStyle),
                                Spacer(),
                                Text('Saat:',
                                    style: kSmallTextStyle.copyWith(
                                        color: Colors.transparent)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Hizmet:', style: kSmallTextStyle),
                                Spacer(),
                                Text(localList[index].service,
                                    style: kSmallTextStyle),
                                Spacer(),
                                Text('${localPriceList[index]} TL',
                                    style: kSmallTextStyle),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Çalışan:', style: kSmallTextStyle),
                                Spacer(),
                                Text(localList[index].employee,
                                    style: kSmallTextStyle),
                                Spacer(),
                                Text('Çalışan:',
                                    style: kSmallTextStyle.copyWith(
                                        color: Colors.transparent)),
                              ],
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext bc, int index) =>
                          Divider(thickness: 2),
                    ),
                    Divider(thickness: 2),
                    Row(
                      children: [
                        Text('Toplam', style: kSmallTextStyle),
                        Spacer(),
                        Text('$total TL', style: kSmallTextStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            /// Google Maps integration
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(height: 300, child: FlutterMapCoiffure()),
            ),
          ],
        ),
      ),
      floatingActionButton: !isConfirmed
          ? FloatingTextButton(
              text: 'Onayla',
              gradient: functions.decideColor(context),
              onPressed: () {
                bool check = Provider.of<Login>(context, listen: false).isLoggedIn;
                if (check == false) {
                  PopUp().mailFieldDialog(context: context);
                } else if (check == true) {
                  ///TODO profildeki mail adresine mail gonderilecek
                  Routers.router.navigateTo(context, "/OnaySayfasi");
                  Provider.of<AppointmentData>(context, listen: false)
                      .confirmation();
                }
                for(AppointmentInfo x in Provider.of<AppointmentData>(context, listen: false).servicesAndEmployees){
                  FirebaseAnalytics().logEvent(name: 'selectDate_button',
                      parameters:{'service': x.service, 'employee':x.employee, 'date': x.dateTime, 'state': 'confirmed'}
                  );
                }
              },
            )
          : AyarlaPageNoC(
              child: FloatingTextButton(
                text: 'Profilini Tamamla',
                gradient: functions.decideColor(context),
                onPressed: () {
                  Routers.router.navigateTo(context, "/Profilimi Düzenle");
                },
              ),
            ),
    );
  }
}
