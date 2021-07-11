import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/ayarla_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/model_appointment.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';

class AppointmentsPage extends StatefulWidget {
  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  Functions functions = Functions();
  List<Appointment> appointment;
  List<int> integerList = [];

  @override
  void initState() {
    appointment =
        Provider.of<AppointmentData>(context, listen: false).appointments;
    for (int i = 0;
        i <
            Provider.of<AppointmentData>(context, listen: false)
                .appointments
                .length;
        i++) {
      integerList.add(i);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: DefaultAppBar(
        showIconButton: false,
        gradient: functions.decideColor(context),
        title: Center(
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text("Randevularım",
                  style: kTitleStyle.copyWith(
                      color: Colors.white,
                      letterSpacing: 2,
                      fontSize: 25))),
        ),
      ).build(context),
      body: AyarlaPage(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Center(
                child: Container(
                  child: Text("Onaylandı", style: kTitleStyle),
                ),
              ),
              if (Provider.of<AppointmentData>(context, listen: false)
                      .appointments
                      .length !=
                  0)

                ///TODO widget yap iki kere kullanıyosun
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: CarouselSlider(
                      options: CarouselOptions(
                        height: size.height * 2 / 3,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true,
                        // autoPlay: true,
                      ),
                      items: integerList.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return ListView(
                              physics: BouncingScrollPhysics(),
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16.0)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.6),
                                        offset: const Offset(4, 4),
                                        blurRadius: 15,
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16.0)),
                                    child: Container(
                                      color: Colors.green.shade100,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, top: 8, bottom: 8),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 4.0),
                                                      child: Container(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 8.0),
                                                          child: Column(
                                                            children: <Widget>[
                                                              Text(
                                                                Provider.of<AppointmentData>(
                                                                        context)
                                                                    .appointments[
                                                                        i]
                                                                    .name,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: kTextStyle.copyWith(
                                                                    fontSize: 18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal),
                                                              ),
                                                              SizedBox(height: 7),

                                                              /// prints day
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    "Gün: ",
                                                                    style: kTitleStyle
                                                                        .copyWith(
                                                                            fontSize:
                                                                                18),
                                                                  ),
                                                                  Text(
                                                                    '${Provider.of<AppointmentData>(context, listen: false).appointments[i].appointment[0].dateTime.day} '
                                                                    '${month[Provider.of<AppointmentData>(context, listen: false).appointments[i].appointment[0].dateTime.month - 1]} '
                                                                    '${week[Provider.of<AppointmentData>(context, listen: false).appointments[i].appointment[0].dateTime.weekday - 1]}',
                                                                    style: kTitleStyle
                                                                        .copyWith(
                                                                            fontSize:
                                                                                18),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(height: 7),

                                                              /// prints hour
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    "Saat: ",
                                                                    style: kTitleStyle
                                                                        .copyWith(
                                                                            fontSize:
                                                                                18),
                                                                  ),
                                                                  Text(
                                                                    "${Provider.of<AppointmentData>(context, listen: false).appointments[i].appointment[0].time}",
                                                                    style: kTitleStyle
                                                                        .copyWith(
                                                                            fontSize:
                                                                                18),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Container(
                                                                child: Column(
                                                                  children: <
                                                                      Widget>[
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: <
                                                                          Widget>[
                                                                        Divider(
                                                                          thickness:
                                                                              2,
                                                                        ),

                                                                        /// prints services for all services in the servicesAndEmployees list
                                                                        for (AppointmentInfo x in Provider.of<AppointmentData>(
                                                                                context,
                                                                                listen:
                                                                                    false)
                                                                            .appointments[
                                                                                i]
                                                                            .appointment)
                                                                          UserBuildColumn(
                                                                            time:
                                                                                x.time,
                                                                            service:
                                                                                x.service,
                                                                            employee:
                                                                                x.employee,
                                                                          ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsets.only(
                                                                          top:
                                                                              4.0,
                                                                          bottom:
                                                                              4.0,
                                                                          right:
                                                                              16.0,
                                                                          left:
                                                                              25.0),
                                                                      child: Row(
                                                                        children: <
                                                                            Widget>[
                                                                          Text(
                                                                            'Toplam:',
                                                                            style: kTextStyle.copyWith(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontSize: 14),
                                                                          ),
                                                                          Spacer(),
                                                                          Text(
                                                                            '${Provider.of<AppointmentData>(context, listen: true).appointments[i].price} TL',
                                                                            style:
                                                                                kTextStyle.copyWith(fontSize: 18),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                    ///TODO randevu özeti confirmation page'den kopyalandı alternatif bulunabilir?
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }).toList()),
                ),
              Center(
                child: Container(
                  child: Text("Onay Bekleniyor", style: kTitleStyle),
                ),
              ),
              if (Provider.of<AppointmentData>(context, listen: false)
                      .appointments
                      .length !=
                  0)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: CarouselSlider(
                      options: CarouselOptions(
                        height: size.height * 2 / 3,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true,
                        // autoPlay: true,
                      ),
                      items: integerList.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return ListView(
                              physics: BouncingScrollPhysics(),
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16.0)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.6),
                                        offset: const Offset(4, 4),
                                        blurRadius: 15,
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16.0)),
                                    child: Container(
                                      color: Colors.yellow.shade100,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, top: 8, bottom: 8),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 4.0),
                                                      child: Container(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 8.0),
                                                          child: Column(
                                                            children: <Widget>[
                                                              Text(
                                                                Provider.of<AppointmentData>(
                                                                        context)
                                                                    .appointments[
                                                                        i]
                                                                    .name,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: kTextStyle.copyWith(
                                                                    fontSize: 18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal),
                                                              ),
                                                              SizedBox(height: 7),

                                                              /// prints day
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    "Gün: ",
                                                                    style: kTitleStyle
                                                                        .copyWith(
                                                                            fontSize:
                                                                                18),
                                                                  ),
                                                                  Text(
                                                                    '${Provider.of<AppointmentData>(context, listen: false).appointments[i].appointment[0].dateTime.day} '
                                                                    '${month[Provider.of<AppointmentData>(context, listen: false).appointments[i].appointment[0].dateTime.month - 1]} '
                                                                    '${week[Provider.of<AppointmentData>(context, listen: false).appointments[i].appointment[0].dateTime.weekday - 1]}',
                                                                    style: kTitleStyle
                                                                        .copyWith(
                                                                            fontSize:
                                                                                18),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(height: 7),

                                                              /// prints hour
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    "Saat: ",
                                                                    style: kTitleStyle
                                                                        .copyWith(
                                                                            fontSize:
                                                                                18),
                                                                  ),
                                                                  Text(
                                                                    "${Provider.of<AppointmentData>(context, listen: false).appointments[i].appointment[0].time}",
                                                                    style: kTitleStyle
                                                                        .copyWith(
                                                                            fontSize:
                                                                                18),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              Container(
                                                                child: Column(
                                                                  children: <
                                                                      Widget>[
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: <
                                                                          Widget>[
                                                                        Divider(
                                                                          thickness:
                                                                              2,
                                                                        ),

                                                                        /// prints services for all services in the servicesAndEmployees list
                                                                        for (AppointmentInfo x in Provider.of<AppointmentData>(
                                                                                context,
                                                                                listen:
                                                                                    false)
                                                                            .appointments[
                                                                                i]
                                                                            .appointment)
                                                                          UserBuildColumn(
                                                                            time:
                                                                                x.time,
                                                                            service:
                                                                                x.service,
                                                                            employee:
                                                                                x.employee,
                                                                          ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsets.only(
                                                                          top:
                                                                              4.0,
                                                                          bottom:
                                                                              4.0,
                                                                          right:
                                                                              16.0,
                                                                          left:
                                                                              25.0),
                                                                      child: Row(
                                                                        children: <
                                                                            Widget>[
                                                                          Text(
                                                                            'Toplam:',
                                                                            style: kTextStyle.copyWith(
                                                                                fontWeight: FontWeight.normal,
                                                                                fontSize: 14),
                                                                          ),
                                                                          Spacer(),
                                                                          Text(
                                                                            '${Provider.of<AppointmentData>(context, listen: true).appointments[i].price} TL',
                                                                            style:
                                                                                kTextStyle.copyWith(fontSize: 18),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                    ///TODO randevu özeti confirmation page'den kopyalandı alternatif bulunabilir?
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }).toList()),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// builds summation per day
class UserBuildSumPerDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Divider(
          thickness: 2,
        ),

        /// prints services for all services in the servicesAndEmployees list
        for (AppointmentInfo x
            in Provider.of<AppointmentData>(context).servicesAndEmployees)
          UserBuildColumn(
            time: x.time,
            service: x.service,
            employee: x.employee,
          ),
      ],
    );
  }
}

/// Creates Hour, Services, Employee section.
class UserBuildColumn extends StatelessWidget {
  final String time;
  final String service;
  final String employee;

  UserBuildColumn({this.time, this.service, this.employee});

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
          mainAxisAlignment: MainAxisAlignment.end,

          /// on the left side we have two columns
          children: <Widget>[
            Column(
              children: <Widget>[
                UserBuildRow(header: 'Saat:', content: time),
                UserBuildRow(header: 'Hizmet:', content: service),
                UserBuildRow(header: 'Çalışan:', content: employee),
              ],
            ),

            /// on the right side we have only total part
            Container(
              width: MediaQuery.of(context).size.width / 5.7,
              child: Text(
                '$price TL',
                style: kTextStyle.copyWith(fontSize: 18),
                textAlign: TextAlign.start,
              ),
            )
          ],
        ),
        Divider(
          thickness: 2,
        )
      ],
    );
  }
}

/// creates only one row of hour, day, service, employee
class UserBuildRow extends StatelessWidget {
  final String header;
  final String content;

  /// if the length of the String is more than the box then fitted Box will be used
  Widget _textLength({String content}) {
    if (content.length >= 17) {
      return FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          content,
          style: kTextStyle.copyWith(fontSize: 15),
        ),
      );
    } else {
      return Text(
        content,
        textAlign: TextAlign.center,
        style: kTextStyle.copyWith(fontSize: 14),
      );
    }
  }

  UserBuildRow({@required this.header, @required this.content});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        width: MediaQuery.of(context).size.width -
            3 * (MediaQuery.of(context).size.width / 6),
        child: Row(
          children: <Widget>[
            Container(
              width: 65,
              child: Text(
                header,
                style: kTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.normal),
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
