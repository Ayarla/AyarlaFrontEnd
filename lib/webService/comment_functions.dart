import 'package:ayarla/webService/http_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpCommentFunctions extends HttpService {
  Future createComment() async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Comment/Create';

    var data = {
      "comment": "string",
      "accountId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      "rating": 0,
      "isDeleted": true,
      "deleterUserId": 0,
      "deletionTime": "2021-04-24T09:45:38.564Z",
      "lastModificationTime": "2021-04-24T09:45:38.564Z",
      "lastModifierUserId": 0,
      "creationTime": "2021-04-24T09:45:38.564Z",
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
      successMessage: 'yorum olusturuldu',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future getComment({String id}) async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Comment/Get';

    http.Response response = await http.get(
      '$_url?Id=$id',
      headers: headersWithAdminToken,
    );

    await checkResponseStatus(
      successMessage: 'yorum cagirildi',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future getAllComment() async {
    await getToken();
    final String _url = "$baseUrl/api/services/app/Comment/GetAll";

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

  Future updateComment() async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Comment/Update';

    var data = {
      "userId": 0,
      "comment": "string",
      "accountId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      "rating": 0,
      "isDeleted": true,
      "deleterUserId": 0,
      "deletionTime": "2021-04-24T09:52:03.803Z",
      "lastModificationTime": "2021-04-24T09:52:03.803Z",
      "lastModifierUserId": 0,
      "creationTime": "2021-04-24T09:52:03.803Z",
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
      successMessage: 'yorum guncellendi',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future deleteComment({String id}) async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Comment/Delete';

    http.Response response = await http.delete(
      '$_url?Id=$id',
      headers: headersWithAdminToken,
    );
    await checkResponseStatus(
      successMessage: 'yorum silindi',
      response: response,
      returnData: jsonEncode(response.body),
    );
  }
}
