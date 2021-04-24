// import 'package:ayarla/webService/http_service.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class HttpAccountFunctions extends HttpService {
//   /// TODO sorulacak
//   Future isTenantAvailable() async {
//     await getToken();
//     final String _url = '$baseUrl/api/services/app/Account/IsTenantAvailable';
//
//     var data = {"tenancyName": "string"};
//     var body = jsonEncode(data);
//
//     http.Response response = await http.post(
//       _url,
//       headers: headersWithAdminToken,
//       body: body,
//     );
//
//     await checkResponseStatus(
//       successMessage: 'isTenantAvailable is successful',
//       response: response,
//       returnData: jsonDecode(response.body),
//     );
//   }
//
//   /// TODO sorulacak
//   Future register() async {
//     await getToken();
//     final String _url = '$baseUrl/api/services/app/Account/Register';
//
//     var data = {
//       "name": "string",
//       "surname": "string",
//       "userName": "string",
//       "emailAddress": "user@example.com",
//       "password": "string",
//       "captchaResponse": "string"
//     };
//     var body = jsonEncode(data);
//
//     http.Response response = await http.post(
//       _url,
//       headers: headersWithAdminToken,
//       body: body,
//     );
//
//     await checkResponseStatus(
//       successMessage: 'register is successful',
//       response: response,
//       returnData: jsonDecode(response.body),
//     );
//   }
// }
