import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ayarla/constants/constants.dart';

class Comment extends StatelessWidget {
  final String name;
  final int rating;
  final String comment;
  final String image;
  final String date;
  final int like;
  final int dislike;
  final int score;

  Comment({
    @required this.rating,
    @required this.name,
    @required this.comment,
    @required this.image,
    this.date,
    this.like,
    this.dislike,
    this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(image)),
            SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: kSmallTextStyle,
                ),
                Row(
                  children: <Widget>[
                    for (int i = 0; i < rating; i++)
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade700,
                        size: 20,
                      ),
                    for (int i = rating; i < 5; i++)
                      Icon(Icons.star_border,
                          color: Colors.yellow.shade700, size: 20),
                  ],
                ),
                SizedBox(width: 10),
                Text(
                  date,
                  style: kSmallTextStyle.copyWith(
                      fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.only(left: 45),
          child: Text(
            comment,
            style: kSmallTextStyle,
          ),
        ),
        // SizedBox(height: 5,),
        _voting(),
      ],
    );
  }

  Row _voting() {
    return Row(
      children: [
        SizedBox(width: 35),
        IconButton(
          icon: Icon(
            FontAwesomeIcons.thumbsUp,
            size: 20,
            color: Colors.lightGreen,
          ),
          padding: EdgeInsets.all(0),
          onPressed: () {
            ///
          },
        ),
        Text(
          like.toString(),
          style: kSmallTextStyle,
        ),
        SizedBox(width: 10),
        IconButton(
          icon: Icon(
            FontAwesomeIcons.thumbsDown,
            size: 20,
            color: Colors.redAccent,
          ),
          padding: EdgeInsets.all(0),
          onPressed: () {
            ///
          },
        ),
        Text(
          dislike.toString(),
          style: kSmallTextStyle,
        ),
      ],
    );
  }
}
