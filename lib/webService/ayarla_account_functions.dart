import 'package:ayarla/webService/http_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpAyarlaAccountFunctions extends HttpService {
  Future getAyarlaAccount({String id}) async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/AyarlaAccount/Get';

    http.Response response = await http.get(
      '$_url?Id=$id',
      headers: headersWithAdminToken,
    );

    await checkResponseStatus(
      successMessage: 'Ayarla hesabi cagirildi',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future getAllAyarlaAccount() async {
    await getToken();
    final String _url = "$baseUrl/api/services/app/AyarlaAccount/GetAll";

    http.Response response = await http.get(
      _url,
      headers: headersWithAdminToken,
    );

    ///TODO mesaj icerigini degistir
    await checkResponseStatus(
      successMessage: 'GetAll is successful',
      response: response,
      returnData: jsonDecode(response.body)["result"]["items"],
    );
  }

  Future createAyarlaAccount() async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/AyarlaAccount/Create';

    /// 1 for male , 2 female (gender)
    var data = {
      "phone1": "string",
      "phone2": "string",
      "phone3": "string",
      "accountName": "string",
      "accountImage": "string",
      "accountTypes": [
        {
          "gender": 1,
        }
      ],
      "accountNotes": "string",
      "addressDetail": "string",
      "district": "string",
      "city": "string",
      "openCloseTimes": [
        {
          "dayOfTheWeek": "string",
          "accountWorkStartTime": "string",
          "accountWorkEndTime": "string",
        }
      ],
      "location": "string",
      "timePeriod": 0,
    };
    var body = jsonEncode(data);

    http.Response response = await http.post(
      _url,
      headers: headersWithAdminToken,
      body: body,
    );

    await checkResponseStatus(
      successMessage: 'Ayarla hesabi olusturuldu',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future updateAyarlaAccount() async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/AyarlaAccount/Update';

    var data = {
      "phone1": "string",
      "phone2": "string",
      "phone3": "string",
      "accountName": "string",
      "accountImage": "string",
      "accountTypes": [
        {
          "gender": 1,
        }
      ],
      "accountNotes": "string",
      "addressDetail": "string",
      "district": "string",
      "city": "string",
      "openCloseTimes": [
        {
          "dayOfTheWeek": "string",
          "accountWorkStartTime": "string",
          "accountWorkEndTime": "string",
        }
      ],
      "location": "string",
      "timePeriod": 0,
    };
    var body = jsonEncode(data);

    http.Response response = await http.put(
      _url,
      headers: headersWithAdminToken,
      body: body,
    );

    await checkResponseStatus(
      successMessage: 'Ayarla hesabi guncellendi',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future deleteAyarlaAccount({String id}) async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/AyarlaAccount/Delete';

    http.Response response = await http.delete(
      '$_url?Id=$id',
      headers: headersWithAdminToken,
    );
    await checkResponseStatus(
      successMessage: 'Ayarla hesabi silindi',
      response: response,
      returnData: jsonEncode(response.body),
    );
  }
}
