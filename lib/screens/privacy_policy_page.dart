// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:ayarla/components/pop-up.dart';
// import 'package:ayarla/constants/constants.dart';
// import 'package:ayarla/models/functions.dart';
// import 'package:ayarla/virtual_data_base/appointment_data.dart';
//
// //
// // class PrivacyPolicyPage extends StatefulWidget {
// //   final BuildContext context;
// //   PrivacyPolicyPage({this.context});
// //   @override
// //   _PrivacyPolicyPageState createState() => _PrivacyPolicyPageState();
// // }
// //
// // class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
// //   final Functions functions = Functions();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     context = widget.context;
// //     final Size size = MediaQuery.of(context).size;
// //
// //     return Container(
// //       height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 10),
// //       child: Scaffold(
// //         backgroundColor: Color(0xFFE5EBEE),
// //         body: Padding(
// //           padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
// //           child: Column(
// //             children: <Widget>[
// //               Text(
// //                 'Ayarla Gizlilik sozlesmesi',
// //               ),
// //               SizedBox(height: 10),
// //               Text('sfhjskfjaksfhksafhjsahfjkshfksahdkfdskafksahfjkshagsgaskgkskagksadkgasgbsakjgfbskbfsjb'),
// //             ],
// //           ),
// //         ),
// //         floatingActionButton: Padding(
// //           padding: EdgeInsets.only(left: 32.0),
// //           child: Row(
// //             children: <Widget>[
// //               Container(
// //                 width: size.width - 4 * (size.width / 6),
// //                 decoration: BoxDecoration(
// //                   gradient: functions.decideColor(context),
// //                   borderRadius: BorderRadius.circular(15),
// //                 ),
// //                 child: FloatingActionButton.extended(
// //                   elevation: 0,
// //                   backgroundColor: Colors.transparent,
// //                   onPressed: () {
// //                     setState(() {
// //                       PopUp().checkBox = false;
// //                     });
// //                     Navigator.pop(context);
// //                   },
// //                   label: FittedBox(
// //                     fit: BoxFit.cover,
// //                     child: Text(
// //                       'Geri Dön',
// //                       style: kTextStyle.copyWith(
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               Spacer(),
// //               Container(
// //                 width: size.width - 4 * (size.width / 6),
// //                 decoration: BoxDecoration(
// //                   gradient: functions.decideColor(context),
// //                   borderRadius: BorderRadius.circular(15),
// //                 ),
// //                 child: FloatingActionButton.extended(
// //                   elevation: 0,
// //                   backgroundColor: Colors.transparent,
// //                   onPressed: () {
// //                     setState(() {
// //                       PopUp().checkBox = true;
// //                     });
// //                     Navigator.pop(context);
// //                   },
// //                   label: FittedBox(
// //                     fit: BoxFit.cover,
// //                     child: Text(
// //                       'Onayla',
// //                       style: kSmallTitleStyle.copyWith(
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// privacyPolicyModalBottomSheet({BuildContext context, StateSetter setState, bool checkBox}) {
//   final Size size = MediaQuery.of(context).size;
//   final Functions functions = Functions();
//   return Container(
//     height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height / 10),
//     child: Scaffold(
//       backgroundColor: Color(0xFFE5EBEE),
//       body: Padding(
//         padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
//         child: Column(
//           children: <Widget>[
//             Text(
//               'Ayarla Gizlilik sozlesmesi',
//             ),
//             SizedBox(height: 10),
//             Text('sfhjskfjaksfhksafhjsahfjkshfksahdkfdskafksahfjkshagsgaskgkskagksadkgasgbsakjgfbskbfsjb'),
//           ],
//         ),
//       ),
//       floatingActionButton: Padding(
//         padding: EdgeInsets.only(left: 32.0),
//         child: Row(
//           children: <Widget>[
//             Container(
//               width: size.width - 4 * (size.width / 6),
//               decoration: BoxDecoration(
//                 gradient: functions.decideColor(context),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: FloatingActionButton.extended(
//                 elevation: 0,
//                 backgroundColor: Colors.transparent,
//                 onPressed: () {
//                   Provider.of<AppointmentData>(context, listen: false).checkBox = false;
//                   Navigator.pop(context);
//                 },
//                 label: FittedBox(
//                   fit: BoxFit.cover,
//                   child: Icon(
//                     Icons.cancel_outlined,
//                     size: 40,
//                   ),
//                 ),
//               ),
//             ),
//             Spacer(),
//             Container(
//               width: size.width - 4 * (size.width / 6),
//               decoration: BoxDecoration(
//                 gradient: functions.decideColor(context),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: FloatingActionButton.extended(
//                 elevation: 0,
//                 backgroundColor: Colors.transparent,
//                 onPressed: () {
//                   Provider.of<AppointmentData>(context, listen: false).checkBox = true;
//                   Navigator.pop(context);
//                 },
//                 label: FittedBox(
//                   fit: BoxFit.cover,
//                   child: Icon(
//                     Icons.check,
//                     size: 40,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
