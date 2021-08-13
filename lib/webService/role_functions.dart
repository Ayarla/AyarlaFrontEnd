import 'package:ayarla/webService/http_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpRoleFunctions extends HttpService {
  Future createRole() async {
    final String _url = '$baseUrl/api/services/app/Role/Create';

    var data = {
      "name": "string",
      "displayName": "string",
      "normalizedName": "string",
      "description": "string",
      "grantedPermissions": ["string"]
    };
    var body = jsonEncode(data);

    http.Response response = await http.post(
      _url,
      headers: headersWithAdminToken,
      body: body,
    );

    await checkResponseStatus(
      successMessage: 'rol olusturuldu',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future getRoleWithPermission({String permission}) async {
    final String _url = '$baseUrl/api/services/app/Role/GetRoles';

    http.Response response = await http.get(
      '$_url?Id=$permission',
      headers: headersWithAdminToken,
    );

    await checkResponseStatus(
      successMessage: 'getRoleWithPermission is successful',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future updateRole() async {
    final String _url = '$baseUrl/api/services/app/Role/Update';

    var data = {
      "name": "string",
      "displayName": "string",
      "normalizedName": "string",
      "description": "string",
      "grantedPermissions": ["string"],
      "id": 0
    };
    var body = jsonEncode(data);

    http.Response response = await http.put(
      _url,
      headers: headersWithAdminToken,
      body: body,
    );

    await checkResponseStatus(
      successMessage: 'rol guncellendi',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future deleteRole({int id}) async {
    final String _url = '$baseUrl/api/services/app/Role/Delete';

    http.Response response = await http.delete(
      '$_url?Id=$id',
      headers: headersWithAdminToken,
    );
    await checkResponseStatus(
      successMessage: 'rol silindi',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future getAllPermissions() async {
    final String _url = "$baseUrl/api/services/app/Role/GetAllPermissions";

    http.Response response = await http.get(
      _url,
      headers: headersWithAdminToken,
    );

    ///TODO mesaj icerigini degistir
    await checkResponseStatus(
      successMessage: 'GetAllPermissions is successful',
      response: response,
      returnData: jsonDecode(response.body)["result"]["items"],
    );
  }

  Future getRoleForEdit({int id}) async {
    final String _url = "$baseUrl/api/services/app/Role/GetRoleForEdit";

    http.Response response = await http.get(
      '$_url?Id=$id',
      headers: headersWithAdminToken,
    );

    ///TODO mesaj icerigini degistir
    await checkResponseStatus(
      successMessage: 'getRoleForEdit is successful',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future getRoleWithId({int id}) async {
    final String _url = "$baseUrl/api/services/app/Role/Get";

    http.Response response = await http.get(
      '$_url?Id=$id',
      headers: headersWithAdminToken,
    );

    ///TODO mesaj icerigini degistir
    await checkResponseStatus(
      successMessage: 'getRoleWithId is successful',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future getAllRoles() async {
    final String _url = "$baseUrl/api/services/app/Role/GetAll";

    http.Response response = await http.get(
      _url,
      headers: headersWithAdminToken,
    );

    ///TODO mesaj icerigini degistir
    await checkResponseStatus(
      successMessage: 'getAllRoles is successful',
      response: response,
      returnData: jsonDecode(response.body)["result"]["items"],
    );
  }
}
