import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/models/model_service.dart';
import 'package:ayarla/virtual_data_base/temporaryLists.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/components/timeDropdown.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/services/service_appointment.dart';

class EmployeePage extends StatefulWidget {
  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
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
    services = fullTimeServices;
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
        color: Colors.orange[500],
        title: Center(
            child: Text(
          'ayarla',
          style: kTitleStyle.copyWith(color: Colors.white),
        )),
      ).build(context),
      body: AyarlaPage(
        child: OverScroll(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10),
            children: [
              SizedBox(height: 10),
              Expandable(
                showArrowIcon: true,
                primaryWidget: Container(
                    height: 30,
                    child: Center(child: Text('Çalışma Günlerinizi Seçiniz', style: kTextStyle))),
                secondaryWidget: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Text('Günler', style: kSmallTitleStyle),
                          Spacer(),
                          // Text('Aynı Ata', style: kSmallTextStyle),
                          // SizedBox(width: 5),
                          // Checkbox(
                          //     value: allDayCheckBox,
                          //     onChanged: (value) {
                          //       setState(() {});
                          //     }),
                          SizedBox(width: 10),
                          Text('Hepsini seç', style: kSmallTextStyle),
                          SizedBox(width: 5),
                          Checkbox(
                              value: allDayCheckBox,
                              onChanged: (value) {
                                setState(() {
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
                    ),
                    Container(
                      height: size.height / 2,
                      width: size.width,
                      color: Colors.white,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Text(week[index], style: kSmallTextStyle),
                              Spacer(),
                              Container(
                                // width: size.width / 2.7,
                                height: size.height / 15,
                                color: Colors.transparent,
                                child: Row(
                                  children: [
                                    TimeDropdown(timeList: dividedHours),
                                    Text(' - '),
                                    TimeDropdown(timeList: dividedHours),
                                  ],
                                ),
                              ),
                              // SizedBox(width: size.width / 12),
                              Checkbox(
                                  value: weekBoolList[index],
                                  onChanged: (value) {
                                    setState(() {
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
              ),
              SizedBox(height: 20),
              Expandable(
                showArrowIcon: true,
                centralizePrimaryWidget: true,
                primaryWidget: Container(
                    height: 30,
                    child: Center(child: Text('Hizmet Belirleyiniz', style: kTextStyle))),
                secondaryWidget: Column(
                  children: [
                    SizedBox(height: 15),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          'Hizmetler',
                          style: kTitleStyle.copyWith(
                              fontSize: size.width <= 400 ? size.width / 20 : 20),
                        ),
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
                                services[index].userName,
                                style: kSmallTextStyle.copyWith(
                                    fontSize: size.width <= 400 ? size.width / 20 : 20),
                              ),
                              Spacer(),
                              Checkbox(
                                activeColor: Colors.green.shade700,
                                value: serviceBoolList[index],
                                onChanged: (value) {
                                  setState(() {
                                    serviceBoolList[index] = !serviceBoolList[index];
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
