import 'package:ayarla/models/model_appointment.dart';
import 'package:ayarla/webService/http_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// var data = {
//
//   /// Olds
//   // "dayTime": dayTime,
//   // // "dayTime": "2021-04-24T10:14:39.160Z",

//   // "userId": 0,
//   // "accountId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
//   // "employeeId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
//   "dayTime": appointment.dateTime.toString(),
//   "services": appointment.appointmentDetails.map((e) => e.appointmentModelToJson()),
//   "totalPrice": appointment.totalPrice,
// };

class HttpAppointmentFunctions extends HttpService {
  Future createAppointment({Appointment appointment}) async {
    final String _url = '$baseUrl/api/services/app/Appoinment/Create';

    /// TODO: fix & test.
    var data = appointment.appointmentToJson();
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

  /// TODO: return
  Future getAppointment({String id}) async {
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
    return jsonDecode(response.body)["result"];
  }

  Future getAllAppointment() async {
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

    await checkResponseStatus(
      successMessage: 'randevu guncellendi',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future deleteAppointment({String id}) async {
    final String _url = '$baseUrl/api/services/app/Appoinment/Delete';

    http.Response response = await http.delete(
      '$_url?Id=$id',
      headers: headersWithAdminToken,
    );
    await checkResponseStatus(
      successMessage: 'randevu silindi',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }
}
