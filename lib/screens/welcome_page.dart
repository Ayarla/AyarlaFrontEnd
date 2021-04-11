import 'package:ayarla/models/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/components/UI/logos&icons&texts.dart' as UI;
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/menuItem.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../notif.dart';

class WelcomePage extends StatefulWidget {
  static const String id = "WelcomePage";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  ScrollController myController;
  final String _userToken = "";
  final String _adminToken = "";
  // final String _accountToken = '';

  /// Delete User from database
  Future deleteUser(String id) async {
    final String _url = 'http://localhost:21021/api/services/app/User/Delete';
    http.Response response = await http.delete(
      '$_url?Id=$id',
      headers: <String, String>{
        'Authorization': _adminToken,
        'Content-type': 'application/json; charset=utf-8',
      },
    );
    if (response.statusCode == 200) {
      String data = response.body;
      print('kullanici silindi');
      return jsonEncode(data);
    } else {
      /// server error message
      var error = jsonDecode(response.body)['error']['message'];
      print(response.statusCode);
      print(error);
    }
  }

  Future getToken() async {
    final String _url =
        'https://ayarlawebhost20210410115100.azurewebsites.net/api/TokenAuth/Authenticate';
    Map data = {
      "userNameOrEmailAddress": "admin",
      "password": "123qwe",
      "rememberClient": true
    };
    var body = json.encode(data);

    http.Response response = await http.post(_url,
        headers: <String, String>{
          'Authorization': _adminToken,
          'Content-type': 'application/json; charset=utf-8',
        },
        body: body);
    var adminToken = jsonDecode(response.body)['result']['accessToken'];
    print(adminToken);

    if (response.statusCode == 200) {
      String data = response.body;
      print('Token Çekildi!');
      return jsonEncode(data);
    } else {
      /// server error message
      print(response.statusCode);
      // var error = jsonDecode(response.body)['error']['message'];
      // print(error);
    }
  }

  /// Create User
  Future createUser() async {
    final String _url =
        'https://ayarlawebhost20210410115100.azurewebsites.net/api/services/app/User/Create';

    Map data = {
      "userName": "hellasdoguys",
      "name": "azönceolmuştuşiasdmdiolmuyo",
      "surname": "fatihasaasdsdd34",
      "emailAddress": "hellogasduyss@gmail.com",
      "isActive": true,
      "roleNames": ["User"],
      "password": "1234aadsfsaasddssdsgfsdf"
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
      /// server error message
      print(response.statusCode);
      // var error = jsonDecode(response.body)['error']['message'];
      // print(error);
    }
  }

  // Future userUpdate() async {
  //   final String _url = 'http://localhost:21021/api/services/app/User/Update';
  //
  //   Map data = {
  //     "userName": "string",
  //     "name": "string",
  //     "surname": "string",
  //     "emailAddress": "user@example.com",
  //     "isActive": true,
  //     "fullName": "string",
  //     "lastLoginTime": "2021-03-06T18:07:37.910Z",
  //     "creationTime": "2021-03-06T18:07:37.910Z",
  //     "roleNames": ["string"],
  //     "password": "string",
  //   };
  //   var body = json.encode(data);
  //   http.Response response = await http.put(_url,
  //       headers: <String, String>{
  //         'Authorization': _userToken,
  //         'Content-type': 'application/json; charset=utf-8',
  //       },
  //       body: body);
  //   if (response.statusCode == 200) {
  //     String data = response.body;
  //     print('kullanici guncellendi');
  //     return jsonEncode(data);
  //   } else {
  //     /// server error message
  //     var error = jsonDecode(response.body)['error']['message'];
  //     print(response.statusCode);
  //     print(error);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    myController = ScrollController();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    // PushNotificationsManager();
  }

  @override
  Widget build(BuildContext context) {
    // bool check = Provider.of<Login>(context, listen: true).holder;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DefaultAppBar(
        title: UI.appBarTitleCustomer,
        color: Color(0xFF90a4ae).withOpacity(0.4),
        showBackButton: false,
      ).build(context),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xFF6CC4D7), Color(0xFFFEEDA8)]),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            controller: myController,
            children: <Widget>[
              // TextButton(
              //     onPressed: () {
              //       userUpdate();
              //     },
              //     child: Text('guncelle')),
              // TextButton(
              //     onPressed: () {
              //       /// TODO id dynamic olmali
              //       deleteUser(38.toString());
              //     },
              //     child: Text('sil')),
              TextButton(
                  onPressed: () {
                    createUser();
                  },
                  child: Text("olustur")),
              TextButton(
                  onPressed: () {
                    getToken();
                  },
                  child: Text("getToken")),
              // !check
              //     ? SizedBox()
              //     : Row(
              //         mainAxisAlignment: MainAxisAlignment.end,
              //         children: [
              //           Padding(
              //             padding: EdgeInsets.only(right: 30),
              //             child: GestureDetector(
              //               onTap: () {
              //                 Navigator.pushNamed(context, UserPage.id);
              //               },
              //               child: IconButton(
              //                 icon: Icon(
              //                   Icons.account_circle,
              //                   // color: Colors.blueGrey.shade900,
              //                   color: Color(0xFF2d3b4a),
              //                   // color: Color(0xFF838383),
              //                   // color: Colors.white70,
              //                   size: 50.0,
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              SizedBox(height: 20),
              UI.generalLogo,
              SizedBox(height: 30),
              Text(
                "Yeni Nesil, Akıllı Randevu Danışmanı",
                textAlign: TextAlign.center,
                style: kTitleStyle,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                child: MenuSection(
                  Row(
                    children: [
                      // Icon(icon: buttonBehavior(isSelected)),
                      Container(
                        // width: MediaQuery.of(context).size.width / 3,
                        child: Text(
                          'Kuaför Randevumu Ayarla',
                          style: kTextStyle.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Colors.white,
                  Colors.white,
                  [
                    MenuItemData(label: 'Kadın'),
                    MenuItemData(label: 'Erkek'),
                    MenuItemData(label: 'Unisex'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
