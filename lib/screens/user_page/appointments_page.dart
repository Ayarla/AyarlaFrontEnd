import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/models/model_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
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
  List appointments = [];
  List<AppointmentInfo> localList = [];
  List<int> localPriceList = [];
  DateTime dateTime;
  int total = 0;

  Widget body(double width, int index) {
    DateTime dateTime =
        Provider.of<AppointmentData>(context, listen: false).servicesAndEmployees[0].dateTime;

    String lastDay = '${dateTime.day} ${month[dateTime.month - 1]} ${week[dateTime.weekday - 1]}';

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
                  Provider.of<AppointmentData>(context).coiffureName,
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
                      Text(lastDay, style: kTitleStyle),
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
                          Text(localList[index].time, style: kSmallTextStyle),
                          Spacer(),
                          Text('Saat:', style: kSmallTextStyle.copyWith(color: Colors.transparent)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Hizmet:', style: kSmallTextStyle),
                          Spacer(),
                          Text(localList[index].service, style: kSmallTextStyle),
                          Spacer(),
                          Text('${localPriceList[index]} TL', style: kSmallTextStyle),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Çalışan:', style: kSmallTextStyle),
                          Spacer(),
                          Text(localList[index].employee, style: kSmallTextStyle),
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
                  Text('$total TL', style: kSmallTextStyle),
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
                child:
                    Text('Randevumu İptal Et', style: kTitleStyle.copyWith(color: Colors.white))),
            onPressed: () {}),
      ],
    );
  }

  @override
  void initState() {
    appointments = Provider.of<AppointmentData>(context, listen: false).appointments;
    localList = Provider.of<AppointmentData>(context, listen: false).servicesAndEmployees;

    for (ServiceModel x in Provider.of<AppointmentData>(context, listen: false).fullTimeServices) {
      for (AppointmentInfo y in localList) {
        if (y.service == x.name) {
          localPriceList.add(x.price);
        }
      }
    }
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
        child: appointments.isEmpty
            ? Center(child: Text('Henüz bir randevunuz yok.', style: kTextStyle))
            : CarouselSlider(
                options: CarouselOptions(enlargeCenterPage: true, enableInfiniteScroll: false),

                /// TODO - need index & proper height
                items: localList.map((index) => body(width, 0)).toList(),
              ),
      ),
    );
  }
}
