import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/components/ayarla_textfield.dart';
import 'package:ayarla/screens/manager_screens/business_info_page/business_info_page.dart';
import 'package:ayarla/components/unFocuser.dart';
import 'package:ayarla/services/businessOrUser_data.dart';
import 'package:ayarla/services/service_login.dart';
import 'package:ayarla/services/service_user.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfilePage> {
  GlobalKey<FormState> _accountFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();
  Functions functions = Functions();
  String _typedMail;
  String _typedPhone;
  String _typedPassword;
  String _typedPasswordCheck;
  String _typedOldPassword;

  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(_typedMail);
  }

  //
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    bool isSmallScreen = size.width < 362;
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
      body: UnFocuser(
        child: AyarlaPage(
          child: ListView(
            children: [
              SizedBox(height: 15),
              Container(
                width: size.width<=650? size.width/1.5:550,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange[500],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(width: 20),
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () => functions.showPicker(context),
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor: Colors.transparent,
                            child: Provider.of<UserService>(context,
                                            listen: true)
                                        .userImage !=
                                    null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child:
                                      Provider.of<UserService>(context,
                                              listen: true)
                                          .userImage

                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black54,
                                          blurRadius: 5.0,
                                          //spreadRadius: 1.0,
                                          offset: Offset(
                                            1.0,
                                            1.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    width: 100,
                                    height: 100,
                                    child: Icon(
                                      Icons.add_a_photo_rounded,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Provider.of<LoginService>(context, listen: false)
                              .userModel
                              .fullName ?? "Kullanıcı Adı",
                          style: kTextStyle.copyWith(
                              color: Colors.white, fontSize: size.width <= 400 ? size.width / 20 : 25),
                        ),
                        Text(
                          'xx.xx.xxxxden beri üye',
                          style: kSmallTextStyle.copyWith(color: Colors.white,fontSize: size.width <= 400 ? size.width / 30 : 15),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _accountFormKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text('Hesap Bilgilerim', style: kSmallTitleStyle),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: AyarlaTextFormField(
                          hintText: 'Mailimi Güncelle',
                          style: kSmallTextStyle.copyWith(
                              fontSize: isSmallScreen ? 10 : 14),
                          padding: EdgeInsets.all(20.0),
                          color: Colors.orange[500],
                          validator: (_typedValue) {
                            return (_typedValue.isEmpty)
                                ? 'Boş bırakılamaz'
                                : isValidEmail()
                                ? null
                                : "Lütfen geçerli bir mail adresi giriniz";
                          },
                          onChanged: (typed) {
                            _typedMail = typed;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: AyarlaTextFormField(
                          hintText: 'Telefonunuzu Giriniz (Opsiyonel)',
                          style: kSmallTextStyle.copyWith(
                              fontSize: isSmallScreen ? 10 : 14),
                          padding: EdgeInsets.all(20.0),
                          color: Colors.orange[500],
                          validator: (_typedValue) {
                            return (_typedValue.isEmpty)
                                ? 'Boş bırakılamaz'
                                : null;
                          },
                          onChanged: (typed) {
                            _typedPhone = typed;
                          },
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 35)),
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
                                  if (_accountFormKey.currentState.validate()) {
                                    /// function
                                    print("Validated");
                                  } else {
                                    print("Not Validated");
                                  }
                                },
                                child: Text(
                                  'Kaydet',
                                  style: kTextStyle.copyWith(
                                      color: Colors.white,
                                      fontSize: isSmallScreen ? 15 : 20),
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  )
              ),
              SizedBox(height: 15),
              Form(
                key: _passwordFormKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text('Şifrem', style: kSmallTitleStyle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: AyarlaTextFormField(
                            hintText: 'Eski Şifrenizi Giriniz',
                          style: kSmallTextStyle.copyWith(
                              fontSize: isSmallScreen ? 10 : 14),
                          padding: EdgeInsets.all(20.0),
                          color: Colors.orange[500],
                          validator: (_typedValue) {
                            return (_typedValue.isEmpty)
                                ? 'Boş bırakılamaz'
                                : null;
                          },
                          onChanged: (typed) {
                              setState(() {
                                _typedOldPassword = typed;
                              });
                          },
                        ),
                      ),

                      if (_typedOldPassword != null)
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: AyarlaTextFormField(
                                hintText: 'Yeni Şifrenizi Giriniz',
                                style: kSmallTextStyle.copyWith(
                                    fontSize: isSmallScreen ? 10 : 14),
                                padding: EdgeInsets.all(20.0),
                                color: Colors.orange[500],
                                validator: (_typedValue) {
                                  return (_typedValue.isEmpty)
                                      ? 'Boş bırakılamaz'
                                      : null;
                                },
                                onChanged: (typed) {
                                  _typedPassword = typed;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: AyarlaTextFormField(
                                hintText: 'Yeni Şifrenizi Tekrar Giriniz',
                                style: kSmallTextStyle.copyWith(
                                    fontSize: isSmallScreen ? 10 : 14),
                                padding: EdgeInsets.all(20.0),
                                color: Colors.orange[500],
                                validator: (_typedValue) {
                                  if (_typedValue.isEmpty) {
                                    return 'Boş bırakılamaz.';
                                  } else if (_typedValue.length < 6) {
                                    return 'Şifre en az 6 karakter içermelidir.';
                                  } else if (_typedPasswordCheck != _typedPassword) {
                                    return 'Şifreler birbiri ile uyuşmuyor.';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (typed) {
                                  _typedPasswordCheck = typed;
                                },
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<
                                            EdgeInsetsGeometry>(
                                            EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 35)),
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
                                        if (_passwordFormKey.currentState.validate()) {
                                          /// function
                                          print("Validated");
                                        } else {
                                          print("Not Validated");
                                        }
                                      },
                                      child: Text(
                                        'Kaydet',
                                        style: kTextStyle.copyWith(
                                            color: Colors.white,
                                            fontSize: isSmallScreen ? 15 : 20),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ],
                        )
                    ],
                  )
              ),


              // Form(
              //   key: _formKey,
              //   child: Container(
              //     child: Padding(
              //       padding:
              //           EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
              //       child: Wrap(
              //         runSpacing: 10.0,
              //         children: [
              //           TextFormField(
              //             validator: (_typed) {
              //               if (_typed.isEmpty) {
              //                 return 'Boş bırakılamaz.';
              //               } else {
              //                 return null;
              //               }
              //             },
              //             onChanged: (typed) {
              //               _typedName = typed;
              //             },
              //             autocorrect: false,
              //             obscureText: true,
              //             decoration: InputDecoration(
              //               border: OutlineInputBorder(
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(40))),
              //               prefixIcon: Padding(
              //                 padding: EdgeInsets.symmetric(horizontal: 15.0),
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
              //               _typedSurname = typed;
              //             },
              //             autocorrect: false,
              //             obscureText: false,
              //             decoration: InputDecoration(
              //               border: OutlineInputBorder(
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(40))),
              //               prefixIcon: Padding(
              //                 padding: EdgeInsets.symmetric(horizontal: 15.0),
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
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(40))),
              //               prefixIcon: Padding(
              //                 padding: EdgeInsets.symmetric(horizontal: 15.0),
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
              //             validator: (_typed) {
              //               if (_typed.isEmpty) {
              //                 return 'Boş bırakılamaz.';
              //               } else if (_typed.length < 6) {
              //                 return 'Şifre en az 6 karakter içermelidir.';
              //               } else if (_typedPasswordCheck != _typed &&
              //                   _typedPasswordCheck != '') {
              //                 return 'Şifreler birbiri ile uyuşmuyor.';
              //               } else {
              //                 return null;
              //               }
              //             },
              //             onChanged: (typed) {
              //               _typedPassword = typed;
              //             },
              //             autocorrect: false,
              //             obscureText: true,
              //             decoration: InputDecoration(
              //               border: OutlineInputBorder(
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(40))),
              //               prefixIcon: Padding(
              //                 padding: EdgeInsets.symmetric(horizontal: 15.0),
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
              //               _typedPasswordCheck = typed;
              //             },
              //             obscureText: true,
              //             decoration: InputDecoration(
              //               border: OutlineInputBorder(
              //                   borderRadius:
              //                       BorderRadius.all(Radius.circular(40))),
              //               prefixIcon: Padding(
              //                 padding: EdgeInsets.symmetric(horizontal: 15.0),
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
              //               // height: 45,
              //               // width: 160,
              //               width: size.width / 3,
              //               height: 45,
              //               margin: EdgeInsets.only(top: 30.0),
              //               decoration: BoxDecoration(
              //                   gradient: functions.decideColor(context),
              //                   borderRadius: BorderRadius.circular(20)),
              //               child: TextButton(
              //                 onPressed: () {
              //                   if (_formKey.currentState.validate()) {
              //                     print("Validated");
              //                   } else {
              //                     print("Not Validated");
              //                   }
              //
              //                   ///TODO save the changes
              //                 },
              //                 child: Text(
              //                   'Kaydet',
              //                   style: kTextStyle.copyWith(
              //                       color: Colors.white,
              //                       fontSize: size.width < 426 ? 18 : 25),
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
        ),
      ),
    );
  }
}
