import 'dart:ui';
import 'package:ayarla/components/floatingTextButton.dart';
import 'package:ayarla/components/UI/hover_button.dart';
import 'package:ayarla/components/map/flutterMap.dart';
import 'package:ayarla/constants/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/circularParent.dart';
import 'package:ayarla/components/pop-up.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/Appointment.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/screens/user_page/edit_profile_page.dart';
import 'package:ayarla/screens/user_page/user_page.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:ayarla/virtual_data_base/login.dart';
import 'package:universal_platform/universal_platform.dart';

class ConfirmationPage extends StatefulWidget {
  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  Functions functions = Functions();
  bool isPressedExpandIcon = false;
  bool isConfirmed;

  @override
  void initState() {
    super.initState();
    isConfirmed =
        Provider.of<AppointmentData>(context, listen: false).isConfirmed;
    Provider.of<AppointmentData>(context, listen: false).isConfirmed = false;
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
      body: ListView(
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
          Padding(
            padding: size.width < 700
                ? EdgeInsets.symmetric(horizontal: 15)
                : EdgeInsets.symmetric(horizontal: size.width / 10),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Text(
                      ///prints coiffureName from Provider
                      isConfirmed
                          ? 'Randevu Talebiniz Alınmıştır,\n'
                              'İşletmeden Onay Bekleniyor'
                          : Provider.of<AppointmentData>(context).coiffureName,
                      textAlign: TextAlign.center,
                      style: kTextStyle.copyWith(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),

                    /// prints day
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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

                    /// Appointment sum field
                    !isConfirmed
                        ? BuildSumPerDay()
                        : Column(
                            children: <Widget>[
                              Row(
                                children: [
                                  Text(
                                    'Randevu Detay',
                                    style: kTextStyle.copyWith(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 17),
                                  ),
                                  SizedBox(width: 10),
                                  SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: IconButton(
                                      icon: !isPressedExpandIcon
                                          ? Icon(Icons.expand_more_sharp)
                                          : Icon(Icons.expand_less_sharp),
                                      onPressed: () {
                                        setState(() {
                                          isPressedExpandIcon =
                                              !isPressedExpandIcon;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              isPressedExpandIcon
                                  ? Container(
                                      width: double.infinity,
                                      child: Column(
                                        children: [
                                          BuildSumPerDay(),
                                        ],
                                      ),
                                    )
                                  : Divider(thickness: 2),
                            ],
                          ),
                    Padding(
                      padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Toplam:',
                            style: kTextStyle.copyWith(
                                fontWeight: FontWeight.normal, fontSize: 17),
                          ),
                          Spacer(),
                          Text('$total TL',
                              style: kTextStyle.copyWith(fontSize: 20))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          if (UniversalPlatform.isWeb && isConfirmed == true)
            SizedBox(height: 40),
          if (UniversalPlatform.isWeb && isConfirmed == true)
            Center(
              child: Text(
                'Uygulamamızı indirmek ister misiniz?',
                style: kTextStyle,
              ),
            ),
          if (UniversalPlatform.isWeb && isConfirmed == true)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HoverButton(
                  text: 'PlayStore',
                  onPressed: () => print('Lauch PlayStore!'),
                  icon: FontAwesomeIcons.googlePlay,
                  spaceBetween: 10,
                ),
                HoverButton(
                  text: 'AppStore',
                  onPressed: () => print('Lauch AppStore!'),
                  icon: FontAwesomeIcons.appStoreIos,
                  spaceBetween: 10,
                ),
              ],
            ),

          /// Google Maps integration
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    offset: Offset(4, 4),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: FlutterMapCoiffure(),
            ),
          ),
        ],
      ),
      floatingActionButton: !isConfirmed
          ? FloatingTextButton(
              text: 'Onayla',
              gradient: functions.decideColor(context),
              onPressed: () {
                bool check = Provider.of<Login>(context, listen: false).holder;
                if (check == false) {
                  PopUp().mailFieldDialog(context: context);
                } else if (check == true) {
                  ///TODO profildeki mail adresine mail gonderilecek
                  Routers.router.navigateTo(context, "/OnaySayfasi");
                  Provider.of<AppointmentData>(context, listen: false)
                      .confirmation();
                }
              },
            )
          : FloatingTextButton(
              text: 'Profilini Tamamla',
              gradient: functions.decideColor(context),
              onPressed: () {
                Navigator.pushNamed(context, EditProfilePage.id);
              },
            ),
    );
  }
}

/// builds summation per day
class BuildSumPerDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Divider(thickness: 2),

        /// prints services for all services in the servicesAndEmployees list
        for (AppointmentInfo x
            in Provider.of<AppointmentData>(context).servicesAndEmployees)
          BuildColumn(
            time: x.time,
            service: x.service,
            employee: x.employee,
          ),
      ],
    );
  }
}

/// Creates Hour, Services, Employee section.
class BuildColumn extends StatelessWidget {
  final String time;
  final String service;
  final String employee;

  BuildColumn({this.time, this.service, this.employee});

  @override
  Widget build(BuildContext context) {
    /// finds selectedService`s price from Provider
    int price;
    for (int i = 0;
        i < Provider.of<AppointmentData>(context).fullTimeServices.length;
        i++) {
      if (Provider.of<AppointmentData>(context)
          .fullTimeServices[i]
          .name
          .contains(service)) {
        price = Provider.of<AppointmentData>(context).fullTimeServices[i].price;
      }
    }
    return Column(
      children: <Widget>[
        Row(
          /// on the left side we have two columns
          children: <Widget>[
            Column(
              children: <Widget>[
                BuildRow(header: 'Saat:', content: time),
                BuildRow(header: 'Hizmet:', content: service),
                BuildRow(header: 'Çalışan:', content: employee),
              ],
            ),
            Spacer(),

            /// on the right side we have only total part
            Text(
              '$price TL',
              style: kTextStyle.copyWith(fontSize: 20),
              textAlign: TextAlign.end,
            )
          ],
        ),
        Divider(thickness: 2),
      ],
    );
  }
}

/// creates only one row of hour, day, service, employee
class BuildRow extends StatelessWidget {
  final String header;
  final String content;

  /// if the length of the String is more than the box then fitted Box will be used
  Widget _textLength({String content}) {
    if (content.length >= 17) {
      return FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          content,
          style: kTextStyle,
        ),
      );
    } else {
      return Text(
        content,
        textAlign: TextAlign.center,
        style: kTextStyle.copyWith(fontSize: 17),
      );
    }
  }

  BuildRow({@required this.header, @required this.content});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        width: size.width - 3 * (size.width / 9),
        child: Row(
          children: <Widget>[
            Container(
              width: 65,
              child: Text(
                header,
                style: kTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                child: _textLength(content: content),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
