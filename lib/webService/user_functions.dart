import 'dart:convert';
import 'package:ayarla/webService/http_service.dart';
import 'package:http/http.dart' as http;

class HttpUserFunctions extends HttpService {
  /// Create User
  Future createUser(
      {String userName,
      String name,
      String surname,
      String email,
      String password}) async {
    await getToken();
    final String _url = '$baseUrl}/api/services/app/User/Create';

    Map data = {
      "userName": userName,
      "name": name,
      "surname": surname,
      "emailAddress": email,
      "isActive": true,
      "roleNames": ["User"],
      "password": password
    };
    var body = json.encode(data);

    http.Response response = await http.post(
      _url,
      headers: headersWithAdminToken,
      body: body,
    );

    await checkResponseStatus(
      successMessage: 'kullanici olusturuldu',
      response: response,
      returnData: jsonEncode(response.body),
    );
  }

  /// Update User
  Future updateUser(
      {int id,
      String userName,
      String name,
      String surname,
      String email,
      String password}) async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/User/Update';

    Map data = {
      "id": id,
      "userName": userName,
      "name": name,
      "surname": surname,
      "emailAddress": email,
      "isActive": true,
      "roleNames": ["User"],
      "password": password,
    };
    var body = json.encode(data);

    http.Response response = await http.put(
      _url,
      headers: headersWithAdminToken,
      body: body,
    );

    await checkResponseStatus(
      successMessage: 'kullanici guncellendi',
      response: response,
      returnData: jsonEncode(response.body),
    );
  }

  /// Delete User from database
  Future deleteUser({int id}) async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/User/Delete';

    http.Response response = await http.delete(
      '$_url?Id=$id',
      headers: headersWithAdminToken,
    );
    await checkResponseStatus(
      successMessage: 'kullanici silindi',
      response: response,
      returnData: jsonEncode(response.body),
    );
  }

  Future activateUser({int id}) async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/User/Activate';

    var data = {"id": id};
    var body = json.encode(data);

    http.Response response = await http.post(
      _url,
      headers: headersWithAdminToken,
      body: body,
    );
    await checkResponseStatus(
      successMessage: 'kullanici aktiflestirildi',
      response: response,
      returnData: jsonEncode(response.body),
    );
  }

  Future deactivateUser({int id}) async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/User/DeActivate';

    var data = {"id": id};
    var body = json.encode(data);

    http.Response response = await http.post(
      _url,
      headers: headersWithAdminToken,
      body: body,
    );
    await checkResponseStatus(
      successMessage: 'kullanici pasiflestirildi',
      response: response,
      returnData: jsonEncode(response.body),
    );
  }

  Future getRolesUser() async {
    await getToken();
    final String _url = "$baseUrl/api/services/app/User/GetRoles";

    http.Response response = await http.get(
      _url,
      headers: headersWithAdminToken,
    );

    ///TODO mesaj icerigini degistir
    await checkResponseStatus(
      successMessage: 'GetRoles is successful',
      response: response,
      returnData: jsonDecode(response.body)["result"]["items"],
    );
  }

  Future changeLanguage({String language}) async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/User/ChangeLanguage';

    var data = {"languageName": language};
    var body = json.encode(data);

    http.Response response = await http.post(
      _url,
      headers: headersWithAdminToken,
      body: body,
    );

    await checkResponseStatus(
      successMessage: 'dil degistirildi',
      response: response,
      returnData: jsonEncode(response.body),
    );
  }

  Future changeUserPassword(
      {String newPassword, String currentPassword}) async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/User/ChangePassword';

    var data = {"currentPassword": currentPassword, "newPassword": newPassword};
    var body = json.encode(data);

    http.Response response = await http.post(
      _url,
      headers: headersWithAdminToken,
      body: body,
    );
    await checkResponseStatus(
      successMessage: 'kullanici sifresi degistirildi',
      response: response,
      returnData: jsonEncode(response.body),
    );
  }

  Future resetUserPassword({int userId, String newPassword}) async {
    await getToken();
    final String _url = "$baseUrl/api/services/app/User/ResetPassword";

    var data = {
      "adminPassword": "123qwe",
      "userId": userId,
      "newPassword": newPassword,
    };
    var body = json.encode(data);

    http.Response response = await http.post(
      _url,
      headers: headersWithAdminToken,
      body: body,
    );
    await checkResponseStatus(
      successMessage: 'kullanici sifresi sifirlandi',
      response: response,
      returnData: jsonEncode(response.body),
    );
  }

  Future getUser({int id}) async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/User/Get';

    http.Response response = await http.get(
      '$_url?Id=$id',
      headers: headersWithAdminToken,
    );
    var responseBody = await checkResponseStatus(
      successMessage: 'kullanici cagirildi',
      response: response,
      returnData: jsonEncode(response.body),
    );
    print(responseBody);
  }

  Future getAllUser() async {
    await getToken();
    final String _url = "$baseUrl/api/services/app/User/GetAll";

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
}
