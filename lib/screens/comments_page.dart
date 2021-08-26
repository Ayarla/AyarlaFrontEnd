import 'package:ayarla/components/ayarla_bottom_sheet.dart';
import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/components/ayarla_textfield.dart';
import 'package:ayarla/components/unFocuser.dart';
import 'package:ayarla/models/model_comment.dart';
import 'package:ayarla/virtual_data_base/temporaryLists.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';
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
    generatingList = commentsList;
    // Provider.of<AppointmentService>(context, listen: false).currentList2 = generatingList;
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
                ),
                400),
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
                        Navigator.pop(context);
                      },
                      secondOptionFunction: () {
                        setState(() {
                          generatingList.sort((b, a) => a.rating.compareTo(b.rating));
                        });
                        Navigator.pop(context);
                      },
                    ),
                    BottomSheetCard(
                      title: 'Beğeniye göre sırala',
                      firstOptionFunction: () {
                        setState(() {
                          generatingList.sort((a, b) => a.like.compareTo(b.like));
                        });
                        Navigator.pop(context);
                      },
                      secondOptionFunction: () {
                        setState(() {
                          generatingList.sort((b, a) => a.like.compareTo(b.like));
                        });
                        Navigator.pop(context);
                      },
                    ),
                    BottomSheetCard(
                      title: 'Tarihe göre sırala',
                      firstOptionFunction: () {
                        setState(() {
                          generatingList.sort((a, b) => a.date.compareTo(b.date));
                        });
                        Navigator.pop(context);
                      },
                      secondOptionFunction: () {
                        setState(() {
                          generatingList.sort((b, a) => a.date.compareTo(b.date));
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                400),
          ),
        ],
      )).build(context),
      body: UnFocuser(
        child: ListView(
          children: [
            AyarlaPage(
              child: ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: generatingList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: [SizedBox(height: 10), generatingList[index]]);
                },
                separatorBuilder: (context, index) => Divider(thickness: 1, height: 0),
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
                                userName: 'Fatih Özkan',
                                rating: 2,
                                comment: _typedComment,
                                userImage: 'assets/worker_1.png',
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
