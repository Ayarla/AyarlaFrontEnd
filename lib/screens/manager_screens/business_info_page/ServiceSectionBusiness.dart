import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/employeeAndService.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/screens/manager_screens/business_info_page/EmployeeSectionBusiness.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
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
    final Size size = MediaQuery.of(context).size;
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
        Row(children: [
          Text('Hizmetler', style: kTitleStyle),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: GestureDetector(
                  child: Icon(Icons.add_circle,
                      color: Colors.green)),
            ),
            onTap: () {
              // Provider.of<AppointmentData>(context, listen: false).addService();
              setState(() {
                editService = !editService;
                //isChanged = true;
              });
            },
          ),
        ]),
        if (editService)
          Row(
            children: [
              Container(
                width: size.width * 4 / 5,
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                width: size.width / 3,
                                child: TextField(
                                  onChanged: (text) {
                                    serviceName = text;
                                  },
                                  style: kTextStyle
                                      .copyWith(
                                      fontWeight:
                                      FontWeight
                                          .normal),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Hizmet Adı',
                                    hintStyle: kTextStyle
                                        .copyWith(
                                        fontWeight:
                                        FontWeight
                                            .normal)
                                  ),
                                )
                            ),
                            Spacer(),
                            Container(
                                width: size.width / 6,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  onChanged: (text) {
                                    price = int.parse(text);
                                  },
                                  style: kTextStyle
                                      .copyWith(
                                      fontWeight:
                                      FontWeight
                                          .normal),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '10 TL',
                                      hintStyle: kTextStyle
                                          .copyWith(
                                          fontWeight:
                                          FontWeight
                                              .normal)
                                  ),
                                  textAlign: TextAlign.end,
                                )),
                            SizedBox(
                              width: size.width / 7,
                              height: size.width / 7,
                              child: FlatButton(
                                padding: EdgeInsets.all(0),
                                color: Colors.white,
                                shape: CircleBorder(),
                                onPressed: () {
                                  /// Add or subtract Service and calculate
                                  /// price
                                  //Provider.of<AppointmentData>(context, listen: false).changeSelectedService(findIndex(x));
                                },
                                child: Icon(
                                  Icons.remove,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                        ),

                        
                        Stack(children: [
                            Container(
                              height: size.width / 5.3,
                              child: ListView(
                                scrollDirection:
                                Axis.horizontal,
                                children: [
                                  Stack(
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets
                                            .symmetric(
                                            horizontal:
                                            8.0,
                                            vertical:
                                            4.0),
                                        child: Container(
                                          width: 90,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    10),
                                                child: Icon(
                                                    Icons
                                                        .person,
                                                    size: size
                                                        .height /
                                                        15,
                                                    color: Colors
                                                        .grey),
                                              ),
                                              FittedBox(
                                                  child: Text(
                                                    Provider.of<AppointmentData>(
                                                        context,
                                                        listen: true)
                                                        .defaultEmployee
                                                        .name,
                                                    style: kSmallTextStyle
                                                        .copyWith(
                                                      color: Colors
                                                          .black,
                                                    ),
                                                  ),
                                                  fit: BoxFit
                                                      .cover)
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          top: -12,
                                          right: 5,
                                          child: IconButton(
                                            icon: Icon(
                                                Icons
                                                    .add_circle,
                                                color: Colors
                                                    .green),
                                            onPressed: () {
                                              ///opens the popup to add employee
                                              if(serviceName!=null && price !=null){
                                                Provider.of<AppointmentData>(
                                                    context,
                                                    listen: true).addService(serviceName, price);
                                              }
                                            },
                                          ))
                                    ],
                                  ),
                                  for (EmployeeModel y in Provider
                                      .of<AppointmentData>(
                                      context,
                                      listen: true)
                                      .defaultService.employees)
                                    Stack(
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets
                                                .symmetric(
                                                horizontal:
                                                12.0,
                                                vertical:
                                                4.0),
                                            child: Container(
                                              width: 90,
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .only(
                                                        bottom:
                                                        8.0),
                                                    child:
                                                    ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(10),
                                                      child:
                                                      Image(
                                                        height:
                                                        size.height / 20,
                                                        image:
                                                        AssetImage(
                                                          y.image,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  FittedBox(
                                                      child:
                                                      Text(
                                                        y.name,
                                                        style:
                                                        kSmallTextStyle.copyWith(
                                                          color:
                                                          Colors.black,
                                                        ),
                                                      ),
                                                      fit: BoxFit
                                                          .cover)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top: -12,
                                            right: 5,
                                            child: IconButton(
                                              icon: Icon(
                                                  Icons
                                                      .remove_circle,
                                                  color: Colors
                                                      .red),
                                              onPressed: () {
                                                Provider.of<AppointmentData>(
                                                    context,
                                                    listen:
                                                    false)
                                                    .deleteEmployeeDefault(Provider.of<AppointmentData>(
    context,
    listen:
    false)
        .defaultService.employees.indexOf(y));
                                              },
                                            ))
                                      ],
                                    )
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 10,
                              child: Icon(Icons.keyboard_arrow_right),
                            )
                          ]),
                      ],
                    ),
                  ),
                ),
              ),
              if (editService)
                IconButton(
                  icon: Icon(Icons.add_circle,
                      color: Colors.green),
                  onPressed: () {
                    // Provider.of<AppointmentData>(context, listen: false).deleteService(findIndex(x));
                  },
                )
            ],
          ),
        for (ServiceModel x in Provider.of<AppointmentData>(
            context,
            listen: true)
            .fullTimeServices)
          Row(
            children: [
              Container(
                width: !editService
                    ? size.width * .9
                    : size.width * 4 / 5,
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: size.width / 3,
                              child: x.name.length >= 17
                                  ? FittedBox(
                                fit: BoxFit.cover,
                                child: Text(x.name,
                                    style: kTextStyle
                                        .copyWith(
                                        fontWeight:
                                        FontWeight
                                            .normal)),
                              )
                                  : Text(x.name,
                                  style:
                                  kTextStyle.copyWith(
                                      fontWeight:
                                      FontWeight
                                          .normal)),
                            ),
                            Spacer(),
                            Container(
                              width: size.width / 6,
                              child:
                              "${x.price} TL".length >= 9
                                  ? FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  "${x.price} TL",
                                  style: kTextStyle.copyWith(
                                      fontWeight:
                                      FontWeight
                                          .normal),
                                  textAlign:
                                  TextAlign.end,
                                ),
                              )
                                  : Text(
                                "${x.price} TL",
                                style: kTextStyle
                                    .copyWith(
                                    fontWeight:
                                    FontWeight
                                        .normal),
                                textAlign:
                                TextAlign.end,
                              ),
                            ),
                            SizedBox(
                              width: size.width / 7,
                              height: size.width / 7,
                              child: FlatButton(
                                padding: EdgeInsets.all(0),
                                color: Colors.white,
                                shape: CircleBorder(),
                                onPressed: () {
                                  /// Add or subtract Service and calculate
                                  /// price
                                  Provider.of<AppointmentData>(
                                      context,
                                      listen: false)
                                      .changeSelectedService(
                                      functions.findIndex(x,context));
                                },
                                child: Icon(
                                  Provider.of<AppointmentData>(
                                      context,
                                      listen: true)
                                      .fullTimeServices[
                                  functions.findIndex(x,context)]
                                      .selected
                                      ? Icons.remove
                                      : Icons.add,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                        ),

                        /// opens the employee row if service selected
                        if (x.selected)
                          Stack(children: [
                            Container(
                              height: size.width / 5.3,
                              child: ListView(
                                scrollDirection:
                                Axis.horizontal,
                                children: [
                                  Stack(
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets
                                            .symmetric(
                                            horizontal:
                                            8.0,
                                            vertical:
                                            4.0),
                                        child: Container(
                                          width: 90,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    10),
                                                child: Icon(
                                                    Icons
                                                        .person,
                                                    size: size
                                                        .height /
                                                        15,
                                                    color: Colors
                                                        .grey),
                                              ),
                                              FittedBox(
                                                  child: Text(
                                                    Provider.of<AppointmentData>(
                                                        context,
                                                        listen: true)
                                                        .defaultEmployee
                                                        .name,
                                                    style: kSmallTextStyle
                                                        .copyWith(
                                                      color: Colors
                                                          .black,
                                                    ),
                                                  ),
                                                  fit: BoxFit
                                                      .cover)
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          top: -12,
                                          right: 5,
                                          child: IconButton(
                                            icon: Icon(
                                                Icons
                                                    .add_circle,
                                                color: Colors
                                                    .green),
                                            onPressed: () {
                                              ///opens the popup to add employee
                                              openAlertBox(
                                                  functions.findIndex(
                                                      x,context));
                                            },
                                          ))
                                    ],
                                  ),
                                  for (EmployeeModel y in Provider
                                      .of<AppointmentData>(
                                      context,
                                      listen: true)
                                      .fullTimeServices[
                                  functions.findIndex(x,context)]
                                      .employees)
                                    Stack(
                                      children: [
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets
                                                .symmetric(
                                                horizontal:
                                                12.0,
                                                vertical:
                                                4.0),
                                            child: Container(
                                              width: 90,
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .only(
                                                        bottom:
                                                        8.0),
                                                    child:
                                                    ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(10),
                                                      child:
                                                      Image(
                                                        height:
                                                        size.height / 20,
                                                        image:
                                                        AssetImage(
                                                          y.image,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  FittedBox(
                                                      child:
                                                      Text(
                                                        y.name,
                                                        style:
                                                        kSmallTextStyle.copyWith(
                                                          color:
                                                          Colors.black,
                                                        ),
                                                      ),
                                                      fit: BoxFit
                                                          .cover)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            top: -12,
                                            right: 5,
                                            child: IconButton(
                                              icon: Icon(
                                                  Icons
                                                      .remove_circle,
                                                  color: Colors
                                                      .red),
                                              onPressed: () {
                                                Provider.of<AppointmentData>(
                                                    context,
                                                    listen:
                                                    false)
                                                    .removeEmployeeFromService(
                                                    functions.findIndex(
                                                        x,context),
                                                    functions.findIndexOfEmployee(
                                                        functions.findIndex(x,context),
                                                        y,context));
                                              },
                                            ))
                                      ],
                                    )
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 10,
                              child: Icon(Icons.keyboard_arrow_right),
                            )
                          ]),
                      ],
                    ),
                  ),
                ),
              ),
              if (editService)
                IconButton(
                  icon: Icon(Icons.remove_circle,
                      color: Colors.red),
                  onPressed: () {
                    Provider.of<AppointmentData>(context,
                        listen: false)
                        .deleteService(functions.findIndex(x,context));
                  },
                )
            ],
          ),

      ],
    );
  }
}
