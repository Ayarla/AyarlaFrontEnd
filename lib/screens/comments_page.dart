import 'package:ayarla/components/ayarla_bottom_sheet.dart';
import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/constants/router.dart';
import 'package:ayarla/models/model_comment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:ayarla/models/functions.dart';

class CommentsPage extends StatefulWidget {
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  Functions functions = Functions();
  double _filterValue = 0;
  List generatingList = [];

  /// FILTERING SHEET
  // _filterSheet(context) {
  //   showModalBottomSheet(
  //     backgroundColor: Colors.transparent,
  //     context: context,
  //     builder: (BuildContext bc) {
  //       return StatefulBuilder(
  //         builder: (BuildContext context, StateSetter setModalState) {
  //           final size = MediaQuery.of(context).size;
  //           return ResponsiveWidget(
  //             smallScreen: CircularParent(
  //               radius: 20,
  //               direction: Directions.top,
  //               color: Colors.white,
  //               child: ListView(
  //                 padding: EdgeInsets.all(20),
  //                 physics: BouncingScrollPhysics(),
  //                 children: [
  //                   /// ACC TO STARS
  //                   functions.createTitle(context, 'Yıldıza göre filtrele'),
  //                   SizedBox(height: 10),
  //                   SfSlider(
  //                     min: 0.0,
  //                     max: 5.0,
  //                     value: _filterValue,
  //                     interval: 1,
  //                     showTicks: true,
  //                     showLabels: true,
  //                     tooltipShape: SfRectangularTooltipShape(),
  //                     minorTicksPerInterval: 2,
  //                     onChanged: (dynamic value) {
  //                       generatingList =
  //                           Provider.of<AppointmentData>(context, listen: false)
  //                               .currentList2;
  //                       List returnList = generatingList;
  //                       setModalState(() {
  //                         _filterValue = value;
  //                       });
  //                       setState(() {
  //                         generatingList = returnList
  //                             .where((element) => element.rating >= value)
  //                             .toList();
  //                       });
  //                     },
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             mediumScreen: Align(
  //               alignment: Alignment.bottomCenter,
  //               child: ConstrainedBox(
  //                 constraints: BoxConstraints(maxWidth: size.width / 1.5),
  //                 child: CircularParent(
  //                   radius: 20,
  //                   direction: Directions.top,
  //                   color: Colors.white,
  //                   child: ListView(
  //                     padding: EdgeInsets.all(20),
  //                     physics: BouncingScrollPhysics(),
  //                     children: [
  //                       /// ACC TO STARS
  //                       functions.createTitle(context, 'Yıldıza göre filtrele'),
  //                       SizedBox(height: 10),
  //                       SfSlider(
  //                         min: 0.0,
  //                         max: 5.0,
  //                         value: _filterValue,
  //                         interval: 1,
  //                         showTicks: true,
  //                         showLabels: true,
  //                         tooltipShape: SfRectangularTooltipShape(),
  //                         minorTicksPerInterval: 2,
  //                         onChanged: (dynamic value) {
  //                           generatingList = Provider.of<AppointmentData>(
  //                                   context,
  //                                   listen: false)
  //                               .currentList2;
  //                           List returnList = generatingList;
  //                           setModalState(() {
  //                             _filterValue = value;
  //                           });
  //                           setState(() {
  //                             generatingList = returnList
  //                                 .where((element) => element.rating >= value)
  //                                 .toList();
  //                           });
  //                         },
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             largeScreen: Align(
  //               alignment: Alignment.bottomCenter,
  //               child: ConstrainedBox(
  //                 constraints: BoxConstraints(maxWidth: size.width / 1.5),
  //                 child: CircularParent(
  //                   radius: 20,
  //                   direction: Directions.top,
  //                   color: Colors.white,
  //                   child: ListView(
  //                     padding: EdgeInsets.all(20),
  //                     physics: BouncingScrollPhysics(),
  //                     children: [
  //                       /// ACC TO STARS
  //                       functions.createTitle(context, 'Yıldıza göre filtrele'),
  //                       SizedBox(height: 10),
  //                       SfSlider(
  //                         min: 0.0,
  //                         max: 5.0,
  //                         value: _filterValue,
  //                         interval: 1,
  //                         showTicks: true,
  //                         showLabels: true,
  //                         tooltipShape: SfRectangularTooltipShape(),
  //                         minorTicksPerInterval: 2,
  //                         onChanged: (dynamic value) {
  //                           generatingList = Provider.of<AppointmentData>(
  //                                   context,
  //                                   listen: false)
  //                               .currentList2;
  //                           List returnList = generatingList;
  //                           setModalState(() {
  //                             _filterValue = value;
  //                           });
  //                           setState(() {
  //                             generatingList = returnList
  //                                 .where((element) => element.rating >= value)
  //                                 .toList();
  //                           });
  //                         },
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  @override
  void initState() {
    generatingList = [
      CommentModel(
        name: 'Fatih Özkan',
        rating: 2,
        comment: 'Harika!!',
        image: 'assets/worker_1.png',
        date: '21.10.2018',
        like: 5,
        dislike: 0,
        expanded: true,
      ),
      CommentModel(
        name: 'Nixu',
        rating: 2,
        comment: 'Merhaba ben çok uzun bir yorum yazmak istiyorum. '
            'Uzun uzun anlatayım bir şeylerrrr.'
            'Merhaba ben çok uzun bir yorum yazmak istiyorum. '
            'Uzun uzun anlatayım bir şeylerrrr.'
            'Merhaba ben çok uzun bir yorum yazmak istiyorum. '
            'Uzun uzun anlatayım bir şeylerrrr.',
        image: 'assets/worker_1.png',
        date: '21.10.2020',
        like: 9,
        dislike: 4,
        expanded: true,
      ),
      CommentModel(
        name: 'Bahadır İren',
        rating: 4,
        comment: 'Daha iyilerini görmüştüm ama idare eder. '
            'Ben de uzun bir yorum yazmak istiyorum.',
        image: 'assets/worker_2.jpg',
        date: '21.02.2021',
        like: 13,
        dislike: 1,
        expanded: true,
      ),
      CommentModel(
        name: 'Fatih Özkan',
        rating: 4,
        comment: 'Harika bence.',
        image: 'assets/worker_1.png',
        date: '21.10.2018',
        like: 5,
        dislike: 0,
        expanded: true,
      ),
      CommentModel(
        name: 'Nixu',
        rating: 5,
        comment: 'Merhaba ben çok uzun bir yorum yazmak istiyorum. '
            'Merhaba ben çok uzun bir yorum yazmak istiyorum. '
            'Merhaba ben çok uzun bir yorum yazmak istiyorum. '
            'Uzun uzun anlatayım bir şeylerrrr.',
        image: 'assets/worker_1.png',
        date: '21.10.2020',
        like: 9,
        dislike: 4,
        expanded: true,
      ),
      CommentModel(
        name: 'Bahadır İren',
        rating: 3,
        comment: 'Daha iyilerini görmüştüm ama idare eder. '
            'Ben de uzun bir yorum yazmak istiyorum.'
            'Ben de uzun bir yorum yazmak istiyorum.'
            'Ben de uzun bir yorum yazmak istiyorum.'
            'Ben de uzun bir yorum yazmak istiyorum.'
            'Ben de uzun bir yorum yazmak istiyorum.'
            'Ben de uzun bir yorum yazmak istiyorum.',
        image: 'assets/worker_2.jpg',
        date: '21.02.2021',
        like: 13,
        dislike: 1,
        expanded: true,
      ),
    ];
    Provider.of<AppointmentData>(context, listen: false).currentList2 =
        generatingList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: DefaultAppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            child: Row(
              children: [
                Icon(Icons.filter_alt_outlined, color: Colors.white),
                SizedBox(width: 5),
                Text(
                  'Filtrele',
                  style: kSmallTextStyle.copyWith(color: Colors.white),
                ),
              ],
            ),
            onPressed: () => createSheet(
                context,
                ListView(
                  shrinkWrap: true,
                  children: [
                    BottomSheetCard(
                      title: 'Yıldıza göre filtrele',
                    ),
                  ],
                )),
          ),
          SizedBox(width: 20),
          TextButton(
            child: Row(children: [
              Icon(Icons.sort, color: Colors.white),
              SizedBox(width: 5),
              Text(
                'Sırala',
                style: kSmallTextStyle.copyWith(color: Colors.white),
              ),
            ]),
            onPressed: () => createSheet(
                context,
                ListView(
                  shrinkWrap: true,
                  children: [
                    BottomSheetCard(
                      title: 'Yıldıza göre sırala',
                      firstOptionFunction: () {
                        setState(() {
                          generatingList
                              .sort((a, b) => a.rating.compareTo(b.rating));
                        });
                        Routers.router.pop(context);
                      },
                      secondOptionFunction: () {
                        setState(() {
                          generatingList
                              .sort((b, a) => a.rating.compareTo(b.rating));
                        });
                        Routers.router.pop(context);
                      },
                    ),
                    BottomSheetCard(
                      title: 'Beğeniye göre sırala',
                      firstOptionFunction: () {
                        setState(() {
                          generatingList
                              .sort((a, b) => a.like.compareTo(b.like));
                        });
                        Routers.router.pop(context);
                      },
                      secondOptionFunction: () {
                        setState(() {
                          generatingList
                              .sort((b, a) => a.like.compareTo(b.like));
                        });
                        Routers.router.pop(context);
                      },
                    ),
                    BottomSheetCard(
                      title: 'Tarihe göre sırala',
                      firstOptionFunction: () {
                        setState(() {
                          generatingList
                              .sort((a, b) => a.date.compareTo(b.date));
                        });
                        Routers.router.pop(context);
                      },
                      secondOptionFunction: () {
                        setState(() {
                          generatingList
                              .sort((b, a) => a.date.compareTo(b.date));
                        });
                        Routers.router.pop(context);
                      },
                    ),
                  ],
                )),
          ),
        ],
      )).build(context),
      body: ListView(
        children: [
          AyarlaPage(
            child: ListView.separated(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              itemCount: generatingList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                    children: [SizedBox(height: 10), generatingList[index]]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(thickness: 1, height: 0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
