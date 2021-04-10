import 'package:flutter/material.dart';
import 'package:ayarla/constants/constants.dart';

// class RatingRow extends StatelessWidget {
//   final double number;
//   final int comment;
//
//   RatingRow({this.number, this.comment});
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Stack(
//           children: <Widget>[
//             Positioned(
//               left: 1,
//               top: 1.0,
//               child: SmoothStarRating(
//                 allowHalfRating: true,
//                 isReadOnly: true,
//                 starCount: 5,
//                 rating: number.toDouble(),
//                 size: 15,
//                 color: Colors.yellow.shade700,
//                 borderColor: Colors.yellow.shade700,
//                 defaultIconData: Icons.star_border,
//               ),
//             ),
//             SmoothStarRating(
//                 allowHalfRating: true,
//                 isReadOnly: true,
//                 starCount: 5,
//                 rating: number.toDouble(),
//                 size: 15,
//                 defaultIconData: null,
//                 color: Colors.yellow.shade700
//
//                 // color: HotelAppTheme
//                 //     .buildLightTheme()
//                 //     .primaryColor,
//                 // borderColor: HotelAppTheme
//                 //     .buildLightTheme()
//                 //     .primaryColor,
//                 ),
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 3.0),
//           child: Text(
//             ' $comment değerlendirme',
//             style: kSmallTextStyle.copyWith(
//               color: Colors.grey.withOpacity(0.8),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
