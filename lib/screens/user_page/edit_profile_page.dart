import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/components/ayarla_textfield.dart';
import 'package:ayarla/virtual_data_base/businessOrUser_data.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:provider/provider.dart';

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
    final size = MediaQuery.of(context).size;
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
      body: AyarlaPage(
        child: ListView(
          children: [
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFFffa7ca), Color(0xFFca7799)],
                ),
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
                          child: Provider.of<BusinessAndUserData>(context,
                                          listen: true)
                                      .userImage !=
                                  null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child:
                                    Provider.of<BusinessAndUserData>(context,
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
                        "Nilsu Öz",
                        style: kTextStyle.copyWith(
                            color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        'xx.xx.xxxxden beri üye',
                        style: kSmallTextStyle.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text('Hesap Bilgilerim', style: kSmallTitleStyle),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: AyarlaTextFormField(hintText: 'Mailimi Güncelle'),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: AyarlaTextFormField(
                  hintText: 'Telefonunuzu Giriniz (Opsiyonel)'),
            ),
            SizedBox(height: 15),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text('Şifrem', style: kSmallTitleStyle),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: AyarlaTextFormField(hintText: 'Eski Şifrenizi Giriniz'),
            ),

            /// TODO - if
            Padding(
              padding: EdgeInsets.all(4.0),
              child: AyarlaTextFormField(hintText: 'Yeni Şifrenizi Giriniz'),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: AyarlaTextFormField(
                  hintText: 'Yeni Şifrenizi Tekrar Giriniz'),
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
    );
  }
}
