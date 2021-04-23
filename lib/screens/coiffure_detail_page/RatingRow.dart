import 'package:ayarla/constants/constants.dart';
import 'package:flutter/material.dart';

class RatingRow extends StatelessWidget {
  final String commentNumber;
  final int rating;

  RatingRow({this.rating, this.commentNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        for (int i = 0; i < rating; i++)
          Icon(
            Icons.star,
            color: Colors.yellow.shade700,
            size: 20,
          ),
        for (int i = rating; i < 5; i++)
          Icon(
            Icons.star_border,
            color: Colors.yellow.shade700,
            size: 20,
          ),
        Text(
          '($commentNumber değerlendirme)',
          style: kSmallTextStyle.copyWith(
            color: Colors.grey.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}