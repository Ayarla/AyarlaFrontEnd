import 'package:ayarla/webService/http_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpConfigurationFunctions extends HttpService {
  Future changeUITheme() async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Configuration/ChangeUiTheme';

    var data = {"theme": "string"};
    var body = jsonEncode(data);

    http.Response response = await http.post(
      _url,
      headers: headersWithAdminToken,
      body: body,
    );

    await checkResponseStatus(
      successMessage: 'arayuz temasi degistirildi',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }
}
