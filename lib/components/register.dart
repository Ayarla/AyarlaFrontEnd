import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/models/userModel.dart';
import 'package:ayarla/webService/user_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Functions functions = Functions();

  HttpUserFunctions httpUserFunctions = HttpUserFunctions();

  String _typedMail;
  String _typedPassword;
  String _typedPasswordCheck;
  String _typedName;
  String _typedSurname;

  int index = 1;

  /// TODO add isValidEmail() to the functions-we are using multiple times.
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(_typedMail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(5, 50),
        child: DefaultAppBar(
          title: Text(
            'ayarla',
            style: kTitleStyle.copyWith(
                color: Colors.white, letterSpacing: 2, fontSize: 30),
          ),
          centerTitle: true,
          showIconButton: false,
          gradient: functions.decideColor(context),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "Lütfen hesap türünü seçiniz",
                style: kTitleStyle,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                        ),
                        child: TextButton(
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Icon(Icons.person, size: 100),
                                Text(
                                  "Müşteri",
                                  style: kTextStyle,
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              index = 1;
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  /// TODO - yeşil ikon yerine border yeşil olsun.
                  if (index == 1)
                    Positioned(
                      child: Icon(Icons.check_circle, color: Colors.green),
                      bottom: 0,
                      right: 0,
                    ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                        ),
                        child: TextButton(
                          child: Center(
                            child: Column(children: <Widget>[
                              Icon(Icons.work, size: 105),
                              Text(
                                "Yönetici",
                                style: kTextStyle,
                              ),
                            ]),
                          ),
                          onPressed: () {
                            setState(() {
                              index = 2;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  if (index == 2)
                    Positioned(
                      child: Icon(Icons.check_circle, color: Colors.green),
                      bottom: 0,
                      right: 0,
                    ),
                ],
              ),
            ],
          ),
          Form(
            key: _formKey,
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Wrap(
                  runSpacing: 10.0,
                  children: <Widget>[
                    TextFormField(
                      validator: (_typed) {
                        if (_typed.isEmpty) {
                          return 'Boş bırakılamaz.';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (typed) {
                        _typedName = typed;
                      },
                      autocorrect: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Icon(
                            Icons.person_outline,
                            size: 20.0,
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          maxHeight: 20.0,
                          maxWidth: 45.0,
                        ),
                        hintText: 'İsminizi Giriniz.',
                        hintStyle: kSmallTextStyle.copyWith(
                          color: Colors.grey.withOpacity(0.8),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (_typed) {
                        if (_typed.isEmpty) {
                          return 'Boş bırakılamaz.';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (typed) {
                        _typedSurname = typed;
                      },
                      autocorrect: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Icon(
                            Icons.person_outline,
                            size: 20.0,
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          maxHeight: 20.0,
                          maxWidth: 45.0,
                        ),
                        hintText: 'Soy isminizi Giriniz.',
                        hintStyle: kSmallTextStyle.copyWith(
                          color: Colors.grey.withOpacity(0.8),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (_typedValue) {
                        return (_typedValue.isEmpty)
                            ? 'Boş bırakılamaz.'
                            : isValidEmail()
                                ? null
                                : "Lütfen geçerli bir mail adresi giriniz";
                      },
                      onChanged: (typed) {
                        _typedMail = typed;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Icon(
                            Icons.mail_outline,
                            size: 20.0,
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          maxHeight: 20.0,
                          maxWidth: 45.0,
                        ),
                        hintText: 'E-posta adresinizi giriniz.',
                        hintStyle: kSmallTextStyle.copyWith(
                          color: Colors.grey.withOpacity(0.8),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (_typed) {
                        if (_typed.isEmpty) {
                          return 'Boş bırakılamaz.';
                        } else if (_typed.length < 6) {
                          return 'Şifre en az 6 karakter içermelidir.';
                        } else if (_typedPasswordCheck != _typed &&
                            _typedPasswordCheck != '') {
                          return 'Şifreler birbiri ile uyuşmuyor.';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (typed) {
                        _typedPassword = typed;
                      },
                      autocorrect: false,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Icon(
                            Icons.vpn_key_outlined,
                            size: 20.0,
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          maxHeight: 20.0,
                          maxWidth: 45.0,
                        ),
                        hintText: 'Şifrenizi Giriniz.',
                        hintStyle: kSmallTextStyle.copyWith(
                          color: Colors.grey.withOpacity(0.8),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (_typed) {
                        if (_typed.isEmpty) {
                          return 'Boş bırakılamaz.';
                        } else if (_typed.length < 6) {
                          return 'Şifre en az 6 karakter içermelidir.';
                        } else if (_typedPassword != _typed &&
                            _typedPassword != '') {
                          return 'Şifreler birbiri ile uyuşmuyor.';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (typed) {
                        _typedPasswordCheck = typed;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Icon(
                            Icons.vpn_key_outlined,
                            size: 20.0,
                          ),
                        ),
                        prefixIconConstraints: BoxConstraints(
                          maxHeight: 20.0,
                          maxWidth: 45.0,
                        ),
                        hintText: 'Şifrenizi Tekrar Giriniz.',
                        hintStyle: kSmallTextStyle.copyWith(
                          color: Colors.grey.withOpacity(0.8),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 45,
                        width: 160,
                        margin: EdgeInsets.only(top: 10.0),
                        decoration: BoxDecoration(
                            gradient: functions.decideColor(context),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              /// 1 = customer , 2 = business owner (index)
                              if (index == 1) {
                                /// creates customer account
                                await httpUserFunctions.createUser(
                                  name: _typedName,
                                  surname: _typedSurname,
                                  email: _typedMail,
                                  password: _typedPassword,
                                  roleNames: "User",

                                  /// TODO userName daha sonra kalkacak
                                  userName: 'bahadir4444',
                                );
                                // await httpUserFunctions.createUser(
                                //     userModel: UserModel(name: _typedName));
                              } else if (index == 2) {
                                /// creates business owner account
                                await httpUserFunctions.createUser(
                                  name: _typedName,
                                  surname: _typedSurname,
                                  email: _typedMail,
                                  password: _typedPassword,
                                  roleNames: "Accounts",

                                  /// TODO userName daha sonra kalkacak
                                  userName: 'Bahadir4444',
                                );
                              }
                            } else {
                              print("Not Validated");
                            }
                          },
                          child: Text(
                            'Kayıt',
                            style: kTextStyle.copyWith(
                                color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
