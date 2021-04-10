import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/circularParent.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/components/timeDropdown.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/employeeAndService.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:ayarla/virtual_data_base/businessOrUser_data.dart';

class EmployeePage extends StatefulWidget {
  static const String id = 'EmployeePage';

  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  List serviceBoolList = [];
  List services = [];
  serviceSheet() {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          final size = MediaQuery.of(context).size;
          bool value;
          return StatefulBuilder(
            builder: (BuildContext bc, StateSetter setState2) {
              return CircularParent(
                radius: 20,
                direction: Directions.top,
                color: Colors.white,
                child: ListView(
                  children: [
                    SizedBox(height: 15),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text('Hizmetler', style: kTitleStyle),
                      ],
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: size.height / 2,
                      width: size.width,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        physics: BouncingScrollPhysics(),
                        itemCount: services.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Text(
                                services[index].name,
                                style: kTextStyle,
                              ),
                              Spacer(),
                              Checkbox(
                                value: serviceBoolList[index],
                                onChanged: (value) {
                                  setState2(() {
                                    serviceBoolList[index] =
                                        !serviceBoolList[index];
                                  });
                                },
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(thickness: 1);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }

  bool allDayCheckBox = false;
  bool checkBox = false;
  List weekBoolList = [];
  List week = [];

  daySheet() {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        final size = MediaQuery.of(context).size;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState1) {
            return CircularParent(
              radius: 20,
              direction: Directions.top,
              color: Colors.white,
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                children: [
                  Row(
                    children: [
                      Text('Günler', style: kSmallTitleStyle),
                      Spacer(),
                      Text('Aynı Ata', style: kSmallTextStyle),
                      SizedBox(width: 5),
                      Checkbox(
                          value: allDayCheckBox,
                          onChanged: (value) {
                            setState1(() {});
                          }),
                      SizedBox(width: 10),
                      Text('Hepsini seç', style: kSmallTextStyle),
                      SizedBox(width: 5),
                      Checkbox(
                          value: allDayCheckBox,
                          onChanged: (value) {
                            setState1(() {
                              if (allDayCheckBox == false) {
                                weekBoolList.clear();
                                weekBoolList.add(true);
                                weekBoolList.add(true);
                                weekBoolList.add(true);
                                weekBoolList.add(true);
                                weekBoolList.add(true);
                                weekBoolList.add(true);
                                weekBoolList.add(true);
                                weekBoolList.add(true);
                              } else if (allDayCheckBox == true) {
                                weekBoolList.clear();
                                weekBoolList.add(false);
                                weekBoolList.add(false);
                                weekBoolList.add(false);
                                weekBoolList.add(false);
                                weekBoolList.add(false);
                                weekBoolList.add(false);
                                weekBoolList.add(false);
                                weekBoolList.add(false);
                              }
                              allDayCheckBox = !allDayCheckBox;
                            });
                          }),
                    ],
                  ),
                  Container(
                    height: size.height / 2,
                    width: size.width,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemCount: 7,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Text(week[index], style: kTextStyle),
                            Spacer(),
                            Container(
                              // width: size.width / 2.7,
                              height: size.height / 15,
                              color: Colors.transparent,
                              // child: TextField(
                              //   decoration: InputDecoration(
                              //     hintText: 'Saat Giriniz',
                              //     hintStyle: kTextStyle.copyWith(fontSize: 10),
                              //     fillColor: Colors.grey[200],
                              //     filled: true,
                              //     border: OutlineInputBorder(
                              //       borderRadius: BorderRadius.all(
                              //         Radius.circular(25.0),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              child: Row(
                                children: [
                                  TimeDropdown(selected: '00.00'),
                                  Text(' - '),
                                  TimeDropdown(selected: '00.00'),
                                ],
                              ),
                            ),
                            // SizedBox(width: size.width / 12),
                            Checkbox(
                                value: weekBoolList[index],
                                onChanged: (value) {
                                  setState1(() {
                                    weekBoolList[index] = !weekBoolList[index];
                                  });
                                }),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(thickness: 1);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  void initState() {
    week = [
      "Pazartesi",
      "Salı",
      "Çarşamba",
      "Perşembe",
      "Cuma",
      "Cumartesi",
      "Pazar"
    ];
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
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: DefaultAppBar(
        color: Colors.grey,
        title: Center(
            child: Text(
          'ayarla',
          style: kTitleStyle.copyWith(color: Colors.white),
        )),
      ).build(context),
      body: Container(
        width: size.width,
        height: size.height,
        child: OverScroll(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10),
            children: [
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: size.width,
                  height: size.height / 4,
                  child: Column(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Functions().showPicker(context);
                              },
                              child: CircleAvatar(
                                radius: 55,
                                backgroundColor: Colors.grey,
                                child: Provider.of<BusinessAndUserData>(context,
                                                listen: true)
                                            .userImage !=
                                        null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.file(
                                          Provider.of<BusinessAndUserData>(
                                                  context,
                                                  listen: true)
                                              .userImage,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        width: 100,
                                        height: 100,
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Çalışan İsmi', style: kTitleStyle),
                    ],
                  ),
                ),
              ),
              _getRow(
                size,
                'Çalışma Günlerini Seçiniz',
                () {
                  setState(() {
                    daySheet();
                  });
                },
              ),
              _getRow(
                size,
                'Hizmet belirleyiniz',
                () {
                  setState(() {
                    serviceSheet();
                  });
                },
              ),
              // _getRow(
              //   size,
              //   'İzin günü belirleyiniz',
              //   () {
              //   //   setState(() {
              //   //     detailSheet();
              //   //   });
              //   },
              // ),
              // Row(
              //   children: [
              //     Spacer(),
              //     FlatButton(
              //       onPressed: null,
              //       child: ClipRRect(
              //         borderRadius: BorderRadius.all(
              //           Radius.circular(20),
              //         ),
              //         child: Container(
              //           padding: EdgeInsets.symmetric(horizontal: 5),
              //           color: Colors.white,
              //           child: Padding(
              //             padding: const EdgeInsets.all(10.0),
              //             child: Text(
              //               'Kaydet',
              //               style: kTextStyle,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _getRow(Size size, String text, Function onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          width: size.width,
          color: Colors.white,
          child: TextButton(
            child: Center(
              child: Text(
                text,
                style: kTextStyle,
              ),
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
