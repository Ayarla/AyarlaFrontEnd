import 'dart:convert';
import 'package:http/http.dart' as http;

   String _userToken = "";
   String _adminToken = "";
   String _accountToken = '';

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

    _adminToken = 'Bearer ' + jsonDecode(response.body)['result']['accessToken'];
    // print('ADMIN TOKEN : $_adminToken');

    if (response.statusCode == 200) {
      String data = response.body;
      print('Token Çekildi!');
      return jsonEncode(data);
    } else {
      /// server error message
      print(response.statusCode);
    }
  }

  /// Create User
  Future createUser() async {
    final String _url =
        'https://ayarlawebhost20210410115100.azurewebsites.net/api/services/app/User/Create';

    Map data = {
      "userName": "FatihOzkanATES12345",
      "name": "Fatih",
      "surname": "Ozkan",
      "emailAddress": "ozkanfatih377@gmail.com",
      "isActive": true,
      "roleNames": ["User"],
      "password": "fatih1998"
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
      print(response.body);
    }
  }

  /// Update User
  Future userUpdate() async {
  final String _url = 'http://localhost:21021/api/services/app/User/Update';

  Map data = {
    "userName": "string",
    "name": "string",
    "surname": "string",
    "emailAddress": "user@example.com",
    "isActive": true,
    "fullName": "string",
    "lastLoginTime": "2021-03-06T18:07:37.910Z",
    "creationTime": "2021-03-06T18:07:37.910Z",
    "roleNames": ["string"],
    "password": "string",
  };
  var body = json.encode(data);
  http.Response response = await http.put(_url,
      headers: <String, String>{
        'Authorization': _userToken,
        'Content-type': 'application/json; charset=utf-8',
      },
      body: body);
  if (response.statusCode == 200) {
    String data = response.body;
    print('kullanici guncellendi');
    return jsonEncode(data);
  } else {
    /// server error message
    var error = jsonDecode(response.body)['error']['message'];
    print(response.statusCode);
    print(error);
  }
}

  /// Delete User from database
  Future deleteUser(String id) async {
    final String _url = 'https://ayarlawebhost20210410115100.azurewebsites.net/api/services/app/User/Delete';

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

  Future getUser(id) async {
    int _id = id;
    String _url = 'https://ayarlawebhost20210410115100.azurewebsites.net/api/services/app/User/Get';

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

  Future getAll() async {
    String _url="https://ayarlawebhost20210410115100.azurewebsites.net/api/services/app/User/GetAll";

    http.Response response = await http.get(
      '$_url',
      headers: <String, String>{
        'Authorization': _adminToken,
        'Content-type': 'application/json; charset=utf-8',
      },
    );
    if (response.statusCode == 200) {
      String data = response.body;
      print('GetAll is successful');
      return jsonDecode(data)["result"]["items"];
    } else {
      /// server error message
      var error = jsonDecode(response.body)['error']['message'];
      print(response.statusCode);
      print(error);
    }
  }
