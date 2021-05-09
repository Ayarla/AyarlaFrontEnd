import 'package:ayarla/webService/http_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpEmployeeFunctions extends HttpService {
  Future getEmployee({String id}) async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Employee/Get';

    http.Response response = await http.get(
      '$_url?Id=$id',
      headers: headersWithAdminToken,
    );

    await checkResponseStatus(
      successMessage: 'calisan cagirildi',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future getAllEmployee() async {
    await getToken();
    final String _url = "$baseUrl/api/services/app/Employee/GetAll";

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

  Future createEmployee() async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Employee/Create';

    var data = {
      "gsm": "string",
      "employeeImage": "string",
      "notes": "string",
      "gender": 1,
      "employeeAccounts": [
        {
          "phone1": "string",
          "phone2": "string",
          "phone3": "string",
          "email": "string",
          "password": "string",
          "accountName": "string",
          "accountImage": "string",
          "accountNotes": "string",
          "addressDetail": "string",
          "district": "string",
          "city": "string",
          "commentId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "openCloseTimeId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "location": "string",
          "timePeriod": 0,
          "deletionTime": "2021-04-24T09:58:44.562Z",
          "lastModificationTime": "2021-04-24T09:58:44.562Z",
          "lastModifierUserId": 0,
          "creationTime": "2021-04-24T09:58:44.562Z",
          "creatorUserId": 0,
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
        }
      ],
      "employeeAvailabilities": [
        {
          "availability": true,
          "isDeleted": true,
          "deleterUserId": 0,
          "deletionTime": "2021-04-24T09:58:44.562Z",
          "lastModificationTime": "2021-04-24T09:58:44.562Z",
          "lastModifierUserId": 0,
          "creationTime": "2021-04-24T09:58:44.562Z",
          "creatorUserId": 0,
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
        }
      ],
      "employeeServices": [
        {
          "service": "string",
          "price": 0,
          "serviceTime": 0,
          "isDeleted": true,
          "deleterUserId": 0,
          "deletionTime": "2021-04-24T09:58:44.562Z",
          "lastModificationTime": "2021-04-24T09:58:44.562Z",
          "lastModifierUserId": 0,
          "creationTime": "2021-04-24T09:58:44.562Z",
          "creatorUserId": 0,
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
        }
      ],
      "serviceTypes": [
        {
          "type": 1,
          "isDeleted": true,
          "deleterUserId": 0,
          "deletionTime": "2021-04-24T09:58:44.562Z",
          "lastModificationTime": "2021-04-24T09:58:44.562Z",
          "lastModifierUserId": 0,
          "creationTime": "2021-04-24T09:58:44.562Z",
          "creatorUserId": 0,
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
        }
      ],
      "workingDays": [
        {
          "days": "string",
          "isDeleted": true,
          "deleterUserId": 0,
          "deletionTime": "2021-04-24T09:58:44.562Z",
          "lastModificationTime": "2021-04-24T09:58:44.562Z",
          "lastModifierUserId": 0,
          "creationTime": "2021-04-24T09:58:44.562Z",
          "creatorUserId": 0,
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
        }
      ],
      "workTimes": [
        {
          "accountId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "dayOfTheWeek": "string",
          "employeeWorkStartTime": {},
          "employeeWorkEndTime": {},
          "isDeleted": true,
          "deleterUserId": 0,
          "deletionTime": "2021-04-24T09:58:44.562Z",
          "lastModificationTime": "2021-04-24T09:58:44.562Z",
          "lastModifierUserId": 0,
          "creationTime": "2021-04-24T09:58:44.562Z",
          "creatorUserId": 0,
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
        }
      ],
      "isDeleted": true,
      "deleterUserId": 0,
      "deletionTime": "2021-04-24T09:58:44.562Z",
      "lastModificationTime": "2021-04-24T09:58:44.562Z",
      "lastModifierUserId": 0,
      "creationTime": "2021-04-24T09:58:44.562Z",
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
      successMessage: 'calisan olusturuldu',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future updateEmployee() async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Employee/Update';

    var data = {
      "gsm": "string",
      "employeeImage": "string",
      "notes": "string",
      "gender": 1,
      "employeeAccounts": [
        {
          "phone1": "string",
          "phone2": "string",
          "phone3": "string",
          "email": "string",
          "password": "string",
          "accountName": "string",
          "accountImage": "string",
          "accountTypeId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "accountNotes": "string",
          "addressDetail": "string",
          "district": "string",
          "city": "string",
          "commentId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "openCloseTimeId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "location": "string",
          "timePeriod": 0,
          "isDeleted": true,
          "deleterUserId": 0,
          "deletionTime": "2021-04-24T10:00:38.267Z",
          "lastModificationTime": "2021-04-24T10:00:38.267Z",
          "lastModifierUserId": 0,
          "creationTime": "2021-04-24T10:00:38.267Z",
          "creatorUserId": 0,
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
        }
      ],
      "employeeAvailabilities": [
        {
          "availability": true,
          "isDeleted": true,
          "deleterUserId": 0,
          "deletionTime": "2021-04-24T10:00:38.267Z",
          "lastModificationTime": "2021-04-24T10:00:38.267Z",
          "lastModifierUserId": 0,
          "creationTime": "2021-04-24T10:00:38.267Z",
          "creatorUserId": 0,
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
        }
      ],
      "employeeServices": [
        {
          "service": "string",
          "price": 0,
          "serviceTime": 0,
          "isDeleted": true,
          "deleterUserId": 0,
          "deletionTime": "2021-04-24T10:00:38.267Z",
          "lastModificationTime": "2021-04-24T10:00:38.267Z",
          "lastModifierUserId": 0,
          "creationTime": "2021-04-24T10:00:38.267Z",
          "creatorUserId": 0,
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
        }
      ],
      "serviceTypes": [
        {
          "type": 1,
          "isDeleted": true,
          "deleterUserId": 0,
          "deletionTime": "2021-04-24T10:00:38.267Z",
          "lastModificationTime": "2021-04-24T10:00:38.267Z",
          "lastModifierUserId": 0,
          "creationTime": "2021-04-24T10:00:38.267Z",
          "creatorUserId": 0,
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
        }
      ],
      "workingDays": [
        {
          "days": "string",
          "isDeleted": true,
          "deleterUserId": 0,
          "deletionTime": "2021-04-24T10:00:38.267Z",
          "lastModificationTime": "2021-04-24T10:00:38.267Z",
          "lastModifierUserId": 0,
          "creationTime": "2021-04-24T10:00:38.267Z",
          "creatorUserId": 0,
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
        }
      ],
      "workTimes": [
        {
          "accountId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "dayOfTheWeek": "string",
          "employeeWorkStartTime": {},
          "employeeWorkEndTime": {},
          "isDeleted": true,
          "deleterUserId": 0,
          "deletionTime": "2021-04-24T10:00:38.267Z",
          "lastModificationTime": "2021-04-24T10:00:38.267Z",
          "lastModifierUserId": 0,
          "creationTime": "2021-04-24T10:00:38.267Z",
          "creatorUserId": 0,
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
        }
      ],
      "isDeleted": true,
      "deleterUserId": 0,
      "deletionTime": "2021-04-24T10:00:38.267Z",
      "lastModificationTime": "2021-04-24T10:00:38.267Z",
      "lastModifierUserId": 0,
      "creationTime": "2021-04-24T10:00:38.267Z",
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
      successMessage: 'calisan guncellendi',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }

  Future deleteEmployee({String id}) async {
    await getToken();
    final String _url = '$baseUrl/api/services/app/Employee/Delete';

    http.Response response = await http.delete(
      '$_url?Id=$id',
      headers: headersWithAdminToken,
    );
    await checkResponseStatus(
      successMessage: 'calisan silindi',
      response: response,
      returnData: jsonDecode(response.body),
    );
  }
}
