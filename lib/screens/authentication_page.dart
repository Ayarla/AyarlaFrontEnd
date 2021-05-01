import 'package:flutter/material.dart';
import 'package:ayarla/components/register.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';

class AuthenticationPage extends StatelessWidget {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Functions functions = Functions();
  String _typedMail;
  String _typedPassword;
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(_typedMail);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Form(
        key: _formkey,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
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
                      borderRadius: BorderRadius.all(Radius.circular(40))),
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
                  labelText: 'E-posta',
                  hintText: 'E-posta adresinizi giriniz.',
                  hintStyle: kSmallTextStyle.copyWith(
                    color: Colors.grey.withOpacity(0.8),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                validator: (_typed) {
                  if (_typed.isEmpty) {
                    return 'Boş bırakılamaz.';
                  } else if (_typed.length < 6) {
                    return 'Şifre en az 6 karakter içermelidir.';
                  } else {
                    return null;
                  }
                },
                onChanged: (typed) {
                  _typedPassword = typed;
                },
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))),
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
                  labelText: 'Şifre',
                  hintText: 'Şifrenizi giriniz',
                  hintStyle: kSmallTextStyle.copyWith(
                    color: Colors.grey.withOpacity(0.8),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  //TODO Forget password page
                },
                child: Text('Şifremi unuttum',
                    style: kSmallTextStyle.copyWith(
                        color: Colors.blue, fontSize: 15)),
              ),
              Center(
                child: Container(
                  height: 45,
                  width: 160,
                  decoration: BoxDecoration(
                      gradient: functions.decideColor(context),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      if (_formkey.currentState.validate()) {
                        print("Validated");
                      } else {
                        print("Not Validated");
                      }

                      ///TODO check and push somewhere
                    },
                    child: Text(
                      'Giriş',
                      style: kTextStyle.copyWith(
                          color: Colors.white, fontSize: 25),
                    ),
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
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
    );
  }
}
