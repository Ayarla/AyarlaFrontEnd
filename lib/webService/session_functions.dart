// import 'package:ayarla/webService/http_service.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class HttpSessionFunctions extends HttpService {
//   Future getCurrentLoginInformation() async {
//     await getToken();
//     final String _url =
//         '$baseUrl/api/services/app/Session/GetCurrentLoginInformations';
//
//     http.Response response = await http.get(
//       _url,
//       headers: headersWithAdminToken,
//     );
//
//     await checkResponseStatus(
//       successMessage: 'getCurrentLoginInformation is successful',
//       response: response,
//       returnData: jsonDecode(response.body),
//     );
//   }
// }
