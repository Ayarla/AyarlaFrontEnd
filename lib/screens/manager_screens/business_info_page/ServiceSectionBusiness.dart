import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/components/ayarla_textfield.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/models/model_employee.dart';
import 'package:ayarla/models/model_service.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:ayarla/virtual_data_base/temporaryLists.dart';
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
  int price = 0;
  String serviceName = '';
  List localServiceList = [];

  @override
  void initState() {
    localServiceList = fullTimeServices;
    super.initState();
  }

  final _serviceController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    TextStyle responsiveTextStyle = kTextStyle.copyWith(
        fontWeight: FontWeight.normal, fontSize: width <= 400 ? width / 20 : 20);

    openAlertBox(int serviceIndex) {
      List boolList = [];
      for (int i = 0; i < employeesList.length; i++) {
        boolList.add(false);
      }
      bool isValid(String name) {
        for (EmployeeModel x in fullTimeServices[serviceIndex].employees) {
          if (x.name == name) {
            return true;
          }
        }
        return false;
      }

      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(builder: (BuildContext context, StateSetter setState1) {
              return AlertDialog(
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
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
                      SizedBox(height: 5.0),
                      Divider(color: Colors.grey, height: 4.0),
                      Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: Column(
                            children: [
                              for (EmployeeModel x in employeesList)
                                (isValid(x.name)
                                    ? SizedBox(width: 0, height: 0)
                                    : Row(
                                        children: [
                                          Text(x.name, style: kTextStyle),
                                          Checkbox(
                                              value: boolList[employeesList.indexOf(x)],
                                              onChanged: (value) {
                                                setState1(() {
                                                  boolList[employeesList.indexOf(x)] =
                                                      !boolList[employeesList.indexOf(x)];
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
                                          Provider.of<AppointmentData>(context, listen: false)
                                              .setEmployee(serviceIndex, index);
                                        }
                                        index++;
                                      }
                                      Navigator.of(context, rootNavigator: true).pop();
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12.0),
                                        )),
                                        backgroundColor: MaterialStateProperty.all(Colors.grey)),
                                    child: Text(
                                      "Onayla",
                                      style: kTextStyle.copyWith(color: Colors.white),
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
        for (ServiceModel serviceModel in localServiceList)
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Expandable(
              elevation: 3,
              padding: EdgeInsets.all(5.0),
              primaryWidget: Container(
                height: 60,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(serviceModel.name,
                        overflow: TextOverflow.ellipsis, style: responsiveTextStyle),
                    Spacer(),
                    Text(serviceModel.price.toString(), style: responsiveTextStyle),
                    Text(" ₺", style: TextStyle(fontSize: width <= 400 ? width / 20 : 20)),
                    SizedBox(width: 10),
                    IconButton(
                      splashRadius: 20,
                      icon: Icon(
                        Icons.remove_circle_rounded,
                        color: Colors.red.shade600,
                        size: width <= 400 ? width / 18.2 : 22,
                      ),
                      onPressed: () {
                        setState(() {
                          localServiceList.remove(serviceModel);
                        });
                      },
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              secondaryWidget: Stack(children: [
                Container(
                  height: 100,
                  width: width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Badge(
                        position: BadgePosition(top: 15, start: 80),
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
                            size: width <= 400 ? width / 8 : 50,
                            // size: 50,
                          ),
                          text: defaultEmployee.name,
                          width: width <= 400 ? width / 2.75 : 150,
                          textStyle: kTextStyle.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: width <= 400 ? width / 30 : 14),

                          /// TODO - Not working. We need better expandable.
                          onPressed: () => openAlertBox(0),
                        ),
                      ),
                      for (EmployeeModel employeeModel
                          in localServiceList[functions.findIndex(serviceModel, context)].employees)
                        GenericIconButton(
                          width: width <= 400 ? width / 2.75 : 150,
                          text: employeeModel.name,
                          iconContext: Badge(
                            position: BadgePosition(top: 0, start: 50),
                            badgeContent: GestureDetector(
                              child: Icon(
                                Icons.remove_rounded,
                                color: Colors.white,
                                size: 12,
                              ),
                              onTap: () {
                                /// TODO - does not work
                                setState(() {
                                  localServiceList[functions.findIndex(serviceModel, context)]
                                      .employees
                                      .remove(employeeModel);
                                });
                              },
                            ),
                            child: Image(
                              image: AssetImage(employeeModel.image),
                              fit: BoxFit.scaleDown,
                              height: width <= 400 ? width / 8 : 50,
                            ),
                          ),
                          textStyle: kTextStyle.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: width <= 400 ? width / 30 : 14),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 30,
                  child: Icon(Icons.keyboard_arrow_right),
                )
              ]),
            ),
          ),

        /// Add new service
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Container(
              width: width <= 650 ? width : 650,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Container(
                    width: 230,
                    padding: EdgeInsets.all(8.0),
                    child: AyarlaTextFormField(
                      hintText: 'Hizmet Adı Giriniz',
                      style: kTextStyle.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: width <= 400 ? width / 20 : 20,
                      ),
                      hintStyle: kTextStyle.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: width <= 400 ? width / 20 : 20,
                      ),
                      controller: _serviceController,
                      onChanged: (string) {
                        setState(() {
                          serviceName = string;
                        });
                      },
                    ),
                  ),
                  Container(
                    width: width <= 517 ? null : 227,
                    child: Row(
                      mainAxisAlignment:
                          width <= 517 ? MainAxisAlignment.end : MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          child: AyarlaTextFormField(
                            textAlign: TextAlign.end,
                            hintText: 'Fiyat Giriniz',
                            style: kTextStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: width <= 400 ? width / 20 : 20),
                            hintStyle: kTextStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: width <= 400 ? width / 20 : 20),
                            padding: EdgeInsets.only(top: 14, bottom: 14, right: 15),
                            onChanged: (value) {
                              setState(() {
                                price = int.parse(value);
                              });
                            },
                            controller: _priceController,
                            keyboardType: TextInputType.number,
                            inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                          ),
                        ),
                        Text(' ₺', style: TextStyle(fontSize: width <= 400 ? width / 20 : 20)),
                        SizedBox(width: 8),
                        IconButton(
                          splashRadius: 20,
                          icon: Icon(
                            Icons.add_circle_rounded,
                            color: Colors.green.shade700,
                            size: width <= 400 ? width / 18.2 : 22,
                          ),
                          onPressed: () {
                            setState(() {
                              localServiceList.add(ServiceModel(
                                name: serviceName,
                                price: price,
                                employees: [],
                              ));
                              _serviceController.clear();
                              _priceController.clear();
                            });
                          },
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
