import 'package:ayarla/api_services/api_services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FavoriteApiServices extends ApiServices {
  /// TODO sonra bakilacak
  Future createFavorite() async {
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
      headers: headersWithToken,
      body: body,
    );

    return await checkResponseStatus(
      successMessage: 'favori olusturuldu',
      response: response,
      returnData: response.statusCode == 200 ? jsonDecode(response.body)["result"] : jsonDecode(response.body),
    );
  }

  Future getFavorite({int id}) async {
    final String _url = '$baseUrl/api/services/app/Favorite/Get';

    http.Response response = await http.get(
      '$_url?Id=$id',
      headers: headersWithToken,
    );

    return await checkResponseStatus(
      successMessage: 'favori cagirildi',
      response: response,
      returnData: response.statusCode == 200 ? jsonDecode(response.body)["result"] : jsonDecode(response.body),
    );
  }

  Future getAllFavorite() async {
    final String _url = "$baseUrl/api/services/app/Favorite/GetAll";

    http.Response response = await http.get(
      _url,
      headers: headersWithToken,
    );

    ///TODO mesaj icerigini degistir
    return await checkResponseStatus(
      successMessage: 'GetAll is successful',
      response: response,
      returnData: response.statusCode == 200 ? jsonDecode(response.body)["result"]["items"] : jsonDecode(response.body),
    );
  }

  Future updateFavorite() async {
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
      headers: headersWithToken,
      body: body,
    );

    return await checkResponseStatus(
      successMessage: 'favori guncellendi',
      response: response,
      returnData: response.statusCode == 200 ? jsonDecode(response.body)["result"] : jsonDecode(response.body),
    );
  }

  Future deleteFavorite({String id}) async {
    final String _url = '$baseUrl/api/services/app/Favorite/Delete';

    http.Response response = await http.delete(
      '$_url?Id=$id',
      headers: headersWithToken,
    );
    return await checkResponseStatus(
      successMessage: 'kullanici silindi',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }
}
