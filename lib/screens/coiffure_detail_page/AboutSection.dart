import 'package:ayarla/components/core/expandable_ayarla.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/model_coiffeur.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutSection extends StatelessWidget {
  final CoiffureModel coiffureModel;
  final ScrollController controller;
  AboutSection(this.coiffureModel, {this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: <Widget>[
            for (int i = 0; i < coiffureModel.star; i++)
              Icon(
                Icons.star,
                color: Colors.yellow.shade700,
                size: 20,
              ),
            for (int i = coiffureModel.star.toInt(); i < 5; i++)
              Icon(
                Icons.star_border,
                color: Colors.yellow.shade700,
                size: 20,
              ),
            Text(
              '(${coiffureModel.comments} değerlendirme)',
              style: kSmallTextStyle.copyWith(
                color: Colors.grey.withOpacity(0.8),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(FontAwesomeIcons.mapMarkerAlt, size: 12, color: Colors.red),
            SizedBox(width: 4),
            Text(
              '${coiffureModel.city}, ${coiffureModel.district}',
              style: kSmallTextStyle.copyWith(
                color: Colors.grey.withOpacity(0.8),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
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
        ),
        SizedBox(height: 10),
        AyarlaExpandable.singleTextChild(
          text: coiffureModel.text,
          maxLines: 3,
          animationDuration: Duration(milliseconds: 200),
          backGroundColor: Colors.transparent,
          onPressed: () => controller.animateTo(size.width / 3,
              duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn),
        ),
      ],
    );
  }
}
