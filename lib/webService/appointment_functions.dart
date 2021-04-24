import 'package:ayarla/webService/http_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpAppointmentFunctions extends HttpService {
  Future createAppointment() async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Appoinment/Create';

    var data = {
      "dayTime": "2021-04-24T10:14:39.160Z",
    };
    var body = jsonEncode(data);

    http.Response response = await http.post(
      _url,
      headers: headersWithAdminToken,
      body: body,
    );

    await checkResponseStatus(
      successMessage: 'randevu olusturuldu',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future getAppointment({String id}) async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Appoinment/Get';

    http.Response response = await http.get(
      '$_url?Id=$id',
      headers: headersWithAdminToken,
    );

    await checkResponseStatus(
      successMessage: 'randevu cagirildi',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future getAllAppointment() async {
    await getToken();
    final String _url = "$baseUrl/api/services/app/Appoinment/GetAll";

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

  Future updateAppointment() async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Appoinment/Update';

    var data = {
      "employeeId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      "userId": 0,
      "dayTime": "2021-04-24T10:19:00.641Z",
      "serviceId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      "isDeleted": true,
      "deleterUserId": 0,
      "deletionTime": "2021-04-24T10:19:00.641Z",
      "lastModificationTime": "2021-04-24T10:19:00.641Z",
      "lastModifierUserId": 0,
      "creationTime": "2021-04-24T10:19:00.641Z",
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
      successMessage: 'randevu guncellendi',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future deleteAppointment({String id}) async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Appoinment/Delete';

    http.Response response = await http.delete(
      '$_url?Id=$id',
      headers: headersWithAdminToken,
    );
    await checkResponseStatus(
      successMessage: 'randevu silindi',
      response: response,
      returnData: jsonEncode(response.body),
    );
  }
}
