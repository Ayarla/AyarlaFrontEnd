import 'dart:ui';
import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/components/floatingTextButton.dart';
import 'package:ayarla/components/map/flutterMap.dart';
import 'package:ayarla/constants/router.dart';
import 'package:ayarla/models/model_appointment.dart';
import 'package:ayarla/services/service_user.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/circularParent.dart';
import 'package:ayarla/components/pop-up.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/screens/user_page/user_page.dart';
import 'package:ayarla/services/service_appointment.dart';
import 'package:ayarla/services/service_login.dart';
import 'package:universal_platform/universal_platform.dart';

class ConfirmationPage extends StatefulWidget {
  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  Functions functions = Functions();
  bool isConfirmed;
  List localList = [];

  @override
  void initState() {
    super.initState();
    isConfirmed = Provider.of<AppointmentService>(context, listen: false)
        .currentAppointment
        .isConfirmedByUser;
    localList = Provider.of<AppointmentService>(context, listen: false)
        .currentAppointment
        .appointmentDetails;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Appointment currentAppointment =
        Provider.of<AppointmentService>(context, listen: false).currentAppointment;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: CircularParent(
            radius: 20, gradient: functions.decideColor(context), direction: Directions.bottom),
        leading: IconButton(
          padding: EdgeInsets.only(left: 10),
          icon: isConfirmed ? Icon(Icons.home, color: Colors.white, size: 40.0) : BackButton(),
          onPressed: () => Routers.router.navigateTo(context, "/Hosgeldiniz", clearStack: true),
        ),
        title: Center(
            child: Text(
          "ayarla",
          style: kTitleStyle.copyWith(color: Colors.white, letterSpacing: 3, fontSize: 25),
        )),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 30, left: 10),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserPage()));
            },
            icon: Icon(Icons.account_circle, color: Colors.white, size: 35),
          ),
        ],
      ),
      body: AyarlaPage(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 15.0, left: 10.0, right: 10.0),
              child: Text(
                isConfirmed ? '${currentAppointment.coiffureName}' : 'Randevu Özeti',
                textAlign: TextAlign.center,
                style: kTitleStyle,
              ),
            ),
            Center(
              child: Expandable.extended(
                initiallyExpanded: isConfirmed ? false : true,
                padding: EdgeInsets.all(10),
                elevation: 5,
                additionalWidget:
                    Text('Randevu Detay', textAlign: TextAlign.center, style: kTitleStyle),
                primaryWidget: Container(
                  width: size.width < 600 ? size.width / 2 : size.width / 2.4,
                  child: Column(
                    children: [
                      Text(
                        isConfirmed
                            ? 'Randevu Talebiniz Alınmıştır,\n'
                                'İşletmeden Onay Bekleniyor'
                            : currentAppointment.coiffureName,
                        textAlign: TextAlign.center,
                        style: kTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.normal),
                      ),

                      /// prints day
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text("Gün: ", style: kTitleStyle),
                            Text(currentAppointment.date, style: kTitleStyle),
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
                            Text(currentAppointment.hour, style: kTitleStyle),
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
                                Text(localList[index].hour, style: kSmallTextStyle),
                                Spacer(),
                                Text('Saat:',
                                    style: kSmallTextStyle.copyWith(color: Colors.transparent)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Hizmet:', style: kSmallTextStyle),
                                Spacer(),
                                Text(localList[index].serviceModel.name, style: kSmallTextStyle),
                                Spacer(),
                                Text('${localList[index].serviceModel.price} TL',
                                    style: kSmallTextStyle),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Çalışan:', style: kSmallTextStyle),
                                Spacer(),
                                Text(localList[index].employeeModel.name, style: kSmallTextStyle),
                                Spacer(),
                                Text('Çalışan:',
                                    style: kSmallTextStyle.copyWith(color: Colors.transparent)),
                              ],
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext bc, int index) => Divider(thickness: 2),
                    ),
                    Divider(thickness: 2),
                    Row(
                      children: [
                        Text('Toplam', style: kSmallTextStyle),
                        Spacer(),
                        Text('${currentAppointment.totalPrice} TL', style: kSmallTextStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            /// Google Maps integration
            FlutterMapCoiffure(),
            if (!Provider.of<LoginService>(context, listen: true).isLoggedIn &&
                UniversalPlatform.isWeb)
              Column(
                children: [
                  Divider(),
                  Center(child: Text('Uygulamamızı İndirmek İster Misiniz?', style: kTitleStyle)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/store_badges/google-play-badge.png', height: 65),
                      Image.asset('assets/store_badges/app_store_badge.png', height: 40),
                      // SvgPicture.asset(
                      //   'assets/store_badges/app_store_badge.svg',
                      //   height: 45,
                      // ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
      floatingActionButton: !isConfirmed
          ? AyarlaPageNoC(
              child: Row(
                children: [
                  FloatingTextButton(
                    text: 'Geri Dön',
                    onPressed: () => Routers.router.pop(context),
                    gradient: functions.decideColor(context),
                  ),
                  Spacer(),
                  FloatingTextButton(
                    text: 'Onayla',
                    gradient: functions.decideColor(context),
                    onPressed: () {
                      bool check = Provider.of<LoginService>(context, listen: false).isLoggedIn;
                      if (check == false) {
                        PopUp().mailFieldDialog(context: context);
                      } else if (check == true) {
                        ///TODO profildeki mail adresine mail gonderilecek
                        Provider.of<UserService>(context, listen: false)
                            .waitingAppointments
                            .add(currentAppointment);
                        Provider.of<AppointmentService>(context, listen: false)
                            .currentAppointment
                            .isConfirmedByUser = true;

                        /// TODO: do the reset somewhere else.
                        Provider.of<AppointmentService>(context, listen: false)
                            .resetCurrentAppointment();
                        Routers.router.navigateTo(context, "/OnaySayfasi");
                      }

                      // for (AppointmentInfo x
                      //     in Provider.of<AppointmentData>(context, listen: false).servicesAndEmployees) {
                      //   FirebaseAnalytics().logEvent(name: 'selectDate_button', parameters: {
                      //     'service': x.service,
                      //     'employee': x.employee,
                      //     'date': x.dateTime,
                      //     'state': 'confirmed'
                      //   });
                      // }
                    },
                  ),
                ],
              ),
            )
          : AyarlaPageNoC(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingTextButton(
                    text: 'Profilini Tamamla',
                    gradient: functions.decideColor(context),
                    onPressed: () {
                      Routers.router.navigateTo(context, "/Profilimi Düzenle");
                    },
                  ),
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
