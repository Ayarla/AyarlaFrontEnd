import 'package:ayarla/api_services/api_services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppointmentApiServices extends ApiServices {
  Future createAppointment({String dayTime}) async {
    final String _url = '$baseUrl/api/services/app/Appoinment/Create';

    /// TODO: fix & test.
    var data = appointment.appointmentToJson();
    var body = jsonEncode(data);

    http.Response response = await http.post(
      _url,
      headers: headersWithAdminToken,
      body: body,
    );

    return await checkResponseStatus(
      successMessage: 'randevu olusturuldu',
      response: response,
      returnData: response.statusCode == 200
          ? jsonDecode(response.body)["result"]
          : jsonDecode(response.body),
    );
  }

  Future getAppointment({String id}) async {
    final String _url = '$baseUrl/api/services/app/Appoinment/Get';

    http.Response response = await http.get(
      '$_url?Id=$id',
      headers: headersWithAdminToken,
    );

    return await checkResponseStatus(
      successMessage: 'randevu cagirildi',
      response: response,
      returnData: response.statusCode == 200
          ? jsonDecode(response.body)["result"]
          : jsonDecode(response.body),
    );
  }

  Future getAllAppointment() async {
    final String _url = "$baseUrl/api/services/app/Appoinment/GetAll";

    http.Response response = await http.get(
      _url,
      headers: headersWithAdminToken,
    );

    ///TODO mesaj icerigini degistir
    return await checkResponseStatus(
      successMessage: 'GetAll is successful',
      response: response,
      returnData: response.statusCode == 200
          ? jsonDecode(response.body)["result"]["items"]
          : jsonDecode(response.body),
    );
  }

  Future updateAppointment({int userId, String dayTime}) async {
    final String _url = '$baseUrl/api/services/app/Appoinment/Update';

    var data = {
      "userId": userId,
      "dayTime": dayTime,
      // "dayTime": "2021-04-24T10:19:00.641Z",
    };
    var body = jsonEncode(data);

    http.Response response = await http.put(
      _url,
      headers: headersWithAdminToken,
      body: body,
    );

    return await checkResponseStatus(
      successMessage: 'randevu guncellendi',
      response: response,
      returnData: response.statusCode == 200
          ? jsonDecode(response.body)["result"]
          : jsonDecode(response.body),
    );
  }

  Future deleteAppointment({String id}) async {
    final String _url = '$baseUrl/api/services/app/Appoinment/Delete';

    http.Response response = await http.delete(
      '$_url?Id=$id',
      headers: headersWithAdminToken,
    );
    return await checkResponseStatus(
      successMessage: 'randevu silindi',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }
}
