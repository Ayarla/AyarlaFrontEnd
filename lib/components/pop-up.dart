import 'package:ayarla/screens/privacy_policy_page.dart';
import 'package:ayarla/services/businessOrUser_data.dart';
import 'package:ayarla/services/service_appointment.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ayarla/constants/constants.dart';
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
            TextButton(
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
            TextButton(
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
                  // Provider.of<AppointmentData>(context, listen: false)
                  //     .sendMail2(_typedMail);
                  if (!isMember) {
                    passwordFieldDialog(context: context);
                  } else {
                    // Navigator.popUntil(context, ModalRoute.withName(SearchPage.id));
                    // Navigator.pushNamed(context, ConfirmationPage.id);
                    // Provider.of<AppointmentService>(context, listen: false).confirmation();
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

  String _typedPassword;
  String _typedPasswordCheck;
  String _name;
  String _surname;
  String _phoneNumber;

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
                        padding: EdgeInsets.only(top: 20.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Checkbox(
                                  value: Provider.of<BusinessAndUserData>(context, listen: false)
                                      .checkBox,
                                  onChanged: (value) {
                                    setState(() {
                                      Provider.of<BusinessAndUserData>(context, listen: false)
                                              .checkBox =
                                          !Provider.of<BusinessAndUserData>(context, listen: false)
                                              .checkBox;
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
                TextButton(
                  // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  // padding: EdgeInsets.only(right: 10.0, bottom: 5.0, left: 10.0),
                  child: Text(
                    'Kayıt Olmadan Devam',
                    style: kSmallTextStyle.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    // Navigator.popUntil(context, ModalRoute.withName(SearchPage.id));
                    // Navigator.pushNamed(context, ConfirmationPage.id);
                    // Provider.of<AppointmentService>(context, listen: false).confirmation();
                  },
                ),
                TextButton(
                  // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  // padding: EdgeInsets.only(right: 10.0, bottom: 5.0, left: 10.0),
                  child: Text(
                    Provider.of<BusinessAndUserData>(context, listen: false).checkBox
                        ? 'Kayıt Ol ve Devam'
                        : 'Kayıt olmak için Sözleşmeyi onayla',
                    style: kSmallTextStyle.copyWith(
                      color: Provider.of<BusinessAndUserData>(context, listen: false).checkBox
                          ? Colors.blue
                          : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    if (Provider.of<BusinessAndUserData>(context, listen: false).checkBox) {
                      if (_formKey.currentState.validate()) {
                        /// TODO kayit olmayi burada yapacagiz
                        // Navigator.popUntil(context, ModalRoute.withName(SearchPage.id));
                        // Navigator.pushNamed(context, ConfirmationPage.id);
                        // Provider.of<AppointmentService>(context, listen: false).confirmation();

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
      },
    );
  }

  /// for manager pages
  managerInformationMessagePopUp({BuildContext context, String message}) {
    final width = MediaQuery.of(context).size.width;
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.only(top: 20),
          actionsPadding: EdgeInsets.only(right: 10),
          backgroundColor: Color(0xFFE5EBEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          title: Center(
            child: Text(
              'Bilgilendirme',
              style: kSmallTitleStyle,
            ),
          ),
          content: Container(
            width: width < 650 ? width / 1.5 : width / 3,
            child: Text(
              message,
              textAlign: message.length > 100 ? TextAlign.start : TextAlign.center,
              style: kSmallTextStyle,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Tamam",
                style: kSmallTextStyle.copyWith(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
}
