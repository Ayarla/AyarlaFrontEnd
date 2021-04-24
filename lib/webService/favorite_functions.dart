import 'package:ayarla/webService/http_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpFavoriteFunctions extends HttpService {
  /// TODO sonra bakilacak
  Future createFavorite() async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Favorite/Create';

    var data = {
      "accountId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      "isDeleted": true,
      "deleterUserId": 0,
      "deletionTime": "2021-04-24T09:20:33.644Z",
      "lastModificationTime": "2021-04-24T09:20:33.644Z",
      "lastModifierUserId": 0,
      "creationTime": "2021-04-24T09:20:33.644Z",
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
      successMessage: 'favori olusturuldu',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future getFavorite({int id}) async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Favorite/Get';

    http.Response response = await http.get(
      '$_url?Id=$id',
      headers: headersWithAdminToken,
    );

    await checkResponseStatus(
      successMessage: 'favori cagirildi',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future getAllFavorite() async {
    await getToken();
    final String _url = "$baseUrl/api/services/app/Favorite/GetAll";

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

  Future updateFavorite() async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Favorite/Update';

    var data = {
      "accountId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      "userId": 0,
      "isDeleted": true,
      "deleterUserId": 0,
      "deletionTime": "2021-04-24T09:38:23.311Z",
      "lastModificationTime": "2021-04-24T09:38:23.311Z",
      "lastModifierUserId": 0,
      "creationTime": "2021-04-24T09:38:23.311Z",
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
      successMessage: 'favori guncellendi',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future deleteFavorite({String id}) async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Favorite/Delete';

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
}
