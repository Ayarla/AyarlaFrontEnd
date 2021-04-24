import 'package:flutter/material.dart';

class GenericBottomSheet extends StatelessWidget {

  // _showBottomSheet() {
  //   return showModalBottomSheet(
  //       backgroundColor: Colors.transparent,
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return ResponsiveWidget(
  //           smallScreen: CircularParent(
  //             color: Colors.white,
  //             radius: 20,
  //             direction: Directions.top,
  //             child: ListView.separated(
  //               padding: EdgeInsets.all(20),
  //               physics: BouncingScrollPhysics(),
  //               itemBuilder: (BuildContext context, int index) {
  //                 return Column(
  //                   children: [
  //                     SizedBox(height: 5),
  //                     functions.createTitle(context, orderings[index]),
  //                     SizedBox(height: 10),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         TextButton(
  //                           child: FittedBox(
  //                               fit: BoxFit.cover,
  //                               child:
  //                               Text('Azdan Çoka', style: kSmallTextStyle)),
  //                           onPressed: () {
  //                             setState(() {
  //                               if (index == 0) {
  //                                 generatingList.sort(
  //                                         (a, b) => a.rating.compareTo(b.rating));
  //                               } else if (index == 1) {
  //                                 generatingList
  //                                     .sort((a, b) => a.like.compareTo(b.like));
  //                               } else if (index == 2) {
  //                                 generatingList
  //                                     .sort((a, b) => a.date.compareTo(b.date));
  //                               }
  //                             });
  //                             Navigator.pop(context);
  //                           },
  //                         ),
  //                         Icon(Icons.arrow_circle_down_rounded),
  //                         SizedBox(width: 20),
  //                         TextButton(
  //                           child: Center(
  //                               child:
  //                               Text('Çoktan Aza', style: kSmallTextStyle)),
  //                           onPressed: () {
  //                             setState(() {
  //                               if (index == 0) {
  //                                 generatingList.sort(
  //                                         (b, a) => a.rating.compareTo(b.rating));
  //                               } else if (index == 1) {
  //                                 generatingList
  //                                     .sort((b, a) => a.like.compareTo(b.like));
  //                               } else if (index == 2) {
  //                                 generatingList
  //                                     .sort((b, a) => a.date.compareTo(b.date));
  //                               }
  //                             });
  //                             Navigator.pop(context);
  //                           },
  //                         ),
  //                         Icon(Icons.arrow_circle_up_rounded),
  //                       ],
  //                     ),
  //                   ],
  //                 );
  //               },
  //               separatorBuilder: (BuildContext context, int index) {
  //                 return Padding(
  //                   padding: EdgeInsets.symmetric(horizontal: size.width / 10),
  //                   child: Divider(thickness: 1),
  //                 );
  //               },
  //               itemCount: orderings.length,
  //             ),
  //           ),
  //           mediumScreen: Align(
  //             alignment: Alignment.bottomCenter,
  //             child: ConstrainedBox(
  //               constraints: BoxConstraints(maxWidth: size.width / 2),
  //               child: CircularParent(
  //                 color: Colors.white,
  //                 radius: 20,
  //                 direction: Directions.top,
  //                 child: ListView.separated(
  //                   padding: EdgeInsets.all(20),
  //                   physics: BouncingScrollPhysics(),
  //                   itemBuilder: (BuildContext context, int index) {
  //                     return Column(
  //                       children: [
  //                         SizedBox(height: 5),
  //                         functions.createTitle(context, orderings[index]),
  //                         SizedBox(height: 10),
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: [
  //                             TextButton(
  //                               child: FittedBox(
  //                                   fit: BoxFit.cover,
  //                                   child: Text('Azdan Çoka',
  //                                       style: kSmallTextStyle)),
  //                               onPressed: () {
  //                                 setState(() {
  //                                   if (index == 0) {
  //                                     generatingList.sort((a, b) =>
  //                                         a.rating.compareTo(b.rating));
  //                                   } else if (index == 1) {
  //                                     generatingList.sort(
  //                                             (a, b) => a.like.compareTo(b.like));
  //                                   } else if (index == 2) {
  //                                     generatingList.sort(
  //                                             (a, b) => a.date.compareTo(b.date));
  //                                   }
  //                                 });
  //                                 Navigator.pop(context);
  //                               },
  //                             ),
  //                             Icon(Icons.arrow_circle_down_rounded),
  //                             SizedBox(width: 20),
  //                             TextButton(
  //                               child: Center(
  //                                   child: Text('Çoktan Aza',
  //                                       style: kSmallTextStyle)),
  //                               onPressed: () {
  //                                 setState(() {
  //                                   if (index == 0) {
  //                                     generatingList.sort((b, a) =>
  //                                         a.rating.compareTo(b.rating));
  //                                   } else if (index == 1) {
  //                                     generatingList.sort(
  //                                             (b, a) => a.like.compareTo(b.like));
  //                                   } else if (index == 2) {
  //                                     generatingList.sort(
  //                                             (b, a) => a.date.compareTo(b.date));
  //                                   }
  //                                 });
  //                                 Navigator.pop(context);
  //                               },
  //                             ),
  //                             Icon(Icons.arrow_circle_up_rounded),
  //                           ],
  //                         ),
  //                       ],
  //                     );
  //                   },
  //                   separatorBuilder: (BuildContext context, int index) {
  //                     return Padding(
  //                       padding:
  //                       EdgeInsets.symmetric(horizontal: size.width / 10),
  //                       child: Divider(thickness: 1),
  //                     );
  //                   },
  //                   itemCount: orderings.length,
  //                 ),
  //               ),
  //             ),
  //           ),
  //           largeScreen: Align(
  //             alignment: Alignment.bottomCenter,
  //             child: ConstrainedBox(
  //               constraints: BoxConstraints(maxWidth: size.width / 2),
  //               child: CircularParent(
  //                 color: Colors.white,
  //                 radius: 20,
  //                 direction: Directions.top,
  //                 child: ListView.separated(
  //                   padding: EdgeInsets.all(20),
  //                   physics: BouncingScrollPhysics(),
  //                   itemBuilder: (BuildContext context, int index) {
  //                     return Column(
  //                       children: [
  //                         SizedBox(height: 5),
  //                         functions.createTitle(context, orderings[index]),
  //                         SizedBox(height: 10),
  //                         Row(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: [
  //                             TextButton(
  //                               child: FittedBox(
  //                                   fit: BoxFit.cover,
  //                                   child: Text('Azdan Çoka',
  //                                       style: kSmallTextStyle)),
  //                               onPressed: () {
  //                                 setState(() {
  //                                   if (index == 0) {
  //                                     generatingList.sort((a, b) =>
  //                                         a.rating.compareTo(b.rating));
  //                                   } else if (index == 1) {
  //                                     generatingList.sort(
  //                                             (a, b) => a.like.compareTo(b.like));
  //                                   } else if (index == 2) {
  //                                     generatingList.sort(
  //                                             (a, b) => a.date.compareTo(b.date));
  //                                   }
  //                                 });
  //                                 Navigator.pop(context);
  //                               },
  //                             ),
  //                             Icon(Icons.arrow_circle_down_rounded),
  //                             SizedBox(width: 20),
  //                             TextButton(
  //                               child: Center(
  //                                   child: Text('Çoktan Aza',
  //                                       style: kSmallTextStyle)),
  //                               onPressed: () {
  //                                 setState(() {
  //                                   if (index == 0) {
  //                                     generatingList.sort((b, a) =>
  //                                         a.rating.compareTo(b.rating));
  //                                   } else if (index == 1) {
  //                                     generatingList.sort(
  //                                             (b, a) => a.like.compareTo(b.like));
  //                                   } else if (index == 2) {
  //                                     generatingList.sort(
  //                                             (b, a) => a.date.compareTo(b.date));
  //                                   }
  //                                 });
  //                                 Navigator.pop(context);
  //                               },
  //                             ),
  //                             Icon(Icons.arrow_circle_up_rounded),
  //                           ],
  //                         ),
  //                       ],
  //                     );
  //                   },
  //                   separatorBuilder: (BuildContext context, int index) {
  //                     return Padding(
  //                       padding:
  //                       EdgeInsets.symmetric(horizontal: size.width / 10),
  //                       child: Divider(thickness: 1),
  //                     );
  //                   },
  //                   itemCount: orderings.length,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  // }
  // }

  _showBottomSheet() {

  }

  @override
  Widget build(BuildContext context) {
    return _showBottomSheet();
  }
}


