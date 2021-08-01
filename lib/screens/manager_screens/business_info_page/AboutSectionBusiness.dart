import 'package:ayarla/components/ayarla_textfield.dart';
import 'package:ayarla/components/timeDropdown.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutSectionBusiness extends StatelessWidget {
  String selectedStart = '00:00';
  String selectedEnd = '00:00';

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
            SizedBox(width: 120, child: AyarlaTextFormField(hintText: 'İl Giriniz')),
            SizedBox(width: 10),
            SizedBox(width: 120, child: AyarlaTextFormField(hintText: 'İlçe Giriniz')),
            SizedBox(width: 10),
          ],
        ),
        SizedBox(height: 5),

        /// Working hours
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.access_time,
                color: Colors.blueGrey,
                size: size.width <= 400 ? size.width / 16 : 25,
              ),
              SizedBox(width: 10),
              TimeDropdown( timeList: dividedHours),
              Text(" - ", style: kSmallTextStyle.copyWith(color: Colors.grey.withOpacity(0.8))),
              TimeDropdown( timeList: dividedHours),
            ],
          ),
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text('Randevu aralığı belirleyiniz: ',
                style: kSmallTextStyle.copyWith(color: Colors.black.withOpacity(0.8))),
            TimeDropdown(defaultValue: '0' ,timeList: dividedMinutes),
            Text(' dk', style: kSmallTextStyle.copyWith(color: Colors.black.withOpacity(0.8))),
          ],
        ),
        SizedBox(height: 10),

        /// About text
        AyarlaTextFormField(
          hintText: 'Kuaför hakkındaki bilgileri giriniz',
          keyboardType: TextInputType.multiline,
          maxLines: 3,
        ),
      ],
    );
  }
}
