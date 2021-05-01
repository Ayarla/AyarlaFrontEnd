import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/screens/user_page/appointments_page.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';

class PastAppointmentsPage extends StatefulWidget {
  @override
  _PastAppointmentsPageState createState() => _PastAppointmentsPageState();
}

class _PastAppointmentsPageState extends State<PastAppointmentsPage> {
  Functions functions = Functions();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: DefaultAppBar(
        showIconButton: false,
        gradient: functions.decideColor(context),
        title: Center(
          child: Text(
            "Geçmiş Randevularım",
            style: kTitleStyle.copyWith(color: Colors.white),
          ),
        ),
      ).build(context),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            if (Provider.of<AppointmentData>(context, listen: false)
                    .servicesAndEmployees
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
                    items: [1, 2].map((i) {
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
                                    color: Colors.white,
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
                                                                  .coiffureName,
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
                                                                  '${Provider.of<AppointmentData>(context, listen: false).servicesAndEmployees[0].dateTime.day} '
                                                                  '${month[Provider.of<AppointmentData>(context, listen: false).servicesAndEmployees[0].dateTime.month - 1]} '
                                                                  '${week[Provider.of<AppointmentData>(context, listen: false).servicesAndEmployees[0].dateTime.weekday - 1]}',
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
                                                                  "${Provider.of<AppointmentData>(context).servicesAndEmployees[0].time}",
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
                                                                  UserBuildSumPerDay(),
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
                                                                          '${Provider.of<AppointmentData>(context, listen: true).total} TL',
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
    );
  }
}
