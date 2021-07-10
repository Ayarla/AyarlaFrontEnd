import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/components/new_icon.dart';
import 'package:ayarla/constants/iconNames.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/circularParent.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/constants/constants.dart';

class EmployeeManagement extends StatefulWidget {
  @override
  _EmployeeManagementState createState() => _EmployeeManagementState();
}

class _EmployeeManagementState extends State<EmployeeManagement> {
  List<Padding> employeeList = [];

  detailSheet() {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          final size = MediaQuery.of(context).size;
          return CircularParent(
            radius: 20,
            direction: Directions.top,
            color: Colors.white,
            child: Center(
              child: OverScroll(
                child: Container(
                  width: size.width,
                  child: ListView(
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                    children: [
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width / 1.5,
                            height: size.height / 15,
                            child: TextFormField(
                              validator: (_typedValue) {
                                return (_typedValue.isEmpty)
                                    ? 'Boş bırakılamaz.'
                                    : null
                                        ? null
                                        : "Lütfen geçerli bir isim giriniz";
                              },
                              onChanged: (typed) {
                                // _typedMail = typed;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                prefixIconConstraints: BoxConstraints(
                                  maxHeight: 20.0,
                                  maxWidth: 45.0,
                                ),
                                labelText: 'Çalışan ismi giriniz',
                                hintText: 'Çalışan ismi giriniz.',
                                hintStyle: kSmallTextStyle.copyWith(
                                  color: Colors.grey.withOpacity(0.8),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width / 1.5,
                            height: size.height / 15,
                            child: TextFormField(
                              validator: (_typedValue) {
                                return (_typedValue.isEmpty)
                                    ? 'Boş bırakılamaz.'
                                    : null
                                        ? null
                                        : "Lütfen geçerli bir mail adresi giriniz";
                              },
                              onChanged: (typed) {
                                // _typedMail = typed;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                prefixIconConstraints: BoxConstraints(
                                  maxHeight: 20.0,
                                  maxWidth: 45.0,
                                ),
                                labelText: 'Çalışan şifresi giriniz',
                                hintText: 'Çalışan şifresi giriniz.',
                                hintStyle: kSmallTextStyle.copyWith(
                                  color: Colors.grey.withOpacity(0.8),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width / 1.5,
                            height: size.height / 15,
                            child: TextFormField(
                              validator: (_typedValue) {
                                return (_typedValue.isEmpty)
                                    ? 'Boş bırakılamaz.'
                                    : null
                                        ? null
                                        : "Lütfen geçerli bir mail adresi giriniz";
                              },
                              onChanged: (typed) {
                                // _typedMail = typed;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                prefixIconConstraints: BoxConstraints(
                                  maxHeight: 20.0,
                                  maxWidth: 45.0,
                                ),
                                labelText: 'Çalışan maili giriniz',
                                hintText: 'Çalışan maili giriniz.',
                                hintStyle: kSmallTextStyle.copyWith(
                                  color: Colors.grey.withOpacity(0.8),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        child: Text('Kaydet', style: kTextStyle),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: DefaultAppBar(
        color: Colors.grey,
        title: Center(
          child: Text(
            'Çalışan Yönetim Sayfası',
            style: kSmallTitleStyle.copyWith(color: Colors.white),
          ),
        ),
      ).build(context),
      body: AyarlaPage(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Center(child: Text('Çalışanlarım', style: kTitleStyle)),
              Container(
                height: size.height / 1.3,
                child: OverScroll(
                  child: ListView(
                    padding: EdgeInsets.all(20),
                    children: [
                      // badgeColor: Colors.white,
                      // badgeContent: Icon(
                      //   Icons.add_circle_sharp,
                      //   color: Colors.green.shade800,
                      //   size: 25,
                      // ),
                      // position:
                      // BadgePosition.topEnd(top: -10, end: -20),
                      Row(
                        children: [
                          //             onTap: () => detailSheet(),
                          GenericIconButton(
                            height: 100,
                            width: 100,
                            iconContext: NewIcon(iconName: addUserIconName, size: 60),
                            text: 'Çalışan Ekle',
                          ),
                          GenericIconButton(
                            height: 100,
                            width: 100,
                            iconContext: Badge(
                              badgeColor: Colors.white,
                              badgeContent:
                                  NewIcon(iconName: settingsIconName, size: 25),
                              position:
                                  BadgePosition.topEnd(top: -10, end: -20),
                              child:
                                  NewIcon(iconName: femaleIconName, size: 60),
                            ),
                            text: 'Nilsu',
                          ),
                          GenericIconButton(
                            height: 100,
                            width: 100,
                            iconContext: Badge(
                              badgeColor: Colors.white,
                              badgeContent:
                                  NewIcon(iconName: settingsIconName, size: 25),
                              position:
                                  BadgePosition.topEnd(top: -10, end: -20),
                              child: NewIcon(iconName: maleIconName, size: 60),
                            ),
                            text: 'Fatih',
                          ),
                          GenericIconButton(
                            height: 100,
                            width: 100,
                            iconContext: Badge(
                              badgeColor: Colors.white,
                              badgeContent:
                                  NewIcon(iconName: settingsIconName, size: 25),
                              position:
                                  BadgePosition.topEnd(top: -10, end: -20),
                              child: NewIcon(iconName: maleIconName, size: 60),
                            ),
                            text: 'Bahadır',
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// employeeList.add(
// Padding(
// padding: EdgeInsets.all(4),
// child: Row(children: [
// NewIcon(
// iconName: maleIconName, size: 30),
// SizedBox(width: 15),
// Text('Çalışan İsmi',
// style: kTextStyle),
// Spacer(),
// GestureDetector(
// onTap: () => detailSheet(),
// child: NewIcon(
// iconName: settingsIconName,
// size: 30,
// ))
// ])),
// );
//