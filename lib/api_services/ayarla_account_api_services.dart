import 'package:ayarla/models/model_coiffure.dart';
import 'package:ayarla/api_services/api_services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AyarlaAccountApiServices extends ApiServices {
  Future getAyarlaAccount({String id}) async {
    final String _url = '$baseUrl/api/services/app/AyarlaAccount/Get';
    var content;
    http.Response response = await http.get(
      '$_url?Id=$id',
      headers: headersWithAdminToken,
    );

    return await checkResponseStatus(
      successMessage: 'Ayarla hesabi cagirildi',
      response: response,
      returnData: response.statusCode == 200 ? jsonDecode(response.body)["result"] : jsonDecode(response.body),
    );
    // if (response.statusCode == 200) {
    //   return content;
    // } else {
    //   return null;
    // }
  }

  Future getAllAyarlaAccount() async {
    final String _url = "$baseUrl/api/services/app/AyarlaAccount/GetAll";

    /// TODO - fix.
    await ApiServices().getToken();
    http.Response response = await http.get(
      _url,
      headers: headersWithAdminToken,
    );

    ///TODO mesaj icerigini degistir
    return await checkResponseStatus(
      successMessage: 'GetAll is successful',
      response: response,
      returnData: response.statusCode == 200 ? jsonDecode(response.body)["result"]["items"] : jsonDecode(response.body),
    );
    // print(jsonDecode(response.body)["result"]["items"]);
    return jsonDecode(response.body)["result"]["items"];
  }

  Future createAyarlaAccount({CoiffureModel coiffureModel}) async {
    final String _url = '$baseUrl/api/services/app/AyarlaAccount/Create';

    /// 1 for male , 2 female (gender)
    var data = {
      "phone1": coiffureModel.telephone,
      "phone2": "string",
      "phone3": "string",
      "accountName": coiffureModel.name,
      "accountImage": "string",
      "accountTypes": [
        {
          "gender": 1,
        }
      ],
      "accountNotes": "string",
      "addressDetail": coiffureModel.address,
      "district": coiffureModel.district,
      "city": coiffureModel.city,
      "openCloseTimes": [
        {
          "dayOfTheWeek": "string",
          "accountWorkStartTime": "string",
          "accountWorkEndTime": "string",
        }
      ],
      "location": "string",
      "timePeriod": 0,
    };
    var body = jsonEncode(data);

    http.Response response = await http.post(
      _url,
      headers: headersWithAdminToken,
      body: body,
    );

    return await checkResponseStatus(
      successMessage: 'Ayarla hesabi olusturuldu',
      response: response,
      returnData: response.statusCode == 200 ? jsonDecode(response.body)["result"] : jsonDecode(response.body),
    );
  }

  Future updateAyarlaAccount({CoiffureModel coiffureModel}) async {
    final String _url = '$baseUrl/api/services/app/AyarlaAccount/Update';

    var data = {
      "phone1": coiffureModel.telephone,
      "phone2": "string",
      "phone3": "string",
      "accountName": coiffureModel.name,
      "accountImage": "string",
      "accountTypes": [
        {
          "gender": 1,
        }
      ],
      "accountNotes": "string",
      "addressDetail": coiffureModel.address,
      "district": coiffureModel.district,
      "city": coiffureModel.city,
      "openCloseTimes": [
        {
          "dayOfTheWeek": "string",
          "accountWorkStartTime": "string",
          "accountWorkEndTime": "string",
        }
      ],
      "location": "string",
      "timePeriod": 0,
    };
    var body = jsonEncode(data);

    http.Response response = await http.put(
      _url,
      headers: headersWithAdminToken,
      body: body,
    );

    return await checkResponseStatus(
      successMessage: 'Ayarla hesabi guncellendi',
      response: response,
      returnData: response.statusCode == 200 ? jsonDecode(response.body)["result"] : jsonDecode(response.body),
    );
  }

  Future deleteAyarlaAccount({String id}) async {
    final String _url = '$baseUrl/api/services/app/AyarlaAccount/Delete';

    http.Response response = await http.delete(
      '$_url?Id=$id',
      headers: headersWithAdminToken,
    );
    return await checkResponseStatus(
        successMessage: 'Ayarla hesabi silindi', response: response, returnData: jsonDecode(response.body));
  }
}
