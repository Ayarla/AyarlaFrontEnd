import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:randevudemo/constants/constants.dart';
import 'package:randevudemo/models/functions.dart';
import 'package:randevudemo/screens/search_page.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Functions functions = Functions();

  String _typedMail;
  String _typedPassword;
  String _typedPasswordCheck;
  String _typedName;
  String _typedSurname;

  int index=1;

  final String _adminToken =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjEiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJhZG1pbkBhc3BuZXRib2lsZXJwbGF0ZS5jb20iLCJBc3BOZXQuSWRlbnRpdHkuU2VjdXJpdHlTdGFtcCI6IjEyYWEzZjQ1LWVkZGMtMGEzYi02MGE5LTM5ZmE1MWMyNDE1NCIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkFkbWluIiwic3ViIjoiMSIsImp0aSI6IjBjNWNkZjIyLWE5ZmQtNGM5MS05YTk2LTM2YTUxY2Q4N2VlZSIsImlhdCI6MTYxNTM3Njc2OSwibmJmIjoxNjE1Mzc2NzY5LCJleHAiOjE2MTU0NjMxNjksImlzcyI6IkF5YXJsYSIsImF1ZCI6IkF5YXJsYSJ9.ARj2CphmCEsDamRawGOu8y-Et1pHocRlkHcNA7Kvdhw';

  final String _userToken = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjIzIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6IlNlbWloR00iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJzZW1paEBheWFybGEuYXBwIiwiQXNwTmV0LklkZW50aXR5LlNlY3VyaXR5U3RhbXAiOiI1UE0yVkxaVDZJQUUzUFBLWTZBN1pPVjJZN0pKUUlNNSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkFkbWluIiwic3ViIjoiMjMiLCJqdGkiOiI1ZTVlZjYwNS02NzNhLTQ2MGMtODE3NS0yZDQyODJjYTA0MmEiLCJpYXQiOjE2MTUzMTIwODUsIm5iZiI6MTYxNTMxMjA4NSwiZXhwIjoxNjE1Mzk4NDg1LCJpc3MiOiJBeWFybGEiLCJhdWQiOiJBeWFybGEifQ.dxCUy3BowF9swq5KI3n3icJHyuFi1aaFvB-XZUzEw';

  /// TODO add isValidEmail() to the functions-we are using multiple times.
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(_typedMail);
  }

  Future createUser() async {
    final String _url = 'http://10.0.2.2:21021/api/services/app/User/Create';

    Map data = {
      "userName": "asasdd",
      "name": "aadsd",
      "surname": "assd",
      "emailAddress": "aasasddd@gmail.com",
      "isActive": true,
      "roleNames": [
        "User"
      ],
      "password": "123456"
    };

    var body = json.encode(data);

    http.Response response = await http.post(_url,
        headers: <String, String>{
          'Authorization': _adminToken,
          'Content-type': 'application/json; charset=utf-8',
        },
        body: body);

    if (response.statusCode == 200) {
      String data = response.body;
      print('kullanici olusturuldu');
      return jsonEncode(data);
    } else {
      print(response.statusCode);
      var error = jsonDecode(response.body);
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(5, 50),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: functions.decideColor(context),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
          ),
          leading: FlatButton(
            child: Icon(Icons.home, color: Colors.white, size: 40.0),
            onPressed: () {
              Navigator.popUntil(
                  context,
                  ModalRoute.withName(
                      SearchPage.id
                  ));
            },
          ),
          title: Center(
              child: Text(
                "ayarla",
                style: kTitleStyle.copyWith(
                    color: Colors.white, letterSpacing: 2, fontSize: 30),
              )),
          actions: [

          ],
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:10.0),
              child: Text("Lütfen hesap türünü seçiniz",style: kTitleStyle,),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black26
                            )
                        ),
                        child: TextButton(
                          child: Center(
                            child:Column(children: [
                              Icon(Icons.person, size:100),
                              Text("Müşteri", style: kTextStyle,),

                            ]),
                          ),
                          onPressed: (){
                            setState(() {
                              index=1;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  /// TODO - yeşil ikon yerine border yeşil olsun.
                  if(index==1)Positioned(
                    child: Icon(Icons.check_circle,color:Colors.green),
                    bottom: 0,
                    right: 0,
                  ),
                ],
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black26
                            )
                        ),
                        child: FlatButton(
                          child: Center(
                            child: Column(
                                children: [
                                  Icon(Icons.work, size:110),
                                  Text("Yönetici", style: kTextStyle,),
                                ]),
                          ),
                          onPressed: (){
                            setState(() {
                              index=2;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  if(index==2)Positioned(
                    child: Icon(Icons.check_circle,color:Colors.green),
                    bottom: 0,
                    right: 0,
                  ),
                ],
              ),
            ],
          ),
          Form(
            key: _formkey,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 10.0),
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
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40))
                        ),
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
                        }  else {
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
                            borderRadius: BorderRadius.all(Radius.circular(40))
                        ),
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
                            borderRadius: BorderRadius.all(Radius.circular(40))
                        ),
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
                            borderRadius: BorderRadius.all(Radius.circular(40))
                        ),
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
                            borderRadius: BorderRadius.all(Radius.circular(40))
                        ),
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
                        margin: EdgeInsets.only(top:10.0),
                        decoration: BoxDecoration(
                            gradient: functions.decideColor(context),
                            borderRadius: BorderRadius.circular(20)),
                        child: FlatButton(
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              print("Validated");
                            } else {
                              print("Not Validated");
                            }
                            ///TODO register the user(index=1: Müşteri, index=2:Yönetici)
                            createUser();
                          },
                          child: Text(
                            'Kayıt',
                            style: kTextStyle.copyWith(color: Colors.white, fontSize: 25),
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
