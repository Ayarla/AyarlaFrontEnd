import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/coiffeurModel.dart';
import 'package:flutter/material.dart';

class WorkingHoursSection extends StatelessWidget {
  final CoiffureModel coiffureModel;
  WorkingHoursSection({this.coiffureModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(Icons.access_time,
            color: Colors.grey.withOpacity(0.8), size: 20),
        SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Text(
            coiffureModel.time,
            style: kSmallTextStyle.copyWith(
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
        ),
      ],
    );
  }
}