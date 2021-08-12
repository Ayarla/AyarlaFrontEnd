import 'dart:html';

import 'package:ayarla/components/circularParent.dart';
import 'package:ayarla/components/timeDropdown.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/model_service.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EmployeeManageRow extends StatefulWidget {
  String name;
  int index;

  EmployeeManageRow({this.name, this.index});

  @override
  _EmployeeManageRowState createState() => _EmployeeManageRowState();
}

class _EmployeeManageRowState extends State<EmployeeManageRow> {
  List serviceBoolList = [];

  List services = [];

  bool allDayCheckBox = false;

  bool checkBox = false;

  List weekBoolList = [];

  @override
  void initState() {
    for (String x in week) {
      weekBoolList.add(false);
    }
    services =
        Provider.of<AppointmentData>(context, listen: false).fullTimeServices;
    for (ServiceModel x in services) {
      serviceBoolList.add(false);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expandable(
              padding: EdgeInsets.all(0.0),
              backgroundColor: Colors.white,
              showArrowIcon: true,
              hoverOn: false,
              elevation: 5,
              primaryWidget: Stack(
                children: [
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          color: Colors.red,
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            showDialog<void>(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      backgroundColor: Color(0xFFE5EBEE),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(25.0),
                                        ),
                                      ),
                                      title: Text(
                                        'Onay',
                                        style: kSmallTitleStyle,
                                        textAlign: TextAlign.center,
                                      ),
                                      content: Text("Çalışanı silmek istediğine emin misin?"),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text(
                                            'Hayır',
                                            style: kSmallTextStyle.copyWith(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          onPressed: () {
                                            ///function
                                            Navigator.pop(context);
                                          },
                                        ),
                                        TextButton(
                                          child: Text(
                                            'Evet',
                                            style: kSmallTextStyle.copyWith(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          onPressed: () {
                                            Provider.of<AppointmentData>(
                                                    context,
                                                    listen: false)
                                                .removeEmployee(widget.index);
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ]);
                                });
                          }),
                    ),
                  ),
                  Container(
                    width: size.width <= 650 ? size.width / 1.5 : 550,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 0, top: 8, bottom: 8, right: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Image.asset('assets/worker_1.png',
                                  fit: BoxFit.contain)),
                          Expanded(
                            flex: 4,

                            ///width: size.width / 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                /// name

                                Text(
                                  widget.name,
                                  style: kTextStyle.copyWith(
                                      fontSize: size.width <= 400
                                          ? size.width / 20
                                          : 20),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5),

                                /// First line
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow.shade700,
                                      size: 16,
                                    ),
                                    SizedBox(width: 4),
                                    Padding(
                                      padding: EdgeInsets.only(top: 4.0),
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '4.5',
                                              style: kSmallTextStyle.copyWith(
                                                color: Colors.grey
                                                    .withOpacity(0.8),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2),

                                /// Second Line
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 1),
                                    Icon(
                                      Icons.circle,
                                      size: 13,
                                      color: Colors.red,
                                    ),
                                    SizedBox(width: 7),
                                    Padding(
                                      padding: EdgeInsets.only(top: 1.0),
                                      child: Text(
                                        'Dolu',
                                        style: kSmallTextStyle.copyWith(
                                          color: Colors.grey.withOpacity(0.8),
                                          fontSize: 13,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              secondaryWidget: Flex(
                direction: size.width >= 650 ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Çalıştığı Günler",
                              style: kSmallTextStyle.copyWith(
                                  color: Colors.green.shade700,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(width: 5),
                          Padding(
                            padding: EdgeInsets.only(bottom: 4.0),
                            child: GestureDetector(
                              onTap: () {
                                showDialog<void>(
                                    context: context,
                                    barrierDismissible:
                                        false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          backgroundColor: Color(0xFFE5EBEE),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(25.0),
                                            ),
                                          ),
                                          title: Text(
                                            'Çalışan Çalışma Günleri',
                                            style: kSmallTitleStyle,
                                            textAlign: TextAlign.center,
                                          ),
                                          content: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Text('Günler',
                                                          style:
                                                              kSmallTitleStyle),
                                                      // Text('Aynı Ata', style: kSmallTextStyle),
                                                      // SizedBox(width: 5),
                                                      // Checkbox(
                                                      //     value: allDayCheckBox,
                                                      //     onChanged: (value) {
                                                      //       setState(() {});
                                                      //     }),
                                                      Spacer(),
                                                      SizedBox(width: 10),
                                                      Text('Hepsini seç',
                                                          style:
                                                              kSmallTextStyle),
                                                      SizedBox(width: 5),
                                                      Checkbox(
                                                          value: allDayCheckBox,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              if (allDayCheckBox ==
                                                                  false) {
                                                                weekBoolList
                                                                    .clear();
                                                                weekBoolList
                                                                    .add(true);
                                                                weekBoolList
                                                                    .add(true);
                                                                weekBoolList
                                                                    .add(true);
                                                                weekBoolList
                                                                    .add(true);
                                                                weekBoolList
                                                                    .add(true);
                                                                weekBoolList
                                                                    .add(true);
                                                                weekBoolList
                                                                    .add(true);
                                                                weekBoolList
                                                                    .add(true);
                                                              } else if (allDayCheckBox ==
                                                                  true) {
                                                                weekBoolList
                                                                    .clear();
                                                                weekBoolList
                                                                    .add(false);
                                                                weekBoolList
                                                                    .add(false);
                                                                weekBoolList
                                                                    .add(false);
                                                                weekBoolList
                                                                    .add(false);
                                                                weekBoolList
                                                                    .add(false);
                                                                weekBoolList
                                                                    .add(false);
                                                                weekBoolList
                                                                    .add(false);
                                                                weekBoolList
                                                                    .add(false);
                                                              }
                                                              allDayCheckBox =
                                                                  !allDayCheckBox;
                                                            });
                                                          }),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: size.height / 2,
                                                  width: size.width,
                                                  child: ListView.separated(
                                                    physics:
                                                        BouncingScrollPhysics(),
                                                    itemCount: 7,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Row(
                                                        children: [
                                                          Text(week[index],
                                                              style:
                                                                  kSmallTextStyle),
                                                          Spacer(),
                                                          Container(
                                                            // width: size.width / 2.7,
                                                            height:
                                                                size.height /
                                                                    15,
                                                            color: Colors
                                                                .transparent,
                                                            child: Row(
                                                              children: [
                                                                TimeDropdown(
                                                                    selected:
                                                                        '00.00',
                                                                    timeList:
                                                                        dividedHours),
                                                                Text(' - '),
                                                                TimeDropdown(
                                                                    selected:
                                                                        '00.00',
                                                                    timeList:
                                                                        dividedHours),
                                                              ],
                                                            ),
                                                          ),
                                                          // SizedBox(width: size.width / 12),
                                                          Checkbox(
                                                              value:
                                                                  weekBoolList[
                                                                      index],
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  weekBoolList[
                                                                          index] =
                                                                      !weekBoolList[
                                                                          index];
                                                                });
                                                              }),
                                                        ],
                                                      );
                                                    },
                                                    separatorBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Divider(
                                                          thickness: 1);
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: Text(
                                                'İptal',
                                                style: kSmallTextStyle.copyWith(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              onPressed: () {
                                                ///function
                                                Navigator.pop(context);
                                              },
                                            ),
                                            TextButton(
                                              child: Text(
                                                'Onayla',
                                                style: kSmallTextStyle.copyWith(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              onPressed: () {
                                                ///function
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ]);
                                    });
                              },
                              child: Icon(
                                FontAwesomeIcons.edit,
                                color: Colors.green.shade700,
                                size: size.width <= 400 ? size.width / 20 : 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Day(
                        day: "Pazartesi",
                        time: "09:00 - 17:00",
                        size: size,
                      ),
                      Day(day: "Salı", time: "09:00 - 12:00", size: size),
                      Day(day: "Çarşamba", time: "12:00 - 17:00", size: size),
                      Day(day: "Perşembe", time: "09:00 - 17:00", size: size),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Verdiği Hizmetler",
                              style: kSmallTextStyle.copyWith(
                                  color: Colors.green.shade700,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(width: 5),
                          Padding(
                            padding: EdgeInsets.only(bottom: 4.0),
                            child: GestureDetector(
                              onTap: () {
                                {
                                  showDialog<void>(
                                      context: context,
                                      barrierDismissible:
                                          false, // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            backgroundColor: Color(0xFFE5EBEE),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(25.0),
                                              ),
                                            ),
                                            title: Text(
                                              'Çalışan Çalışma Günleri',
                                              style: kSmallTitleStyle,
                                              textAlign: TextAlign.center,
                                            ),
                                            content: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  SizedBox(height: 15),
                                                  Row(
                                                    children: [
                                                      SizedBox(width: 20),
                                                      Text(
                                                        'Hizmetler',
                                                        style: kTitleStyle.copyWith(
                                                            fontSize: size
                                                                        .width <=
                                                                    400
                                                                ? size.width /
                                                                    20
                                                                : 20),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 5),
                                                  Container(
                                                    height: size.height / 2,
                                                    width: size.width,
                                                    child: ListView.separated(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20.0),
                                                      physics:
                                                          BouncingScrollPhysics(),
                                                      itemCount:
                                                          services.length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Row(
                                                          children: [
                                                            Text(
                                                              services[index]
                                                                  .name,
                                                              style: kSmallTextStyle.copyWith(
                                                                  fontSize: size
                                                                              .width <=
                                                                          400
                                                                      ? size.width /
                                                                          20
                                                                      : 20),
                                                            ),
                                                            Spacer(),
                                                            Checkbox(
                                                              activeColor:
                                                                  Colors.green
                                                                      .shade700,
                                                              value:
                                                                  serviceBoolList[
                                                                      index],
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  serviceBoolList[
                                                                          index] =
                                                                      !serviceBoolList[
                                                                          index];
                                                                });
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                      separatorBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Divider(
                                                            thickness: 1);
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text(
                                                  'İptal',
                                                  style:
                                                      kSmallTextStyle.copyWith(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  ///function
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              TextButton(
                                                child: Text(
                                                  'Onayla',
                                                  style:
                                                      kSmallTextStyle.copyWith(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  ///function
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ]);
                                      });
                                }
                              },
                              child: Icon(
                                FontAwesomeIcons.edit,
                                color: Colors.green.shade700,
                                size: size.width <= 400 ? size.width / 20 : 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Manikür",
                        style: kSmallTextStyle,
                      ),
                      Text(
                        "Pedikür",
                        style: kSmallTextStyle,
                      ),
                      Text(
                        "Saç Kesim",
                        style: kSmallTextStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        /*   Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: CircularParent(
                radius: 20,
                direction: Directions.all,
                color: Colors.indigo,
                child: IconSlideAction(
                  caption: 'Detay',
                  color: Colors.transparent,
                  icon: FontAwesomeIcons.userEdit,
                  // onTap: () => _showSnackBar('More'),
                ),
              ),
            ),
          ),*/
        /* Expanded(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              height: 100,
              child: CircularParent(
                radius: 20,
                direction: Directions.all,
                color: Colors.red,
                child: IconSlideAction(
                    caption: 'Kaldır',
                    color: Colors.transparent,
                    icon: Icons.delete,
                    onTap: () {
                      Provider.of<AppointmentData>(context, listen: false)
                          .removeEmployee(widget.index);
                    }),
              ),
            ),
          ),
        ),*/
      ],
    );
  }
}

class Day extends StatelessWidget {
  String day;
  String time;
  Size size;
  Day({@required this.day, this.time, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Wrap(crossAxisAlignment: WrapCrossAlignment.start, children: [
          Text(
            day,
            style: kSmallTextStyle,
          )
        ]),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [Text(time, style: kSmallTextStyle)]),
        ),
      ]),
    );
  }
}
