import 'package:ayarla/components/ayarla_textfield.dart';
import 'package:ayarla/components/timeDropdown.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutSectionBusiness extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Ratings
        Text("Hakkında", style: kTitleStyle),
        SizedBox(height: 5),

        /// Location
        Row(
          children: [
            Icon(
              FontAwesomeIcons.mapMarkerAlt,
              size: size.width <= 400 ? size.width / 16 : 25,
              color: Colors.red.shade600,
            ),
            SizedBox(width: 10),
            SizedBox(
              width: 120,
              child: AyarlaTextField(
                  hintText: Text('İl Giriniz', style: kSmallTextStyle)),
            ),
            SizedBox(width: 10),
            SizedBox(
              width: 120,
              child: AyarlaTextField(
                  hintText: Text('İlçe Giriniz', style: kSmallTextStyle)),
            ),
            SizedBox(width: 10),
            Icon(
              FontAwesomeIcons.edit,
              color: Colors.green.shade700,
              size: size.width <= 400 ? size.width / 16 : 25,
            ),
          ],
        ),
        SizedBox(height: 5),

        /// Working hours
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.access_time,
                color: Colors.blueGrey,
                size: size.width <= 400 ? size.width / 16 : 25,
              ),
              SizedBox(width: 10),
              TimeDropdown(selected: "00:00", timeList: dividedHours),
              Text(
                " - ",
                style: kSmallTextStyle.copyWith(
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
              TimeDropdown(selected: "00:00", timeList: dividedHours),
            ],
          ),
        ),
        Row(
          children: [
            Text('Randevu aralığı belirleyiniz: ',
                style: kSmallTextStyle.copyWith(
                    color: Colors.black.withOpacity(0.8))),
            TimeDropdown(selected: '0', timeList: dividedMinutes),
            Text(' dk',
                style: kSmallTextStyle.copyWith(
                    color: Colors.black.withOpacity(0.8))),
          ],
        ),
        SizedBox(height: 10),

        /// About text
        /// TODO - fix
        AyarlaTextField(
          hintText: Text(
            'Kuaför hakkındaki bilgileri giriniz',
            style: kSmallTextStyle,
            maxLines: 2,
          ),
          keyboardType: TextInputType.multiline,
        ),
      ],
    );
  }
}
