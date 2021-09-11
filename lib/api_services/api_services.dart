import 'dart:convert';
import 'package:http/http.dart' as http;

String _token;
String _adminToken;

Map<String, String> headersWithAdminToken = {
  'Authorization': _adminToken,
  'Content-type': 'application/json; charset=utf-8',
};

Map<String, String> headersWithToken = {
  'Authorization': _token,
  'Content-type': 'application/json; charset=utf-8',
};

class ApiServices {
  final String baseUrl = 'https://ayarlawebhost2021041011510.azurewebsites.net';

  Future getAdminToken() async {
    final String _url = '$baseUrl/api/TokenAuth/Authenticate';

    Map data = {"userNameOrEmailAddress": "admin", "password": "123qwe", "rememberClient": true};
    var body = json.encode(data);

    http.Response response = await http.post(
      _url,
      headers: {
        'Content-type': 'application/json; charset=utf-8',
      },
      body: body,
    );

    _adminToken = 'Bearer ' + jsonDecode(response.body)['result']['accessToken'];
    print('ADMIN TOKEN : $_adminToken');

    return await checkResponseStatus(
      successMessage: 'Admin Token cekildi!',
      response: response,
      returnData: response.statusCode == 200
          ? jsonDecode(response.body)["result"]
          : jsonDecode(response.body),
    );
  }

  Future authenticate({String userNameOrEmailAddress, String password, bool rememberClient}) async {
    final String _url = '$baseUrl/api/TokenAuth/Authenticate';

    Map data = {
      "userNameOrEmailAddress": userNameOrEmailAddress,
      "password": password,
      "rememberClient": rememberClient
    };
    var body = json.encode(data);

    http.Response response = await http.post(
      _url,
      headers: {
        'Content-type': 'application/json; charset=utf-8',
      },
      body: body,
    );

    _token = 'Bearer ' + jsonDecode(response.body)['result']['accessToken'];
    print('TOKEN : $_token');

    return await checkResponseStatus(
      successMessage: 'Giris yapildi!',
      response: response,
      returnData: response.statusCode == 200
          ? jsonDecode(response.body)["result"]
          : jsonDecode(response.body),
    );
  }

  Future checkResponseStatus(
      {String successMessage, http.Response response, var returnData}) async {
    if (response.statusCode == 200) {
      print(successMessage);
      return returnData;
    } else {
      /// server error message
      var error = returnData['error']['message'];
      print(response.statusCode.toString() + " : " + error);
      return throw Exception(response.statusCode.toString() + " => " + error);
    }
  }
}
