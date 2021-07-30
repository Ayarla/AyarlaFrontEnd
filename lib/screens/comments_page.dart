import 'package:ayarla/components/ayarla_bottom_sheet.dart';
import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/components/ayarla_textfield.dart';
import 'package:ayarla/constants/router.dart';
import 'package:ayarla/models/model_comment.dart';
import 'package:ayarla/screens/manager_screens/business_info_page/business_info_page.dart';
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
  // double _filterValue = 0;
  List generatingList = [];

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

  String _typedComment = '';
  bool _hidePanel = false;

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
    Provider.of<AppointmentData>(context, listen: false).currentList2 = generatingList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
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
                          generatingList.sort((a, b) => a.rating.compareTo(b.rating));
                        });
                        Routers.router.pop(context);
                      },
                      secondOptionFunction: () {
                        setState(() {
                          generatingList.sort((b, a) => a.rating.compareTo(b.rating));
                        });
                        Routers.router.pop(context);
                      },
                    ),
                    BottomSheetCard(
                      title: 'Beğeniye göre sırala',
                      firstOptionFunction: () {
                        setState(() {
                          generatingList.sort((a, b) => a.like.compareTo(b.like));
                        });
                        Routers.router.pop(context);
                      },
                      secondOptionFunction: () {
                        setState(() {
                          generatingList.sort((b, a) => a.like.compareTo(b.like));
                        });
                        Routers.router.pop(context);
                      },
                    ),
                    BottomSheetCard(
                      title: 'Tarihe göre sırala',
                      firstOptionFunction: () {
                        setState(() {
                          generatingList.sort((a, b) => a.date.compareTo(b.date));
                        });
                        Routers.router.pop(context);
                      },
                      secondOptionFunction: () {
                        setState(() {
                          generatingList.sort((b, a) => a.date.compareTo(b.date));
                        });
                        Routers.router.pop(context);
                      },
                    ),
                  ],
                )),
          ),
        ],
      )).build(context),
      body: Unfocuser(
        child: ListView(
          children: [
            AyarlaPage(
              child: ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: generatingList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: [SizedBox(height: 10), generatingList[index]]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(thickness: 1, height: 0);
                },
              ),
            ),
            AyarlaPage(child: SizedBox(height: 150)),
          ],
        ),
      ),
      floatingActionButton: _hidePanel
          ? null
          : AyarlaPageNoC(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 120,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 5),
                                for (int i = 0; i < 5; i++)
                                  Icon(Icons.star_border, color: Colors.yellow.shade700, size: 20),
                              ],
                            ),
                            SizedBox(height: 10),
                            AyarlaTextFormField(
                              hintText: 'Yorumunuzu yazın',
                              style: kSmallTextStyle,
                              maxLines: 3,
                              onChanged: (value) {
                                setState(() {
                                  _typedComment = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            generatingList.insert(
                              0,
                              CommentModel(
                                name: 'Fatih Özkan',
                                rating: 2,
                                comment: _typedComment,
                                image: 'assets/worker_1.png',
                                date: '21.10.2018',
                                like: 0,
                                dislike: 0,
                                expanded: true,
                              ),
                            );
                            _hidePanel = true;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 12,
                            bottom: 12,
                            right: 8,
                          ),
                          child: Container(
                            height: 70,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.orange[500],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'Gönder',
                                style: kSmallTextStyle.copyWith(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
