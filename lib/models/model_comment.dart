import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ayarla/constants/constants.dart';

class CommentModel extends StatelessWidget {
  final String name;
  final int rating;
  final String comment;
  final String image;
  final String date;
  final int like;
  final int dislike;

  ///
  final bool expanded;
  final bool editable;
  final Function removeFunction;
  final Function editFunction;

  CommentModel({
    @required this.rating,
    @required this.name,
    @required this.comment,
    @required this.image,
    this.date,
    this.like,
    this.dislike,

    ///
    this.expanded = false,
    this.editable = false,
    this.editFunction,
    this.removeFunction,
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
                editable
                    ? Row(
                        children: [
                          Text(
                            name,
                            style: kSmallTextStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            child: Text(
                              'Düzenle',
                              style:
                                  kSmallTextStyle.copyWith(color: Colors.green),
                            ),
                            onTap: editFunction,
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            child: Text(
                              'Kaldır',
                              style:
                                  kSmallTextStyle.copyWith(color: Colors.red),
                            ),
                            onTap: removeFunction,
                          ),
                        ],
                      )
                    : Text(name, style: kSmallTextStyle),
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
          child: expanded
              ? Text(comment, style: kSmallTextStyle)
              : Text(
                  comment,
                  style: kSmallTextStyle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
        ),
        _voting(),
      ],
    );
  }

  Row _voting() {
    return Row(
      children: [
        SizedBox(width: 35),
        IconButton(
          icon: Icon(FontAwesomeIcons.thumbsUp,
              size: 20, color: Colors.lightGreen),
          onPressed: () {
            ///
          },
        ),
        Text(like.toString(), style: kSmallTextStyle),
        SizedBox(width: 10),
        IconButton(
          icon: Icon(FontAwesomeIcons.thumbsDown,
              size: 20, color: Colors.redAccent),
          onPressed: () {
            ///
          },
        ),
        Text(dislike.toString(), style: kSmallTextStyle),
      ],
    );
  }
}

// factory CommentModel.fromJson(json, int index) {
//   return CommentModel(
//     comment: json["comment"],
//     name: json[""],
//     rating: json["rating"],
//     image: json[""],
//     date: json[""],
//     like: json[""],
//     dislike: json[""],
//     score: json[""],
//   );
// }
