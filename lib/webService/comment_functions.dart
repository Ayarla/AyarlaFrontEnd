import 'package:ayarla/models/model_comment.dart';
import 'package:ayarla/webService/http_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpCommentFunctions extends HttpService {
  Future createComment({CommentModel commentModel}) async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Comment/Create';

    var data = {
      "comment": commentModel.comment,
      "rating": commentModel.rating,
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

  Future updateComment({CommentModel commentModel, int userId}) async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Comment/Update';

    var data = {
      "userId": userId,
      "comment": commentModel.comment,
      "rating": commentModel.rating,
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
      returnData: jsonDecode(response.body),
    );
  }
}
