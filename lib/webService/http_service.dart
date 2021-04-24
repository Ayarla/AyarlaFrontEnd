import 'dart:convert';
import 'package:http/http.dart' as http;

String _userToken = "";
String _adminToken = "";
String _accountToken = "";
final String baseUrl = 'https://ayarlawebhost20210410115100.azurewebsites.net';

class HttpService {
  Map<String, String> headersWithAdminToken = {
    'Authorization': _adminToken,
    'Content-type': 'application/json; charset=utf-8',
  };

  Map<String, String> headersWithUserToken = {
    'Authorization': _userToken,
    'Content-type': 'application/json; charset=utf-8',
  };

  Map<String, String> headersWithAccountToken = {
    'Authorization': _accountToken,
    'Content-type': 'application/json; charset=utf-8',
  };

  Future<String> checkResponseStatus(
      {String successMessage, http.Response response, var returnData}) async {
    if (response.statusCode == 200) {
      print(successMessage);
      return returnData;
    } else {
      /// server error message
      var error = jsonDecode(response.body)['error']['message'];
      print(response.statusCode);
      print(error);
      return null;
    }
  }

  Future getToken() async {
    final String _url = '$baseUrl/api/TokenAuth/Authenticate';

    Map data = {
      "userNameOrEmailAddress": "admin",
      "password": "123qwe",
      "rememberClient": true
    };
    var body = json.encode(data);

    http.Response response = await http.post(
      _url,
      headers: headersWithAdminToken,
      body: body,
    );

    _adminToken =
        'Bearer ' + jsonDecode(response.body)['result']['accessToken'];
    // print('ADMIN TOKEN : $_adminToken');

    await checkResponseStatus(
      successMessage: 'Token Çekildi!',
      response: response,
      returnData: jsonEncode(response.body),
    );
  }
}
