import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/components/ayarla_textfield.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/models/model_employee.dart';
import 'package:ayarla/models/model_service.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:badges/badges.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ServiceSectionBusiness extends StatefulWidget {
  @override
  _ServiceSectionBusinessState createState() => _ServiceSectionBusinessState();
}

class _ServiceSectionBusinessState extends State<ServiceSectionBusiness> {
  bool editService = false;
  Functions functions = Functions();
  int price;
  String serviceName;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    openAlertBox(int serviceIndex) {
      List boolList = [];
      for (int i = 0;
          i <
              Provider.of<AppointmentData>(context, listen: false)
                  .employeesList
                  .length;
          i++) {
        boolList.add(false);
      }
      bool isValid(String name) {
        for (EmployeeModel x
            in Provider.of<AppointmentData>(context, listen: false)
                .fullTimeServices[serviceIndex]
                .employees) {
          if (x.name == name) {
            return true;
          }
        }
        return false;
      }

      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState1) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                contentPadding: EdgeInsets.only(top: 10.0),
                content: Container(
                  width: 300.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Personel Seçiniz",
                            style: TextStyle(fontSize: 24.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 4.0,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: Column(
                            children: [
                              for (EmployeeModel x
                                  in Provider.of<AppointmentData>(context,
                                          listen: true)
                                      .employeesList)
                                (isValid(x.name)
                                    ? SizedBox(width: 0, height: 0)
                                    : Row(
                                        children: [
                                          Text(x.name, style: kTextStyle),
                                          Checkbox(
                                              value: boolList[
                                                  Provider.of<AppointmentData>(
                                                          context,
                                                          listen: false)
                                                      .employeesList
                                                      .indexOf(x)],
                                              onChanged: (value) {
                                                setState1(() {
                                                  boolList[Provider.of<
                                                              AppointmentData>(
                                                          context,
                                                          listen: false)
                                                      .employeesList
                                                      .indexOf(
                                                          x)] = !boolList[
                                                      Provider.of<AppointmentData>(
                                                              context,
                                                              listen: false)
                                                          .employeesList
                                                          .indexOf(x)];
                                                });
                                              })
                                        ],
                                      )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      int index = 0;
                                      for (bool x in boolList) {
                                        if (x == true) {
                                          Provider.of<AppointmentData>(context,
                                                  listen: false)
                                              .setEmployee(serviceIndex, index);
                                        }
                                        index++;
                                      }
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        )),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.grey)),
                                    child: Text(
                                      "Onayla",
                                      style: kTextStyle.copyWith(
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              );
            });
          });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hizmetler', style: kTitleStyle),
        for (ServiceModel serviceModel
            in Provider.of<AppointmentData>(context, listen: true)
                .fullTimeServices)
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Expandable(
              elevation: 5,
              padding: EdgeInsets.all(5.0),
              primaryWidget: Container(
                width: width - 90,
                height: 60,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(serviceModel.name,
                        overflow: TextOverflow.ellipsis,
                        style: kTextStyle.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: width <= 400 ? width / 20 : 20)),
                    Spacer(),
                    Text(serviceModel.price.toString(),
                        style: kTextStyle.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: width <= 400 ? width / 20 : 20)),
                    Text(" ₺",
                        style: TextStyle(
                            fontSize: width <= 400 ? width / 20 : 20)),
                    SizedBox(width: 10),
                    IconButton(
                      splashRadius: 20,
                      icon: Icon(
                        Icons.remove_circle_rounded,
                        color: Colors.red.shade600,
                        size: width <= 400 ? width / 18.2 : 22,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),

              /// TODO - Notif Badge Function
              secondaryWidget: Stack(children: [
                Container(
                  height: 100,
                  width: width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Badge(
                        position: BadgePosition(top: 10, start: 85),
                        badgeColor: Colors.green.shade700,
                        badgeContent: Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                          size: 12,
                        ),
                        child: GenericIconButton(
                          iconContext: Icon(
                            Icons.account_circle_rounded,
                            color: Colors.grey,
                            size: width <= 400 ? width / 20 : 50,
                          ),
                          text: Provider.of<AppointmentData>(context,
                                  listen: true)
                              .defaultEmployee
                              .name,
                          width: width <= 400 ? width / 2.75 : 150,
                          textStyle: kTextStyle.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: width <= 400 ? width / 30 : 14),
                        ),
                      ),
                      for (EmployeeModel y
                          in Provider.of<AppointmentData>(context, listen: true)
                              .fullTimeServices[
                                  functions.findIndex(serviceModel, context)]
                              .employees)
                        GenericIconButton(
                          width: width <= 400 ? width / 2.75 : 150,
                          text: y.name,
                          iconContext: Badge(
                            position: BadgePosition(top: 0, start: 55),
                            badgeContent: Icon(
                              Icons.remove_rounded,
                              color: Colors.white,
                              size: 12,
                            ),
                            child: Image(
                              image: AssetImage(y.image),
                              fit: BoxFit.scaleDown,
                              height: width <= 400 ? width / 8 : 50,
                            ),
                          ),
                          textStyle: kTextStyle.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: width <= 400 ? width / 30 : 14),
                        ),
                      // Stack(
                      //   children: [
                      //     Container(
                      //       child: Padding(
                      //         padding: const EdgeInsets.symmetric(
                      //             horizontal: 12.0, vertical: 4.0),
                      //         child: Container(
                      //           width: 90,
                      //           child: Column(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               Padding(
                      //                 padding:
                      //                     const EdgeInsets.only(bottom: 8.0),
                      //                 child: ClipRRect(
                      //                   borderRadius:
                      //                       BorderRadius.circular(10),
                      //                   child: Image(
                      //                     // height:
                      //                     // height / 20,
                      //                     image: AssetImage(
                      //                       y.image,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //               FittedBox(
                      //                   child: Text(
                      //                     y.name,
                      //                     style: kSmallTextStyle.copyWith(
                      //                       color: Colors.black,
                      //                     ),
                      //                   ),
                      //                   fit: BoxFit.cover)
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     Positioned(
                      //         top: -12,
                      //         right: 5,
                      //         child: IconButton(
                      //           icon: Icon(Icons.remove_circle,
                      //               color: Colors.red),
                      //           onPressed: () {
                      //             Provider.of<AppointmentData>(context,
                      //                     listen: false)
                      //                 .removeEmployeeFromService(
                      //                     functions.findIndex(x, context),
                      //                     functions.findIndexOfEmployee(
                      //                         functions.findIndex(x, context),
                      //                         y,
                      //                         context));
                      //           },
                      //         ))
                      //   ],
                      // )
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 10,
                  child: Icon(Icons.keyboard_arrow_right),
                )
              ]),
            ),
          ),
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Expandable(
            elevation: 5,
            padding: EdgeInsets.all(5.0),
            primaryWidget: Row(
              children: [
                Container(
                  width: 400,
                  padding: EdgeInsets.all(8.0),
                  child: AyarlaTextField(
                    hintText: Text(
                      'Hizmet Adı Giriniz',
                      style: kTextStyle.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: width <= 400 ? width / 20 : 20),
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 90,
                  child: AyarlaTextField(
                    hintText: Text(
                      '10',
                      style: kTextStyle.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: width <= 400 ? width / 20 : 20),
                      textAlign: TextAlign.end,
                    ),
                    padding: EdgeInsets.only(top: 14, bottom: 14, right: 15),
                  ),

                  /// TODO
                  //   keyboardType: TextInputType.number,
                  //   inputFormatters: <TextInputFormatter>[
                  //     FilteringTextInputFormatter.digitsOnly
                  //   ],
                ),
                Text(' ₺',
                    style: TextStyle(fontSize: width <= 400 ? width / 20 : 20)),
                SizedBox(width: 10),
                IconButton(
                  splashRadius: 20,
                  icon: Icon(
                    Icons.add_circle_rounded,
                    color: Colors.green.shade700,
                    size: width <= 400 ? width / 18.2 : 22,
                  ),
                  onPressed: () {},
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
