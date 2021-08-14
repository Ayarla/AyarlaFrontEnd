
import 'package:ayarla/services/service_appointment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_functions.dart';
//
// class ViewWebFunctions extends StatelessWidget {
//   final HttpUserFunctions httpUserFunctions = HttpUserFunctions();
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         TextButton(
//             onPressed: () {
//               httpUserFunctions.updateUser();
//             },
//             child: Text('guncelle')),
//         TextButton(
//             onPressed: () {
//               print(Provider.of<AppointmentData>(context, listen: false)
//                   .userList[2]
//                   .id);
//               httpUserFunctions.deleteUser(
//                   id: Provider.of<AppointmentData>(context, listen: false)
//                       .userList[2]
//                       .id);
//             },
//             child: Text('sil')),
//         TextButton(
//             onPressed: () => httpUserFunctions.createUser(),
//             child: Text("olustur")),
//         TextButton(
//             onPressed: () => httpUserFunctions.getToken(),
//             child: Text("getToken")),
//         TextButton(
//             // onPressed: () => getAll(),
//             onPressed: () {
//               Provider.of<AppointmentData>(context, listen: false)
//                   .getAllUsers();
//             },
//             child: Text("getAll")),
//         SizedBox(height: 30),
//         TextButton(
//           child: Text('kayıt popup'),
//           onPressed: () => Routers.router.navigateTo(context, "/KayitSayfasi"),
//         )
//       ],
//     );
//   }
// }
