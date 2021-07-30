import 'dart:math';
import 'package:ayarla/constants/constants.dart';
import 'package:flutter/material.dart';

class BottomSheetCard extends StatelessWidget {
  final String title;
  final String firstOption;
  final String secondOption;
  final Function firstOptionFunction;
  final Function secondOptionFunction;

  BottomSheetCard({
    this.title,
    this.firstOption,
    this.firstOptionFunction,
    this.secondOption,
    this.secondOptionFunction,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text(title ?? 'YOUR TITLE HERE',
                style: kTitleStyle.copyWith(fontSize: width <= 400 ? width / 20 : 20)),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: firstOptionFunction ?? () {},
                      child: Text(
                        firstOption ?? 'Azdan Çoka',
                        style: kSmallTextStyle.copyWith(
                            fontSize: width <= 400 ? width / 25 : 16,
                            textBaseline: TextBaseline.ideographic),
                      ),
                    ),
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi),
                      child: Icon(
                        Icons.stacked_bar_chart,
                        size: width <= 400 ? width / 16 : 25,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: secondOptionFunction ?? () {},
                      child: Text(
                        secondOption ?? 'Çoktan Aza',
                        style: kSmallTextStyle.copyWith(
                            fontSize: width <= 400 ? width / 25 : 16,
                            textBaseline: TextBaseline.ideographic),
                      ),
                    ),
                    Icon(
                      Icons.stacked_bar_chart,
                      size: width <= 400 ? width / 16 : 25,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

createSheet(BuildContext context, Widget content, double height) {
  return showModalBottomSheet(
    isScrollControlled: true,
    enableDrag: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext bc) {
      final size = MediaQuery.of(context).size;
      return Align(
        alignment: Alignment.bottomCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: size.width <= 700 ? size.width : 700,
            minWidth: size.width <= 700 ? size.width : 700,
          ),
          child: Container(
            width: size.width <= 700 ? size.width : 700,
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: content ?? Container(),
            // ListView(
            //   shrinkWrap: true,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            //       child: Container(
            //         decoration: BoxDecoration(
            //           color: Colors.grey[300],
            //           borderRadius: BorderRadius.all(Radius.circular(20)),
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.black54,
            //               blurRadius: 1.0,
            //               offset: Offset(1, 1.2),
            //             ),
            //           ],
            //         ),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             SizedBox(height: 10),
            //             Text('YOUR TITLE HERE',
            //                 style: kTitleStyle.copyWith(
            //                     fontSize: size.width <= 400
            //                         ? size.width / 20
            //                         : 20)),
            //             SizedBox(height: 5),
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               children: [
            //                 Row(
            //                   crossAxisAlignment: CrossAxisAlignment.end,
            //                   children: [
            //                     GestureDetector(
            //                       onTap: () {},
            //                       child: Text(
            //                         'Azdan Çoka',
            //                         style: kSmallTextStyle.copyWith(
            //                             fontSize: size.width <= 400
            //                                 ? size.width / 25
            //                                 : 16,
            //                             textBaseline:
            //                                 TextBaseline.ideographic),
            //                       ),
            //                     ),
            //                     Transform(
            //                       alignment: Alignment.center,
            //                       transform: Matrix4.rotationY(pi),
            //                       child: Icon(
            //                         Icons.stacked_bar_chart,
            //                         size: size.width <= 400
            //                             ? size.width / 16
            //                             : 25,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //                 Row(
            //                   crossAxisAlignment: CrossAxisAlignment.end,
            //                   children: [
            //                     GestureDetector(
            //                       onTap: () {},
            //                       child: Text(
            //                         'Çoktan Aza',
            //                         style: kSmallTextStyle.copyWith(
            //                             fontSize: size.width <= 400
            //                                 ? size.width / 25
            //                                 : 16,
            //                             textBaseline:
            //                                 TextBaseline.ideographic),
            //                       ),
            //                     ),
            //                     Icon(
            //                       Icons.stacked_bar_chart,
            //                       size: size.width <= 400
            //                           ? size.width / 16
            //                           : 25,
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //             SizedBox(height: 10),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ),
      );
    },
  );
}
