import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/screens/confirmation_page.dart';
import 'package:ayarla/screens/privacy_policy_page.dart';
import 'package:ayarla/screens/search_page.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:provider/provider.dart';

class PopUp {
  bool isWrong = false;

  /// TODO uye degilse kayit ol pop up acilmali
  bool isMember = false;

  List<String> holder = [];
  List<String> holder2 = [];
  List<String> holder3 = [];
  String last = "";
  String dateTime = "";

  mailFieldDialog({BuildContext context}) {
    final _formKey = GlobalKey<FormState>();
    String _typedMail;
    bool isValidEmail() {
      return RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(_typedMail);
    }

    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFE5EBEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          title: Column(
            children: [
              Text(
                'Randevu Onay',
                style: kSmallTitleStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Size randevu özetini gönderebilmemiz için mail adresinizi giriniz.',
                      textAlign: TextAlign.start,
                      style: kSmallTextStyle.copyWith(),
                    ),
                  ),
                  TextFormField(
                    validator: (_typedValue) {
                      return (_typedValue.isEmpty)
                          ? 'Boş Bırakılamaz'
                          : isValidEmail()
                              ? null
                              : "Lütfen geçerli bir mail adresi giriniz";
                    },
                    autocorrect: false,
                    onChanged: (typed) {
                      _typedMail = typed;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Icon(
                          Icons.mail_outline,
                          size: 20.0,
                        ),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        maxHeight: 20.0,
                        maxWidth: 30.0,
                      ),
                      hintText: 'Mail Adresinizi Giriniz',
                      hintStyle: kSmallTextStyle.copyWith(
                        color: Colors.grey.withOpacity(0.8),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      '* Akşam saatlerinde gönderilen randevu talepleri bir sonraki iş günü kabul edilir.',
                      textAlign: TextAlign.start,
                      style: kSmallTextStyle.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      '* İşletme onayı verilmeden randevunuz kesin değildir.',
                      textAlign: TextAlign.start,
                      style: kSmallTextStyle.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'İptal',
                style: kSmallTextStyle.copyWith(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                _typedMail = '';
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text(
                'Onayla',
                style: kSmallTextStyle.copyWith(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () async {
                ///TODO eger kullanici kayit yaptirirsa burada yazilan mail kullanicin profiline eklenecek
                if (_formKey.currentState.validate()) {
                  Provider.of<AppointmentData>(context, listen: false).sendMail2(_typedMail);
                  if (!isMember) {
                    passwordFieldDialog(context: context);
                  } else {
                    Navigator.popUntil(context, ModalRoute.withName(SearchPage.id));
                    Navigator.pushNamed(context, ConfirmationPage.id);
                    Provider.of<AppointmentData>(context, listen: false).confirmation();
                  }
                }

                /// mail yollamadan gecis icin
                passwordFieldDialog(context: context);
              },
            ),
          ],
        );
      },
    );
  }

  privacyPolicyModalBottomSheet({BuildContext context, StateSetter setState}) {
    final Size size = MediaQuery.of(context).size;
    final Functions functions = Functions();
    return Container(
      height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 10),
      child: Scaffold(
        backgroundColor: Color(0xFFE5EBEE),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: <Widget>[
              Text(
                'Ayarla Gizlilik sozlesmesi',
              ),
              SizedBox(height: 10),
              Text('sfhjskfjaksfhksafhjsahfjkshfksahdkfdskafksahfjkshagsgaskgkskagksadkgasgbsakjgfbskbfsjb'),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 32.0),
          child: Row(
            children: <Widget>[
              Container(
                width: size.width - 4 * (size.width / 6),
                decoration: BoxDecoration(
                  gradient: functions.decideColor(context),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: FloatingActionButton.extended(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      checkBox = false;
                    });

                    Navigator.pop(context);
                  },
                  label: FittedBox(
                    fit: BoxFit.cover,
                    child: Icon(
                      FontAwesomeIcons.ban,
                      size: 35,
                    ),

                    // child: Icon(
                    //   Icons.ca,
                    //   size: 40,
                    // ),
                  ),
                ),
              ),
              Spacer(),
              Container(
                width: size.width - 4 * (size.width / 6),
                decoration: BoxDecoration(
                  gradient: functions.decideColor(context),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: FloatingActionButton.extended(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    setState(() {
                      checkBox = true;
                    });
                    Navigator.pop(context);
                  },
                  label: FittedBox(
                    fit: BoxFit.cover,
                    child: Icon(
                      FontAwesomeIcons.check,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _typedPassword;
  String _typedPasswordCheck;
  String _name;
  String _surname;
  String _phoneNumber;
  bool checkBox = false;

  passwordFieldDialog({BuildContext context}) {
    final _formKey = GlobalKey<FormState>();
    showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          /// StateBuilder enables us to use setState
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                titlePadding: EdgeInsets.only(top: 20),
                contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 24.0),
                actionsPadding: EdgeInsets.all(0),
                backgroundColor: Color(0xFFE5EBEE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
                title: Center(
                  child: Text(
                    'Mail Gönderildi',
                    style: kSmallTitleStyle,
                  ),
                ),
                content: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Kaydınızı tamamlayabilir ya da kayıt olmadan devam edebilirsin.',
                            textAlign: TextAlign.start,
                            style: kSmallTextStyle,
                          ),
                        ),

                        /// Name Field
                        TextFormField(
                          validator: (_typed) {
                            if (_typed.isEmpty) {
                              return 'Boş Bırakılamaz';
                            } else
                              return null;
                          },
                          onChanged: (typed) {
                            _name = typed;
                          },
                          autocorrect: false,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(right: 15.0),
                              child: Icon(
                                Icons.person_outline,
                                size: 20.0,
                              ),
                            ),
                            prefixIconConstraints: BoxConstraints(
                              maxHeight: 20.0,
                              maxWidth: 30.0,
                            ),
                            hintText: 'İsminizi Giriniz',
                            hintStyle: kSmallTextStyle.copyWith(
                              color: Colors.grey.withOpacity(0.8),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),

                        /// Surname Field
                        TextFormField(
                          validator: (_typed) {
                            if (_typed.isEmpty) {
                              return 'Boş Bırakılamaz';
                            } else
                              return null;
                          },
                          onChanged: (typed) {
                            _surname = typed;
                          },
                          autocorrect: false,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(right: 15.0),
                              child: Icon(
                                Icons.person_outline,
                                size: 20.0,
                              ),
                            ),
                            prefixIconConstraints: BoxConstraints(
                              maxHeight: 20.0,
                              maxWidth: 30.0,
                            ),
                            hintText: 'Soy İsminizi Giriniz',
                            hintStyle: kSmallTextStyle.copyWith(
                              color: Colors.grey.withOpacity(0.8),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),

                        /// Password Field
                        TextFormField(
                          validator: (_typed) {
                            if (_typed.isEmpty) {
                              return 'Boş Bırakılamaz';
                            } else if (_typed.length < 6) {
                              return 'Şifre en az 6 karakter içermelidir';
                            } else if (_typedPasswordCheck != _typed && _typedPasswordCheck != '') {
                              return 'Şifreler birbiri ile uyuşmuyor';
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
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Icon(
                                Icons.vpn_key_outlined,
                                size: 20.0,
                              ),
                            ),
                            prefixIconConstraints: BoxConstraints(
                              maxHeight: 20.0,
                              maxWidth: 30.0,
                            ),
                            hintText: 'Şifrenizi Giriniz',
                            hintStyle: kSmallTextStyle.copyWith(
                              color: Colors.grey.withOpacity(0.8),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),

                        /// Password Check Field
                        TextFormField(
                          validator: (_typed) {
                            if (_typed.isEmpty) {
                              return 'Boş Bırakılamaz';
                            } else if (_typed.length < 6) {
                              return 'Şifre en az 6 karakter içermelidir';
                            } else if (_typedPassword != _typed && _typedPassword != '') {
                              return 'Şifreler birbiri ile uyuşmuyor';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (typed) {
                            _typedPasswordCheck = typed;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(right: 15.0),
                              child: Icon(
                                Icons.vpn_key_outlined,
                                size: 20.0,
                              ),
                            ),
                            prefixIconConstraints: BoxConstraints(
                              maxHeight: 20.0,
                              maxWidth: 30.0,
                            ),
                            hintText: 'Şifrenizi Tekrar Giriniz',
                            hintStyle: kSmallTextStyle.copyWith(
                              color: Colors.grey.withOpacity(0.8),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),

                        /// Phone Number Field
                        TextFormField(
                          validator: (_typed) {
                            if (_typed.isEmpty) {
                              return 'Boş Bırakılamaz';
                            } else
                              return null;
                          },
                          onChanged: (typed) {
                            _phoneNumber = typed;
                          },
                          autocorrect: false,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: InputDecoration(
                            hintText: 'Telefon Numaranızı Giriniz',
                            hintStyle: kSmallTextStyle.copyWith(
                              color: Colors.grey.withOpacity(0.8),
                              fontWeight: FontWeight.w400,
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(right: 15.0),
                              child: Icon(
                                Icons.call_outlined,
                                size: 20.0,
                              ),
                            ),
                            prefixIconConstraints: BoxConstraints(
                              maxHeight: 20.0,
                              maxWidth: 30.0,
                            ),
                          ),
                        ),

                        /// Privacy Policy text
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: Checkbox(
                                    value: checkBox,
                                    onChanged: (value) {
                                      setState(() {
                                        checkBox = !checkBox;
                                      });
                                    }),
                              ),
                              SizedBox(width: 10),
                              FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2.05,
                                  child: RichText(
                                    text: TextSpan(
                                      style: kSmallTextStyle.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'Ayarla Gizlilik ve Kullanıcı Sözleşmesi`ni',
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              /// Privacy Policy ModalBottomSheet
                                              showModalBottomSheet(
                                                  enableDrag: false,
                                                  isScrollControlled: true,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.vertical(
                                                      top: Radius.circular(20.0),
                                                    ),
                                                  ),
                                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return privacyPolicyModalBottomSheet(
                                                        context: context, setState: setState);
                                                  });
                                            },
                                          style: kSmallTextStyle.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blue,
                                            fontStyle: FontStyle.italic,
                                            decoration: TextDecoration.underline,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' okudum, onaylıyorum.',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: EdgeInsets.only(right: 10.0, bottom: 5.0, left: 10.0),
                    child: Text(
                      'Kayıt Olmadan Devam',
                      style: kSmallTextStyle.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.popUntil(context, ModalRoute.withName(SearchPage.id));
                      Navigator.pushNamed(context, ConfirmationPage.id);
                      Provider.of<AppointmentData>(context, listen: false).confirmation();
                    },
                  ),
                  FlatButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: EdgeInsets.only(right: 10.0, bottom: 5.0, left: 10.0),
                    child: Text(
                      checkBox ? 'Kayıt Ol ve Devam' : 'Kayıt olmak için Sözleşmeyi onayla',
                      style: kSmallTextStyle.copyWith(
                        color: checkBox ? Colors.blue : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      if (checkBox) {
                        if (_formKey.currentState.validate()) {
                          /// TODO kayit olmayi burada yapacagiz
                          Navigator.popUntil(context, ModalRoute.withName(SearchPage.id));
                          Navigator.pushNamed(context, ConfirmationPage.id);
                          Provider.of<AppointmentData>(context, listen: false).confirmation();

                          print(_phoneNumber);
                          print(_name);
                          print(_surname);
                          print(_typedPassword);
                        }
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              );
            },
          );
        });
  }
}
