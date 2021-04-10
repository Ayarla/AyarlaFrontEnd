import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/components/UI/linearGradientMask.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/circularParent.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/components/UI/logos&icons&texts.dart' as UI;

class EmployeeManagement extends StatefulWidget {
  static final String id = 'EmployeeManagement';

  @override
  _EmployeeManagementState createState() => _EmployeeManagementState();
}

class _EmployeeManagementState extends State<EmployeeManagement> {
  List employeeList = [];

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              SizedBox(height: 10),
              Center(child: Text('Çalışanlar', style: kTitleStyle)),
              Container(
                height: size.height / 1.3,
                child: OverScroll(
                  child: ListView(
                    padding: EdgeInsets.all(20),
                    children: [
                      for (int i = 0; i < 3; i++)
                        Row(
                          children: [
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: UI.femaleUserIcon,
                              ),
                              elevation: 5,
                              shape: CircleBorder(),
                            ),
                            SizedBox(width: 15),
                            // Icon(
                            //   // Icons.account_circle_rounded,
                            //
                            //   // size: 50,
                            // ),
                            Text(
                              'Çalışan İsmi',
                              style: kTextStyle,
                            ),
                            Spacer(),
                            IconButton(
                              icon: UI.settingsIcon,
                              padding: EdgeInsets.all(0),
                              onPressed: () {
                                detailSheet();
                              },
                            ),
                          ],
                        ),
                      for (Row x in employeeList) x,
                      Row(
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: UI.addUserIcon,
                            ),
                            elevation: 5,
                            shape: CircleBorder(),
                          ),
                          // Icon(
                          //   Icons.account_circle_rounded,
                          //   size: 50,
                          // ),
                          SizedBox(width: 15),
                          Text(
                            'Çalışan Ekle',
                            style: kTextStyle,
                          ),
                          Spacer(),
                          LinearGradientMask(
                            child: IconButton(
                              icon: Icon(
                                Icons.add_circle_sharp,
                                size: 35,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  employeeList.add(
                                    Row(
                                      children: [
                                        Card(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: UI.maleUserIcon,
                                          ),
                                          elevation: 5,
                                          shape: CircleBorder(),
                                        ),
                                        SizedBox(width: 15),
                                        Text(
                                          'Çalışan İsmi',
                                          style: kTextStyle,
                                        ),
                                        Spacer(),
                                        IconButton(
                                          icon: UI.settingsIcon,
                                          padding: EdgeInsets.all(0),
                                          onPressed: () {
                                            detailSheet();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                });
                              },
                            ),
                          ),
                        ],
                      ),
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
