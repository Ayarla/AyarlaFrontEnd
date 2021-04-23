import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/coiffeurModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SmallLocationSection extends StatelessWidget {
  final CoiffureModel coiffureModel;

  SmallLocationSection({this.coiffureModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          FontAwesomeIcons.mapMarkerAlt,
          size: 12,
          color: Colors.red,
        ),
        SizedBox(width: 4),
        Text(
          '${coiffureModel.city}, ${coiffureModel.district}',
          style: kSmallTextStyle.copyWith(
            color: Colors.grey.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}
