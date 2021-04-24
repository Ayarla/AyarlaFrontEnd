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

    var data = {
      "phone1": "string",
      "phone2": "string",
      "phone3": "string",
      "accountName": "string",
      "accountImage": "string",
      "accountTypes": [
        {
          "gender": 1,
          "isDeleted": true,
          "deleterUserId": 0,
          "deletionTime": "2021-04-24T10:08:36.193Z",
          "lastModificationTime": "2021-04-24T10:08:36.193Z",
          "lastModifierUserId": 0,
          "creationTime": "2021-04-24T10:08:36.193Z",
          "creatorUserId": 0,
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
        }
      ],
      "accountNotes": "string",
      "addressDetail": "string",
      "district": "string",
      "city": "string",
      "openCloseTimes": [
        {
          "accountId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "dayOfTheWeek": "string",
          "accountWorkStartTime": "string",
          "accountWorkEndTime": "string",
          "isDeleted": true,
          "deleterUserId": 0,
          "deletionTime": "2021-04-24T10:08:36.193Z",
          "lastModificationTime": "2021-04-24T10:08:36.193Z",
          "lastModifierUserId": 0,
          "creationTime": "2021-04-24T10:08:36.193Z",
          "creatorUserId": 0,
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
        }
      ],
      "location": "string",
      "timePeriod": 0,
      "isDeleted": true,
      "deleterUserId": 0,
      "deletionTime": "2021-04-24T10:08:36.193Z",
      "lastModificationTime": "2021-04-24T10:08:36.193Z",
      "lastModifierUserId": 0,
      "creationTime": "2021-04-24T10:08:36.193Z",
      "creatorUserId": 0,
      "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
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
          "isDeleted": true,
          "deleterUserId": 0,
          "deletionTime": "2021-04-24T10:10:04.490Z",
          "lastModificationTime": "2021-04-24T10:10:04.490Z",
          "lastModifierUserId": 0,
          "creationTime": "2021-04-24T10:10:04.490Z",
          "creatorUserId": 0,
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
        }
      ],
      "accountNotes": "string",
      "addressDetail": "string",
      "district": "string",
      "city": "string",
      "openCloseTimes": [
        {
          "accountId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "dayOfTheWeek": "string",
          "accountWorkStartTime": "string",
          "accountWorkEndTime": "string",
          "isDeleted": true,
          "deleterUserId": 0,
          "deletionTime": "2021-04-24T10:10:04.490Z",
          "lastModificationTime": "2021-04-24T10:10:04.490Z",
          "lastModifierUserId": 0,
          "creationTime": "2021-04-24T10:10:04.490Z",
          "creatorUserId": 0,
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
        }
      ],
      "location": "string",
      "timePeriod": 0,
      "isDeleted": true,
      "deleterUserId": 0,
      "deletionTime": "2021-04-24T10:10:04.490Z",
      "lastModificationTime": "2021-04-24T10:10:04.490Z",
      "lastModifierUserId": 0,
      "creationTime": "2021-04-24T10:10:04.490Z",
      "creatorUserId": 0,
      "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
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
