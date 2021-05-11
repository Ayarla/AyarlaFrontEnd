import 'package:flutter/material.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';

class EditProfilePage extends StatefulWidget {
  static const id = 'EditProfilePage';
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfilePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Functions functions = Functions();
  String _typedMail;
  String _typedPassword;
  String _typedPasswordCheck;
  String _typedName;
  String _typedSurname;

  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(_typedMail);
  }

  //
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: DefaultAppBar(
        showIconButton: false,
        centerTitle: true,
        gradient: functions.decideColor(context),
        title: Text(
          "Profilimi Düzenle",
          style: kTitleStyle.copyWith(color: Colors.white),
        ),
      ).build(context),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            width: size.width > 700 ? size.width / 1.5 : size.width,
            child: ListView(
              children: [
                Form(
                  key: _formKey,
                  child: Container(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
                      child: Wrap(
                        runSpacing: 10.0,
                        children: [
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
                            obscureText: true,
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
                              // height: 45,
                              // width: 160,
                              width: size.width / 3,
                              height: 45,
                              margin: EdgeInsets.only(top: 30.0),
                              decoration: BoxDecoration(
                                  gradient: functions.decideColor(context),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    print("Validated");
                                  } else {
                                    print("Not Validated");
                                  }

                                  ///TODO save the changes
                                },
                                child: Text(
                                  'Kaydet',
                                  style: kTextStyle.copyWith(
                                      color: Colors.white,
                                      fontSize: size.width < 426 ? 18 : 25),
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
          ),
        ),
      ),
    );
  }
}
