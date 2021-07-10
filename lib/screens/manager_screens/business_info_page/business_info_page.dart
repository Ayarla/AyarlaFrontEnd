import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/components/ayarla_textfield.dart';
import 'package:ayarla/components/floatingTextButton.dart';
import 'package:ayarla/constants/router.dart';
import 'package:ayarla/models/model_employee.dart';
import 'package:ayarla/screens/manager_screens/business_info_page/AboutSectionBusiness.dart';
import 'package:ayarla/screens/manager_screens/business_info_page/ImageSectionBusiness.dart';
import 'package:ayarla/screens/manager_screens/business_info_page/ServiceSectionBusiness.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:ayarla/virtual_data_base/businessOrUser_data.dart';
import 'dart:math' as math;

class BusinessInfoPage extends StatefulWidget {
  static const id = 'BusinessInfoScreen';
  @override
  _BusinessInfoPageState createState() => _BusinessInfoPageState();
}

class _BusinessInfoPageState extends State<BusinessInfoPage> {
  final ScrollController _photoController = ScrollController();

  Functions functions = Functions();
  String selectedStart = '00:00';
  String selectedEnd = '00:00';
  bool editService = false;
  bool editEmployee = false;
  bool isChanged = false;

  ///popup to add employee
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
                    SizedBox(height: 5.0),
                    Divider(color: Colors.grey, height: 4.0),
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: DefaultAppBar(
                title: Center(
                  child: TextField(
                    focusNode: FocusNode(),
                    onEditingComplete: () {},
                    style: kTitleStyle.copyWith(color: Colors.white),
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Kuaför Adı",
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Icon(Icons.edit, color: Colors.white),
                      ),
                      hintStyle: kTitleStyle.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                gradient: functions.decideColor(context),
                backButtonFunction: !isChanged
                    ? null
                    : () {
                        return showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Color(0xFFE5EBEE),
                                title: Center(
                                  child: Text(
                                    "Değişiklikleri kaydetmek istiyor musunuz?",
                                    style: kSmallTitleStyle,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25.0),
                                  ),
                                ),
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        child: Text(
                                          'Hayır',
                                          style: kSmallTextStyle.copyWith(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }),
                                    SizedBox(width: 30),
                                    TextButton(
                                        child: Text(
                                          'Evet',
                                          style: kSmallTextStyle.copyWith(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }),
                                  ],
                                ),
                              );
                            });
                      })
            .build(context),
        body: AyarlaPage(
          child: OverScroll(
            child: ListView(
              controller: _photoController,
              children: <Widget>[
                /// Fotoğraf Ekleme/Çıkartma
                /// TODO - File drag area for web.
                SizedBox(height: 10),
                ImageSectionBusiness(),
                SizedBox(height: 10),

                ///Hakkında
                AboutSectionBusiness(),
                SizedBox(height: 10),

                ///Hizmetler
                ServiceSectionBusiness(),

                ///İletişim
                Text('Adres', style: kTextStyle),

                ///MAP
                GenericIconButton(
                  iconContext: Icon(Icons.map_rounded),
                  textStyle: kTextStyle,
                  text: "Haritadan Bulunuz",
                  height: 30,
                  width: 100,
                  axis: Axis.horizontal,
                  onPressed: () =>
                      Routers.router.navigateTo(context, "/Harita"),
                ),
                Center(child: Text('veya', style: kSmallTextStyle)),
                SizedBox(height: 10),

                /// TODO
                AyarlaTextField(
                  hintText: Text('Adres giriniz', maxLines: null),
                ),
                SizedBox(height: 10),
                // Container(
                //   width: size.width * 0.83,
                //   child: TextFormField(
                //       controller: TextEditingController(
                //           text: Provider.of<BusinessAndUserData>(context,
                //                   listen: true)
                //               .pickedResult
                //               .formattedAddress),
                //       keyboardType: TextInputType.multiline,
                //       autofocus: false,
                //       decoration: InputDecoration(
                //         hintText: 'Adres giriniz',
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(20.0),
                //         ),
                //       )),
                // ),
                SizedBox(height: 20),

                /// Telephone
                Text('Telefon', style: kTextStyle),
                SizedBox(height: 10),

                /// TODO
                AyarlaTextField(
                  hintText: Text('Telefon Giriniz - 555-555 555 55 55'),
                ),
                SizedBox(height: 10),
                // Container(
                //   width: size.width * 0.35,
                //   child: TextFormField(
                //       controller: TextEditingController(
                //           text: Provider.of<BusinessAndUserData>(context,
                //                   listen: true)
                //               .pickedResult
                //               .formattedPhoneNumber),
                //       maxLength: 13,
                //       textAlign: TextAlign.center,
                //       keyboardType: TextInputType.number,
                //       inputFormatters: <TextInputFormatter>[
                //         FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                //       ],
                //       autofocus: false,
                //       maxLines: null,
                //       decoration: InputDecoration(
                //         contentPadding: EdgeInsets.all(0),
                //         counter: Offstage(),
                //         hintText: '555-5555555',
                //         hintStyle: kSmallTextStyle,
                //         border: OutlineInputBorder(
                //           borderRadius: new BorderRadius.circular(20.0),
                //           borderSide: new BorderSide(),
                //         ),
                //       )),
                // ),
              ],
            ),
          ),
        ),
        floatingActionButton: isChanged
            ? FloatingTextButton(
                text: 'Kaydet',
                onPressed: () {
                  setState(() {
                    // isSaved = true;
                    isChanged = false;

                  });
                },
                // isGradient: true,
              )
            : null,
      ),
    );
  }
}
