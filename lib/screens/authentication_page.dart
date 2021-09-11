import 'package:ayarla/api_services/api_services.dart';
import 'package:ayarla/components/ayarla_bottom_sheet.dart';
import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/components/ayarla_textfield.dart';
import 'package:ayarla/screens/privacy_policy_page.dart';
import 'package:ayarla/services/service_login.dart';
import 'package:ayarla/services/service_user.dart';
import 'package:ayarla/api_services/user_api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:ayarla/components/UI/logos&icons&texts.dart' as UI;

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> with TickerProviderStateMixin {
  GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> _regFormKey = GlobalKey<FormState>();
  Functions functions = Functions();
  String _typedMail;
  String _typedPassword;
  String _typedPasswordCheck;
  String _typedSurname;
  String _typedName;
  String _typedRoleName;
  bool _newPassword = false;

  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(_typedMail);
  }

  bool switchValue = false;
  bool isLoading = false;
  Widget spinKitSquareCircle;

  @override
  void initState() {
    spinKitSquareCircle = SpinKitFoldingCube(
      color: Colors.white,
      size: 30.0,
      controller: AnimationController(vsync: this, duration: const Duration(seconds: 2)),
    );
    super.initState();
  }

  login() async {
    if (_loginFormKey.currentState.validate()) {
      try {
        setState(() => isLoading = true);

        /// TODO geriye donen veriyi kaydet - Done. See LoginService.
        var returnData = await ApiServices()
            .authenticate(userNameOrEmailAddress: _typedMail, password: _typedPassword, rememberClient: false);
        await Provider.of<LoginService>(context, listen: false).login(userID: returnData['userId'], context: context);
        Navigator.pushReplacementNamed(context, "/KullaniciSayfasi");
      } catch (e) {
        Toast.show("Girdiğiniz Bilgilere Ait Bir Hesap Bulamadık", context, duration: 2, backgroundColor: Colors.red[200]);
      } finally {
        setState(() => isLoading = false);
      }
    } else {
      Toast.show("Girdiğiniz Bilgileri Kontrol Ediniz", context, duration: 2, backgroundColor: Colors.red[200]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isSmallScreen = size.width < 362;
    final padding = MediaQuery.of(context).padding.top;
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Color(0xFF6CC4D7), Color(0xFFFEEDA8)]),
        ),
        padding: EdgeInsets.all(10.0),
        child: AyarlaPage(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                SizedBox(height: 30),
                UI.generalLogo,
                SizedBox(height: 30),
                TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black54,
                  labelStyle: kTitleStyle,
                  unselectedLabelStyle: kTitleStyle,
                  indicatorColor: Colors.orange[500],
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 3.0, color: Colors.orange[500]),
                      insets: isSmallScreen ? EdgeInsets.zero : EdgeInsets.symmetric(horizontal: -30.0)),
                  tabs: [
                    Tab(child: Text("Giriş Yapın", style: kTextStyle.copyWith(fontSize: isSmallScreen ? 14 : 20))),
                    Tab(child: Text("Kayıt Olun", style: kTextStyle.copyWith(fontSize: isSmallScreen ? 14 : 20))),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 244 - padding,
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Form(
                                key: _loginFormKey,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 500,
                                      padding: EdgeInsets.all(8),
                                      child: AyarlaTextFormField(
                                        hintText: 'Mail adresinizi giriniz',
                                        hintStyle: kSmallTextStyle.copyWith(fontSize: isSmallScreen ? 10 : 14),
                                        style: kSmallTextStyle.copyWith(fontSize: isSmallScreen ? 10 : 14),
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
                                    Container(
                                      width: 500,
                                      padding: EdgeInsets.all(8),
                                      child: AyarlaTextFormField(
                                        hintText: 'Şifrenizi giriniz',
                                        hintStyle: kSmallTextStyle.copyWith(fontSize: isSmallScreen ? 10 : 14),
                                        style: kSmallTextStyle.copyWith(fontSize: isSmallScreen ? 10 : 14),
                                        padding: EdgeInsets.all(20.0),
                                        color: Colors.orange[500],
                                        validator: (_typed) {
                                          if (_typed.isEmpty) {
                                            return 'Boş bırakılamaz';
                                          } else if (_typed.length < 6) {
                                            return 'Şifre en az 6 karakter içermelidir';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (typed) {
                                          _typedPassword = typed;
                                        },
                                        obscureText: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: 500,
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          _newPassword = true;
                                        });
                                      },
                                      child: Text('Şifremi unuttum',
                                          style: kSmallTextStyle.copyWith(
                                              color: Colors.orange[800], fontSize: isSmallScreen ? 10 : 15)),
                                    ),
                                    Spacer(),
                                    TextButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                            EdgeInsets.symmetric(vertical: 12, horizontal: 40)),
                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                                        shape: MaterialStateProperty.all<OutlinedBorder>(
                                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                                      ),
                                      onPressed: () async => await login(),
                                      child: !isLoading
                                          ? Text(
                                              'Giriş',
                                              style:
                                                  kTextStyle.copyWith(color: Colors.white, fontSize: isSmallScreen ? 15 : 25),
                                            )
                                          : spinKitSquareCircle,
                                    ),
                                  ],
                                ),
                              ),
                              if (_newPassword)
                                Container(
                                  width: 500,
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10),
                                      AyarlaTextFormField(
                                        hintText: 'Mail adresinizi giriniz',
                                        padding: EdgeInsets.all(20.0),
                                        validator: (_typedValue) {
                                          return (_typedValue.isEmpty)
                                              ? 'Boş bırakılamaz'
                                              : isValidEmail()
                                                  ? null
                                                  : "Lütfen geçerli bir mail adresi giriniz";
                                        },
                                      ),
                                      SizedBox(height: 10),
                                      TextButton(
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                              EdgeInsets.symmetric(vertical: 12, horizontal: 40)),
                                          backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                                          shape: MaterialStateProperty.all<OutlinedBorder>(
                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _newPassword = false;
                                          });

                                          ///TODO - send mail.
                                        },
                                        child: Text(
                                          'Gönder',
                                          style: kTextStyle.copyWith(color: Colors.white, fontSize: isSmallScreen ? 15 : 25),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text(
                                    "Lütfen hesap türünü seçiniz",
                                    style: kTextStyle.copyWith(fontSize: isSmallScreen ? 14 : 20),
                                  ),
                                ),
                              ),
                              Center(
                                child: FlutterToggleTab(
                                  width: MediaQuery.of(context).size.width > 900 ? 20 : 50,
                                  borderRadius: 15,
                                  initialIndex: 0,
                                  selectedBackgroundColors: [Colors.orange[500]],
                                  selectedTextStyle: TextStyle(
                                      color: Colors.white, fontSize: isSmallScreen ? 10 : 18, fontWeight: FontWeight.w600),
                                  unSelectedTextStyle: TextStyle(
                                      color: Colors.orange[500],
                                      fontSize: isSmallScreen ? 8 : 14,
                                      fontWeight: FontWeight.w400),
                                  labels: ["Müşteri", "İşyeri"],
                                  icons: [Icons.person, Icons.work],
                                  selectedLabelIndex: (index) {
                                    if (index == 0) {
                                      _typedRoleName = 'USER';
                                    } else if (index == 1) {
                                      /// TODO
                                      _typedRoleName = 'USER';
                                    }
                                    print("Selected Index $index");
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                              Form(
                                key: _regFormKey,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 500,
                                      padding: EdgeInsets.symmetric(vertical: 8.0),
                                      child: AyarlaTextFormField(
                                        hintText: 'İsminizi Giriniz',
                                        style: kSmallTextStyle.copyWith(fontSize: isSmallScreen ? 10 : 14),
                                        padding: EdgeInsets.all(20.0),
                                        color: Colors.orange[500],
                                        validator: (_typed) {
                                          if (_typed.isEmpty) {
                                            return 'Boş bırakılamaz';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (typed) {
                                          _typedName = typed;
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 500,
                                      padding: EdgeInsets.symmetric(vertical: 8.0),
                                      child: AyarlaTextFormField(
                                        hintText: 'Soy İsminizi Giriniz',
                                        style: kSmallTextStyle.copyWith(fontSize: isSmallScreen ? 10 : 14),
                                        padding: EdgeInsets.all(20.0),
                                        color: Colors.orange[500],
                                        validator: (_typed) {
                                          if (_typed.isEmpty) {
                                            return 'Boş bırakılamaz';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (typed) {
                                          _typedSurname = typed;
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 500,
                                      padding: EdgeInsets.symmetric(vertical: 8.0),
                                      child: AyarlaTextFormField(
                                        hintText: 'Mail Adresinizi Giriniz',
                                        style: kSmallTextStyle.copyWith(fontSize: isSmallScreen ? 10 : 14),
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
                                    Container(
                                      width: 500,
                                      padding: EdgeInsets.symmetric(vertical: 8.0),
                                      child: AyarlaTextFormField(
                                        hintText: 'Şifrenizi Giriniz',
                                        style: kSmallTextStyle.copyWith(fontSize: isSmallScreen ? 10 : 14),
                                        padding: EdgeInsets.all(20.0),
                                        color: Colors.orange[500],
                                        validator: (_typed) {
                                          if (_typed.isEmpty) {
                                            return 'Boş bırakılamaz';
                                          } else if (_typed.length < 6) {
                                            return 'Şifre en az 6 karakter içermelidir';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (typed) {
                                          _typedPassword = typed;
                                        },
                                        obscureText: true,
                                      ),
                                    ),
                                    Container(
                                      width: 500,
                                      padding: EdgeInsets.symmetric(vertical: 8.0),
                                      child: AyarlaTextFormField(
                                        hintText: 'Şifrenizi Tekrar Giriniz',
                                        style: kSmallTextStyle.copyWith(fontSize: isSmallScreen ? 10 : 14),
                                        padding: EdgeInsets.all(20.0),
                                        color: Colors.orange[500],
                                        validator: (_typed) {
                                          if (_typed.isEmpty) {
                                            return 'Boş bırakılamaz';
                                          } else if (_typed.length < 6) {
                                            return 'Şifre en az 6 karakter içermelidir';
                                          } else if (_typedPasswordCheck != _typed && _typedPasswordCheck != '') {
                                            return 'Şifreler birbiri ile uyuşmuyor';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (typed) {
                                          _typedPasswordCheck = typed;
                                        },
                                        obscureText: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                      activeColor: Colors.orange[500],
                                      value: Provider.of<UserService>(context, listen: false).checkBox,
                                      onChanged: (value) {
                                        setState(() {
                                          Provider.of<UserService>(context, listen: false).checkBox =
                                              !Provider.of<UserService>(context, listen: false).checkBox;
                                        });
                                      }),
                                  SizedBox(width: 10),
                                  Flexible(
                                    child: Container(
                                      width: 455,
                                      child: RichText(
                                        text: TextSpan(
                                          style: kSmallTextStyle.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: "Ayarla ",
                                              style: kSmallTextStyle.copyWith(
                                                fontSize: isSmallScreen ? 10 : 14,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Gizlilik Sözleşmesi',
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  /// Privacy Policy ModalBottomSheet
                                                  createSheet(
                                                      context,
                                                      privacyOrAgreementModalBottomSheet(
                                                        context: context,
                                                        setState: setState,
                                                        heading: "Ayarla Gizlilik Sözleşmesi",
                                                        content: "Ayarla Gizlilik Sözleşmesi",
                                                      ),
                                                      size.height * 0.9);
                                                },
                                              style: kSmallTextStyle.copyWith(
                                                fontSize: isSmallScreen ? 10 : 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.orange[800],
                                                fontStyle: FontStyle.italic,
                                                decoration: TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text: " ve ",
                                              style: kSmallTextStyle.copyWith(
                                                fontSize: isSmallScreen ? 10 : 14,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Kullanıcı Sözleşmesi`ni',
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  /// Privacy Policy ModalBottomSheet
                                                  createSheet(
                                                      context,
                                                      privacyOrAgreementModalBottomSheet(
                                                        context: context,
                                                        setState: setState,
                                                        heading: "Ayarla Kullanıcı Sözleşmesi",
                                                        content: "Ayarla Kullanıcı Sözleşmesi",
                                                      ),
                                                      size.height * 0.9);
                                                },
                                              style: kSmallTextStyle.copyWith(
                                                fontSize: isSmallScreen ? 10 : 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.orange[800],
                                                fontStyle: FontStyle.italic,
                                                decoration: TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' okudum, onaylıyorum.',
                                              style: kSmallTextStyle.copyWith(fontSize: isSmallScreen ? 10 : 14),
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
                                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                        EdgeInsets.symmetric(vertical: 12, horizontal: 40)),
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.orange[500]),
                                    shape: MaterialStateProperty.all<OutlinedBorder>(
                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                                  ),
                                  onPressed: () {
                                    if (_regFormKey.currentState.validate()) {
                                      print("Form Validated...");
                                      UserApiServices().createUser(
                                        userName: _typedMail,
                                        name: _typedName,
                                        surname: _typedSurname,
                                        email: _typedMail,
                                        password: _typedPassword,
                                        roleNames: 'USER',
                                      );
                                    } else {
                                      /// TODO: Toast maybe?
                                      print("Not Validated!");
                                    }

                                    ///TODO check and push somewhere
                                  },
                                  child: Text(
                                    'Kayıt Ol',
                                    style: kTextStyle.copyWith(color: Colors.white, fontSize: isSmallScreen ? 15 : 25),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
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
