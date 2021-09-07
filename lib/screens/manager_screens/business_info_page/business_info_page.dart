import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/components/ayarla_textfield.dart';
import 'package:ayarla/components/floatingTextButton.dart';
import 'package:ayarla/components/unFocuser.dart';
import 'package:ayarla/models/model_employee.dart';
import 'package:ayarla/screens/manager_screens/business_info_page/AboutSectionBusiness.dart';
import 'package:ayarla/screens/manager_screens/business_info_page/ImageSectionBusiness.dart';
import 'package:ayarla/screens/manager_screens/business_info_page/ServiceSectionBusiness.dart';
import 'package:ayarla/screens/manager_screens/business_info_page/section_contact.dart';
import 'package:ayarla/services/service_management.dart';
import 'package:ayarla/virtual_data_base/temporaryLists.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:flutter/widgets.dart';

class BusinessInfoPage extends StatefulWidget {
  @override
  _BusinessInfoPageState createState() => _BusinessInfoPageState();
}

class _BusinessInfoPageState extends State<BusinessInfoPage> {
  ScrollController _photoController = ScrollController();
  Functions functions = Functions();
  bool isChanged = false;

  ///popup to add employee
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
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
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
                                        Provider.of<ManagementService>(context, listen: false)
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

  @override
  void didUpdateWidget(covariant BusinessInfoPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    isChanged = true;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DefaultAppBar(
        title: Center(
          child: AyarlaTextFormField(
            initialValue:
                Provider.of<ManagementService>(context, listen: false).currentCoiffure.name,
            onChanged: (value) {
              setState(() {
                Provider.of<ManagementService>(context, listen: false).currentCoiffure.name = value;
              });
            },
            style: kTitleStyle.copyWith(color: Colors.black, fontSize: 18),
            textAlign: TextAlign.justify,
            hintText: 'İşletmenizin İsmini Giriniz',
          ),
        ),
        gradient: functions.decideColor(context),
      ).build(context),
      body: UnFocuser(
        child: WillPopScope(
          onWillPop: () {
            return Future.value(true);
          },
          child: ListView(
            children: [
              AyarlaPage(
                child: ListView(
                  shrinkWrap: true,
                  controller: _photoController,
                  children: <Widget>[
                    SizedBox(height: 10),
                    ImageSectionBusiness(),
                    SizedBox(height: 10),

                    ///Hakkında
                    AboutSectionBusiness(),
                    SizedBox(height: 10),

                    ///Hizmetler
                    ServiceSectionBusiness(),

                    ///İletişim
                    ContactSection(),
                    SizedBox(height: 60),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: isChanged
          ? FloatingTextButton(
              text: 'Kaydet',
              onPressed: () {
                setState(() {
                  isChanged = false;
                });
              },
            )
          : null,
    );
  }
}
