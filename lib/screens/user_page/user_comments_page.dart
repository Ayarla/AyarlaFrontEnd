import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/components/ayarla_textfield.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/models/model_comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCommentsPage extends StatefulWidget {
  @override
  _UserCommentsPageState createState() => _UserCommentsPageState();
}

class _UserCommentsPageState extends State<UserCommentsPage> {
  bool _hidePanel = true;
  String _typedComment;
  List<CommentModel> myComments = [];

  @override
  void initState() {
    myComments.add(
      CommentModel(
        name: 'Fatih Özkan',
        rating: 5,
        comment: 'Harika!!',
        image: 'assets/worker_1.png',
        date: '21.10.2018',
        like: 1,
        dislike: 0,
        expanded: true,
        editable: true,
        editFunction: () {
          setState(() {
            _hidePanel = false;
          });
        },
        removeFunction: () {},
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        showIconButton: false,
        centerTitle: true,
        gradient: Functions().decideColor(context),
        title: Text(
          "Yorumlarım",
          style: kTitleStyle.copyWith(color: Colors.white),
        ),
      ).build(context),
      body: ListView(
        children: [
          SizedBox(height: 10),
          AyarlaPage(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: myComments.length,
                itemBuilder: (BuildContext bc, int index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: myComments[index],
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: _hidePanel
          ? null
          : AyarlaPageNoC(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
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
                                  Icon(Icons.star_border,
                                      color: Colors.yellow.shade700, size: 20),
                              ],
                            ),
                            SizedBox(height: 10),
                            AyarlaTextFormField(
                              hintText: myComments[0].comment,
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
                            myComments.insert(
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
                                editable: true,
                                editFunction: () {
                                  setState(() {
                                    _hidePanel = false;
                                  });
                                },
                                removeFunction: () {},
                              ),
                            );
                            myComments.removeAt(1);
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
                                style: kSmallTextStyle.copyWith(
                                    color: Colors.white),
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
