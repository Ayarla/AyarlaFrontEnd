import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/model_coiffure.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutSection extends StatelessWidget {
  final CoiffureModel coiffureModel;
  // final ScrollController controller;
  AboutSection({
    this.coiffureModel,
    // this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double smallFontSize = size.width <= 400 ? size.width / 25 : 16;
    Color translucent = Colors.grey.withOpacity(0.8);
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            for (int i = 0; i < coiffureModel.star; i++) Icon(Icons.star, color: Colors.yellow.shade700, size: smallFontSize),
            for (int i = coiffureModel.star.toInt(); i < 5; i++)
              Icon(Icons.star_border, color: Colors.yellow.shade700, size: smallFontSize),
            Text(
              '(${coiffureModel.totalComment} değerlendirme)',
              style: kSmallTextStyle.copyWith(color: Colors.grey.withOpacity(0.8), fontSize: smallFontSize),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(FontAwesomeIcons.mapMarkerAlt, size: smallFontSize, color: Colors.red),
            SizedBox(width: 4),
            Text(
              '${coiffureModel.city}, ${coiffureModel.district}',
              style: kSmallTextStyle.copyWith(color: translucent, fontSize: smallFontSize),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.access_time, color: translucent, size: smallFontSize),
            SizedBox(width: 10),
            Padding(
              padding: EdgeInsets.only(top: 2.0),
              child: Text(
                /// TODO
                // coiffureModel.time[0] != null ? coiffureModel.time[0] :
                'Girilmedi', style: kSmallTextStyle.copyWith(color: translucent, fontSize: smallFontSize),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        ExpandableText(
          padding: EdgeInsets.all(5.0),
          textWidget: Text(coiffureModel.text ?? 'Girilmedi',
              maxLines: 3, overflow: TextOverflow.ellipsis, style: kSmallTextStyle.copyWith(fontSize: smallFontSize)),
          animationDuration: Duration(milliseconds: 300),
          backGroundColor: Colors.transparent,
          // onPressed: () => controller.animateTo(size.width / 3,
          //     duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn),
        ),
      ],
    );
  }
}
