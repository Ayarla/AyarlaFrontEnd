import 'package:ayarla/webService/http_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpTenantFunctions extends HttpService {
  Future createTenant() async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Tenant/Create';

    var data = {
      "tenancyName": "string",
      "name": "string",
      "adminEmailAddress": "string",
      "connectionString": "string",
      "isActive": true
    };
    var body = jsonEncode(data);

    http.Response response = await http.post(
      _url,
      headers: headersWithAdminToken,
      body: body,
    );

    await checkResponseStatus(
      successMessage: 'tenant olusturuldu',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future deleteTenant({int id}) async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Tenant/Delete';

    http.Response response = await http.delete(
      '$_url?Id=$id',
      headers: headersWithAdminToken,
    );
    await checkResponseStatus(
      successMessage: 'tenant silindi',
      response: response,
      returnData: jsonEncode(response.body),
    );
  }

  Future getTenant({int id}) async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Tenant/Get';

    http.Response response = await http.get(
      '$_url?Id=$id',
      headers: headersWithAdminToken,
    );

    await checkResponseStatus(
      successMessage: 'tenant cagirildi',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future getAllTenant() async {
    await getToken();
    final String _url = "$baseUrl/api/services/app/Tenant/GetAll";

    http.Response response = await http.get(
      _url,
      headers: headersWithAdminToken,
    );

    ///TODO mesaj icerigini degistir
    await checkResponseStatus(
      successMessage: 'getAllTenant is successful',
      response: response,
      returnData: jsonDecode(response.body)["result"]["items"],
    );
  }

  Future updateTenant() async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Tenant/Update';

    var data = {
      "tenancyName": "string",
      "name": "string",
      "isActive": true,
      "id": 0
    };
    var body = jsonEncode(data);

    http.Response response = await http.put(
      _url,
      headers: headersWithAdminToken,
      body: body,
    );

    await checkResponseStatus(
      successMessage: 'tenant guncellendi',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }
}
