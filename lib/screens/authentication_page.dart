import 'package:ayarla/components/ayarla_textfield.dart';
import 'package:ayarla/constants/router.dart';
import 'package:ayarla/screens/privacy_policy_page.dart';
import 'package:ayarla/virtual_data_base/businessOrUser_data.dart';
import 'package:ayarla/virtual_data_base/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:provider/provider.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage>
    with TickerProviderStateMixin {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Functions functions = Functions();
  String _typedMail;
  String _typedPassword;
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(_typedMail);
  }

  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    bool isSmallScreen = size.width < 362;
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Form(
        key: _formkey,
        child: DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                labelStyle: kTitleStyle,
                unselectedLabelStyle: kTitleStyle,
                indicatorColor: Colors.orange[500],
                indicator: UnderlineTabIndicator(
                    borderSide:
                        BorderSide(width: 3.0, color: Colors.orange[500]),
                    insets: isSmallScreen
                        ? EdgeInsets.zero
                        : EdgeInsets.symmetric(horizontal: -30.0)),
                tabs: [
                  Tab(
                    child: Text(
                      "Giriş Yapın",
                      style: kTextStyle.copyWith(
                          fontSize: isSmallScreen ? 14 : 20),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Kayıt Olun",
                      style: kTextStyle.copyWith(
                          fontSize: isSmallScreen ? 14 : 20),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height - 300,
                  child: TabBarView(
                    children: [
                      ListView(
                        shrinkWrap: true,
                        children: [
                          SizedBox(height: 20),
                          Container(
                            width: 500,
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: AyarlaTextField(
                              hintText: Text(
                                'Mail adresinizi giriniz.',
                                style: kSmallTextStyle.copyWith(
                                    fontSize: isSmallScreen ? 10 : 14),
                              ),
                              padding: EdgeInsets.all(20.0),
                              color: Colors.orange[500],
                            ),
                          ),
                          Container(
                            width: 500,
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: AyarlaTextField(
                              hintText: Text(
                                'Şifrenizi giriniz.',
                                style: kSmallTextStyle.copyWith(
                                    fontSize: isSmallScreen ? 10 : 14),
                              ),
                              padding: EdgeInsets.all(20.0),
                              color: Colors.orange[500],
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: () {
                                  //TODO Forget password page
                                },
                                child: Text('  Şifremi unuttum!',
                                    style: kSmallTextStyle.copyWith(
                                        color: Colors.orange[300],
                                        fontSize: isSmallScreen ? 10 : 15)),
                              ),
                              Spacer(),
                              TextButton(
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 40)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.orange[500]),
                                  shape:
                                      MaterialStateProperty.all<OutlinedBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                ),
                                onPressed: () {
                                  if (_formkey.currentState.validate()) {
                                    print("Validated");
                                  } else {
                                    print("Not Validated");
                                  }
                                  Provider.of<Login>(context, listen: false)
                                      .loggedInUser();

                                  ///TODO check and push somewhere
                                },
                                child: Text(
                                  'Giriş',
                                  style: kTextStyle.copyWith(
                                      color: Colors.white,
                                      fontSize: isSmallScreen ? 15 : 25),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ListView(
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                "Lütfen hesap türünü seçiniz",
                                style: kTextStyle.copyWith(
                                    fontSize: isSmallScreen ? 14 : 20),
                              ),
                            ),
                          ),

                          Center(
                            child: FlutterToggleTab(
                              width: MediaQuery.of(context).size.width > 1200
                                  ? 20
                                  : 50,
                              borderRadius: 15,
                              initialIndex: 0,
                              selectedBackgroundColors: [Colors.orange[500]],
                              selectedTextStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: isSmallScreen ? 10 : 18,
                                  fontWeight: FontWeight.w600),
                              unSelectedTextStyle: TextStyle(
                                  color: Colors.orange[500],
                                  fontSize: isSmallScreen ? 8 : 14,
                                  fontWeight: FontWeight.w400),
                              labels: ["Müşteri", "İşyeri"],
                              icons: [Icons.person, Icons.work],
                              selectedLabelIndex: (index) {
                                print("Selected Index $index");
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 500,
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: AyarlaTextField(
                              hintText: Text(
                                'İsminizi Giriniz.',
                                style: kSmallTextStyle.copyWith(
                                    fontSize: isSmallScreen ? 10 : 14),
                              ),
                              padding: EdgeInsets.all(20.0),
                              color: Colors.orange[500],
                            ),
                          ),
                          Container(
                            width: 500,
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: AyarlaTextField(
                              hintText: Text(
                                'Soy İsminizi Giriniz.',
                                style: kSmallTextStyle.copyWith(
                                    fontSize: isSmallScreen ? 10 : 14),
                              ),
                              padding: EdgeInsets.all(20.0),
                              color: Colors.orange[500],
                            ),
                          ),
                          Container(
                            width: 500,
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: AyarlaTextField(
                              hintText: Text(
                                'Mail Adresinizi Giriniz.',
                                style: kSmallTextStyle.copyWith(
                                    fontSize: isSmallScreen ? 10 : 14),
                              ),
                              padding: EdgeInsets.all(20.0),
                              color: Colors.orange[500],
                            ),
                          ),
                          Container(
                            width: 500,
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: AyarlaTextField(
                              hintText: Text(
                                'Şifrenizi Giriniz.',
                                style: kSmallTextStyle.copyWith(
                                    fontSize: isSmallScreen ? 10 : 14),
                              ),
                              padding: EdgeInsets.all(20.0),
                              color: Colors.orange[500],
                            ),
                          ),
                          Container(
                            width: 500,
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: AyarlaTextField(
                              hintText: Text(
                                'Şifrenizi Tekrar Giriniz.',
                                style: kSmallTextStyle.copyWith(
                                    fontSize: isSmallScreen ? 10 : 14),
                              ),
                              padding: EdgeInsets.all(20.0),
                              color: Colors.orange[500],
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Checkbox(
                                  value: Provider.of<BusinessAndUserData>(
                                          context,
                                          listen: false)
                                      .checkBox,
                                  onChanged: (value) {
                                    setState(() {
                                      Provider.of<BusinessAndUserData>(context,
                                                  listen: false)
                                              .checkBox =
                                          !Provider.of<BusinessAndUserData>(
                                                  context,
                                                  listen: false)
                                              .checkBox;
                                    });
                                  }),
                              SizedBox(width: 10),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Container(
                                  width:
                                      size.width < 700 ? size.width / 1.7 : 500,
                                  child: RichText(
                                    text: TextSpan(
                                      style: kSmallTextStyle.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              'Ayarla Gizlilik ve Kullanıcı Sözleşmesi`ni',
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              /// Privacy Policy ModalBottomSheet
                                              showModalBottomSheet(
                                                  enableDrag: false,
                                                  isScrollControlled: true,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                      top:
                                                          Radius.circular(20.0),
                                                    ),
                                                  ),
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    // return null;
                                                    // privacyPolicyModalBottomSheet(
                                                    //   context: context, setState: setState);
                                                    return privacyPolicyModalBottomSheet(
                                                        context: context,
                                                        setState: setState);
                                                  });
                                            },
                                          style: kSmallTextStyle.copyWith(
                                            fontSize: isSmallScreen ? 10 : 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blue,
                                            fontStyle: FontStyle.italic,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' okudum, onaylıyorum.',
                                          style: kSmallTextStyle.copyWith(
                                            fontSize: isSmallScreen ? 10 : 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 40)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.orange[500]),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                              ),
                              onPressed: () {
                                if (_formkey.currentState.validate()) {
                                  print("Validated");
                                } else {
                                  print("Not Validated");
                                }
                                Provider.of<Login>(context, listen: false)
                                    .loggedInUser();

                                ///TODO check and push somewhere
                              },
                              child: Text(
                                'Kayıt Ol',
                                style: kTextStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: isSmallScreen ? 15 : 25),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),

                          // Form(
                          //   // key: _formKey,
                          //   child: Container(
                          //     child: Padding(
                          //       padding: EdgeInsets.symmetric(
                          //           horizontal: 20.0, vertical: 10.0),
                          //       child: Wrap(
                          //         runSpacing: 10.0,
                          //         children: <Widget>[
                          //           TextFormField(
                          //             validator: (_typed) {
                          //               if (_typed.isEmpty) {
                          //                 return 'Boş bırakılamaz.';
                          //               } else {
                          //                 return null;
                          //               }
                          //             },
                          //             onChanged: (typed) {
                          //               // _typedName = typed;
                          //             },
                          //             autocorrect: false,
                          //             obscureText: false,
                          //             decoration: InputDecoration(
                          //               border: OutlineInputBorder(
                          //                   borderRadius: BorderRadius.all(
                          //                       Radius.circular(40))),
                          //               prefixIcon: Padding(
                          //                 padding: EdgeInsets.symmetric(
                          //                     horizontal: 15.0),
                          //                 child: Icon(
                          //                   Icons.person_outline,
                          //                   size: 20.0,
                          //                 ),
                          //               ),
                          //               prefixIconConstraints: BoxConstraints(
                          //                 maxHeight: 20.0,
                          //                 maxWidth: 45.0,
                          //               ),
                          //               hintText: 'İsminizi Giriniz.',
                          //               hintStyle: kSmallTextStyle.copyWith(
                          //                 color: Colors.grey.withOpacity(0.8),
                          //                 fontWeight: FontWeight.w400,
                          //               ),
                          //             ),
                          //           ),
                          //           TextFormField(
                          //             validator: (_typed) {
                          //               if (_typed.isEmpty) {
                          //                 return 'Boş bırakılamaz.';
                          //               } else {
                          //                 return null;
                          //               }
                          //             },
                          //             onChanged: (typed) {
                          //               // _typedSurname = typed;
                          //             },
                          //             autocorrect: false,
                          //             obscureText: false,
                          //             decoration: InputDecoration(
                          //               border: OutlineInputBorder(
                          //                   borderRadius: BorderRadius.all(
                          //                       Radius.circular(40))),
                          //               prefixIcon: Padding(
                          //                 padding: EdgeInsets.symmetric(
                          //                     horizontal: 15.0),
                          //                 child: Icon(
                          //                   Icons.person_outline,
                          //                   size: 20.0,
                          //                 ),
                          //               ),
                          //               prefixIconConstraints: BoxConstraints(
                          //                 maxHeight: 20.0,
                          //                 maxWidth: 45.0,
                          //               ),
                          //               hintText: 'Soy isminizi Giriniz.',
                          //               hintStyle: kSmallTextStyle.copyWith(
                          //                 color: Colors.grey.withOpacity(0.8),
                          //                 fontWeight: FontWeight.w400,
                          //               ),
                          //             ),
                          //           ),
                          //           TextFormField(
                          //             validator: (_typedValue) {
                          //               return (_typedValue.isEmpty)
                          //                   ? 'Boş bırakılamaz.'
                          //                   : isValidEmail()
                          //                       ? null
                          //                       : "Lütfen geçerli bir mail adresi giriniz";
                          //             },
                          //             onChanged: (typed) {
                          //               _typedMail = typed;
                          //             },
                          //             decoration: InputDecoration(
                          //               border: OutlineInputBorder(
                          //                   borderRadius: BorderRadius.all(
                          //                       Radius.circular(40))),
                          //               prefixIcon: Padding(
                          //                 padding: EdgeInsets.symmetric(
                          //                     horizontal: 15.0),
                          //                 child: Icon(
                          //                   Icons.mail_outline,
                          //                   size: 20.0,
                          //                 ),
                          //               ),
                          //               prefixIconConstraints: BoxConstraints(
                          //                 maxHeight: 20.0,
                          //                 maxWidth: 45.0,
                          //               ),
                          //               hintText: 'E-posta adresinizi giriniz.',
                          //               hintStyle: kSmallTextStyle.copyWith(
                          //                 color: Colors.grey.withOpacity(0.8),
                          //                 fontWeight: FontWeight.w400,
                          //               ),
                          //             ),
                          //           ),
                          //           TextFormField(
                          //             // validator: (_typed) {
                          //             //   if (_typed.isEmpty) {
                          //             //     return 'Boş bırakılamaz.';
                          //             //   } else if (_typed.length < 6) {
                          //             //     return 'Şifre en az 6 karakter içermelidir.';
                          //             //   } else if (_typedPasswordCheck != _typed &&
                          //             //       _typedPasswordCheck != '') {
                          //             //     return 'Şifreler birbiri ile uyuşmuyor.';
                          //             //   } else {
                          //             //     return null;
                          //             //   }
                          //             // },
                          //             onChanged: (typed) {
                          //               _typedPassword = typed;
                          //             },
                          //             autocorrect: false,
                          //             obscureText: true,
                          //             decoration: InputDecoration(
                          //               border: OutlineInputBorder(
                          //                   borderRadius: BorderRadius.all(
                          //                       Radius.circular(40))),
                          //               prefixIcon: Padding(
                          //                 padding: EdgeInsets.symmetric(
                          //                     horizontal: 15.0),
                          //                 child: Icon(
                          //                   Icons.vpn_key_outlined,
                          //                   size: 20.0,
                          //                 ),
                          //               ),
                          //               prefixIconConstraints: BoxConstraints(
                          //                 maxHeight: 20.0,
                          //                 maxWidth: 45.0,
                          //               ),
                          //               hintText: 'Şifrenizi Giriniz.',
                          //               hintStyle: kSmallTextStyle.copyWith(
                          //                 color: Colors.grey.withOpacity(0.8),
                          //                 fontWeight: FontWeight.w400,
                          //               ),
                          //             ),
                          //           ),
                          //           TextFormField(
                          //             validator: (_typed) {
                          //               if (_typed.isEmpty) {
                          //                 return 'Boş bırakılamaz.';
                          //               } else if (_typed.length < 6) {
                          //                 return 'Şifre en az 6 karakter içermelidir.';
                          //               } else if (_typedPassword != _typed &&
                          //                   _typedPassword != '') {
                          //                 return 'Şifreler birbiri ile uyuşmuyor.';
                          //               } else {
                          //                 return null;
                          //               }
                          //             },
                          //             onChanged: (typed) {
                          //               // _typedPasswordCheck = typed;
                          //             },
                          //             obscureText: true,
                          //             decoration: InputDecoration(
                          //               border: OutlineInputBorder(
                          //                   borderRadius: BorderRadius.all(
                          //                       Radius.circular(40))),
                          //               prefixIcon: Padding(
                          //                 padding: EdgeInsets.symmetric(
                          //                     horizontal: 15.0),
                          //                 child: Icon(
                          //                   Icons.vpn_key_outlined,
                          //                   size: 20.0,
                          //                 ),
                          //               ),
                          //               prefixIconConstraints: BoxConstraints(
                          //                 maxHeight: 20.0,
                          //                 maxWidth: 45.0,
                          //               ),
                          //               hintText: 'Şifrenizi Tekrar Giriniz.',
                          //               hintStyle: kSmallTextStyle.copyWith(
                          //                 color: Colors.grey.withOpacity(0.8),
                          //                 fontWeight: FontWeight.w400,
                          //               ),
                          //             ),
                          //           ),

                          //           Center(
                          //             child: Container(
                          //               height: 45,
                          //               width: 160,
                          //               margin: EdgeInsets.only(top: 10.0),
                          //               decoration: BoxDecoration(
                          //                   color: Colors.orange[300],
                          //                   gradient:
                          //                       functions.decideColor(context),
                          //                   borderRadius:
                          //                       BorderRadius.circular(20)),
                          //               child: TextButton(
                          //                 onPressed: () {
                          //                   Navigator.push(
                          //                       context,
                          //                       MaterialPageRoute(
                          //                           builder: (context) =>
                          //                               RegisterPage()));
                          //                 },
                          //                 child: Text(
                          //                   'Kayıt',
                          //                   style: kTextStyle.copyWith(
                          //                       color: Colors.white,
                          //                       fontSize: 25),
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // TextFormField(
              //   validator: (_typedValue) {
              //     return (_typedValue.isEmpty)
              //         ? 'Boş bırakılamaz.'
              //         : isValidEmail()
              //             ? null
              //             : "Lütfen geçerli bir mail adresi giriniz";
              //   },
              //   onChanged: (typed) {
              //     _typedMail = typed;
              //   },
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(40))),
              //     prefixIcon: Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 15.0),
              //       child: Icon(
              //         Icons.mail_outline,
              //         size: 20.0,
              //       ),
              //     ),
              //     prefixIconConstraints: BoxConstraints(
              //       maxHeight: 20.0,
              //       maxWidth: 45.0,
              //     ),
              //     labelText: 'E-posta',
              //     hintText: 'E-posta adresinizi giriniz.',
              //     hintStyle: kSmallTextStyle.copyWith(
              //       color: Colors.grey.withOpacity(0.8),
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),
              // ),
              // SizedBox(height: 10),
              // TextFormField(
              //   validator: (_typed) {
              //     if (_typed.isEmpty) {
              //       return 'Boş bırakılamaz.';
              //     } else if (_typed.length < 6) {
              //       return 'Şifre en az 6 karakter içermelidir.';
              //     } else {
              //       return null;
              //     }
              //   },
              //   onChanged: (typed) {
              //     _typedPassword = typed;
              //   },
              //   obscureText: true,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(40))),
              //     prefixIcon: Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 15.0),
              //       child: Icon(
              //         Icons.vpn_key_outlined,
              //         size: 20.0,
              //       ),
              //     ),
              //     prefixIconConstraints: BoxConstraints(
              //       maxHeight: 20.0,
              //       maxWidth: 45.0,
              //     ),
              //     labelText: 'Şifre',
              //     hintText: 'Şifrenizi giriniz',
              //     hintStyle: kSmallTextStyle.copyWith(
              //       color: Colors.grey.withOpacity(0.8),
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),
              // ),

              // Center(
              //   child: TextButton(
              //     onPressed: () {
              //       Provider.of<Login>(context, listen: false).loggedInUser();
              //     },
              //     child: Text(
              //       'User Girişi',
              //       style:
              //           kTextStyle.copyWith(color: Colors.black, fontSize: 25),
              //     ),
              //   ),
              // ),
              /// manager login
              ///

            ],
          ),
        ),
      ),
    );
  }
}
