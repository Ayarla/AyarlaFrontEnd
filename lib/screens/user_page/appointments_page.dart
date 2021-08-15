import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/services/service_user.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';

class AppointmentsPage extends StatefulWidget {
  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  Functions functions = Functions();
  List waitingAppointments = [];

  Widget body(double width, int index) {
    print(waitingAppointments[index].appointmentDetails[index].hour);
    return Column(
      children: [
        Expandable.extended(
          initiallyExpanded: false,
          padding: EdgeInsets.all(10),
          elevation: 5,
          additionalWidget: Text('Randevu Detay', textAlign: TextAlign.center, style: kTitleStyle),
          primaryWidget: Container(
            width: width < 600 ? width / 2 : width / 2.4,
            child: Column(
              children: [
                Text(
                  waitingAppointments[index].coiffureName,
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
                      Text(waitingAppointments[index].date, style: kTitleStyle),
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
                        waitingAppointments[index].hour,
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
                itemCount: waitingAppointments[index].appointmentDetails.length,
                itemBuilder: (BuildContext bc, int index2) {
                  return Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Saat:', style: kSmallTextStyle),
                          Spacer(),
                          Text(waitingAppointments[index].appointmentDetails[index2].hour,
                              style: kSmallTextStyle),
                          Spacer(),
                          Text('Saat:', style: kSmallTextStyle.copyWith(color: Colors.transparent)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Hizmet:', style: kSmallTextStyle),
                          Spacer(),
                          Text(
                              waitingAppointments[index]
                                  .appointmentDetails[index2]
                                  .serviceModel
                                  .name,
                              style: kSmallTextStyle),
                          Spacer(),
                          Text(
                              '${waitingAppointments[index].appointmentDetails[index2].serviceModel.price} TL',
                              style: kSmallTextStyle),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Çalışan:', style: kSmallTextStyle),
                          Spacer(),
                          Text(
                              waitingAppointments[index]
                                  .appointmentDetails[index2]
                                  .employeeModel
                                  .name,
                              style: kSmallTextStyle),
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
                  Text('${waitingAppointments[index].totalPrice} TL', style: kSmallTextStyle),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        TextButton(
            child: Container(
                padding: EdgeInsets.all(8),
                decoration:
                    BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(15)),
                child: Text('Bu Randevumu İptal Et',
                    style: kTitleStyle.copyWith(color: Colors.white))),
            onPressed: () {
              setState(() {
                Provider.of<UserService>(context, listen: false)
                    .waitingAppointments
                    .remove(waitingAppointments[index]);
                waitingAppointments.remove(index);
              });
            }),
      ],
    );
  }

  @override
  void initState() {
    waitingAppointments = Provider.of<UserService>(context, listen: false).waitingAppointments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: DefaultAppBar(
        showIconButton: false,
        gradient: functions.decideColor(context),
        title: Center(
          child: Text("Randevularım",
              style: kTitleStyle.copyWith(color: Colors.white, letterSpacing: 2, fontSize: 25)),
        ),
      ).build(context),
      body: AyarlaPage(
        child: waitingAppointments.isEmpty
            ? Center(child: Text('Henüz bir randevunuz yok.', style: kTextStyle))
            : CarouselSlider(
                options: CarouselOptions(
                  height: 500,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                ),

                /// TODO - need index & proper height
                items: waitingAppointments
                    .map((element) => body(width, waitingAppointments.indexOf(element)))
                    .toList(),
              ),
      ),
    );
  }
}
