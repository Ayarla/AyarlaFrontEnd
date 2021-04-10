import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randevudemo/constants/constants.dart';
import 'package:randevudemo/models/functions.dart';
import 'package:randevudemo/screens/search_page.dart';
import 'package:randevudemo/virtual_data_base/appointment_data.dart';
import 'circularParent.dart';

class FilterOrderRow extends StatefulWidget {
  @override
  _FilterOrderRowState createState() => _FilterOrderRowState();
}

class _FilterOrderRowState extends State<FilterOrderRow> {
  Functions functions = Functions();

  List localList = [];

  /// FILTERING SHEET
  // void _filterSheet(context1) {
  //   generatingList = coiffureList;
  //   showModalBottomSheet(
  //     backgroundColor: Colors.transparent,
  //     context: context,
  //     builder: (BuildContext bc) {
  //       return StatefulBuilder(
  //         builder: (BuildContext context, StateSetter setModalState) {
  //           /// Create your own context and state setter for bottom sheet.
  //           return Container(
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(20),
  //                 topRight: Radius.circular(20),
  //               ),
  //             ),
  //             child: ListView(
  //               children: [
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //
  //                 /// ACC TO STARS
  //                 Center(
  //                   child: FittedBox(
  //                     fit: BoxFit.cover,
  //                     child: Text(
  //                       'Yıldıza göre filtrele',
  //                       style: kSmallTitleStyle,
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 SfSlider(
  //                   min: 0.0,
  //                   max: 5.0,
  //                   value: _filterValue,
  //                   interval: 1,
  //                   showTicks: true,
  //                   showLabels: true,
  //                   showTooltip: true,
  //                   tooltipShape: SfRectangularTooltipShape(),
  //                   minorTicksPerInterval: 1,
  //                   onChanged: (dynamic value) {
  //                     setModalState(() {
  //                       _filterValue = value;
  //                     });
  //                     setState(() {
  //                       List returnList = [];
  //                       for (CoiffureModel x in generatingList) {
  //                         if (x.star >= value) {
  //                           returnList.add(x);
  //                         }
  //                       }
  //                       generatingList = returnList;
  //                     });
  //                   },
  //                 ),
  //               ],
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  /// ORDERING SHEET
  _orderSheet(context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return CircularParent(
          radius: 20,
          direction: Directions.top,
          color: Colors.white,
          child: ListView(
            children: [
              SizedBox(height: 10),

              /// ACC TO STARS
              Center(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    'Yıldıza göre sırala',
                    style: kSmallTitleStyle,
                  ),
                ),
              ),
              SizedBox(height: 10),

              /// LESS TO MORE ACC STARS
              TextButton(
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      'Azdan Çoka',
                      style: kSmallTextStyle,
                    ),
                  ),
                ),
                onPressed: () {
                  var ancestralState = context
                      .findAncestorStateOfType<SearchPageState>();
                  ancestralState.setState(() {});

                  setState(() {
                    Provider.of<AppointmentData>(context, listen: false)
                        .currentList
                        .sort((a, b) => a.star.compareTo(b.star));
                    Provider.of<AppointmentData>(context, listen: false)
                        .setList(
                            Provider.of<AppointmentData>(context, listen: false)
                                .currentList);
                  });
                  Navigator.pop(context);
                },
              ),

              /// MORE TO LESS ACC STARS
              TextButton(
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      'Çoktan Aza',
                      style: kSmallTextStyle,
                    ),
                  ),
                ),
                onPressed: () {
                  var ancestralState = context
                      .findAncestorStateOfType<SearchPageState>();
                  ancestralState.setState(() {});
                  setState(() {
                    Provider.of<AppointmentData>(context, listen: false)
                        .currentList
                        .sort((b, a) => a.star.compareTo(b.star));
                    Provider.of<AppointmentData>(context, listen: false)
                        .setList(
                            Provider.of<AppointmentData>(context, listen: false)
                                .currentList);
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          child: Row(children: [
            Icon(Icons.filter_alt_outlined, color: Colors.white),
            SizedBox(width: 5),
            Text(
              'Filtrele',
              style: kSmallTextStyle.copyWith(color: Colors.white),
            ),
          ]),
          onPressed: () {
            setState(() {
              // _filterSheet(context);
            });
          },
        ),
        SizedBox(width: 10),
        TextButton(
          child: Row(children: [
            Icon(Icons.sort, color: Colors.white),
            SizedBox(width: 5),
            Text(
              'Sırala',
              style: kSmallTextStyle.copyWith(color: Colors.white),
            ),
          ]),
          onPressed: () {
            setState(() {
              _orderSheet(context);
            });
          },
        ),
      ],
    );
  }
}
