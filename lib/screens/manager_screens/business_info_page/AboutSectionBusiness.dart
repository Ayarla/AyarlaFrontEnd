import 'package:ayarla/components/timeDropdown.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class AboutSectionBusiness extends StatefulWidget {
  @override
  _AboutSectionBusinessState createState() => _AboutSectionBusinessState();
}

class _AboutSectionBusinessState extends State<AboutSectionBusiness> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        /// Ratings
        Text(
          "Hakkında",
          style: kTitleStyle,
        ),
        // RatingRow(
        //   number: 3,
        //   comment: 150,
        // ),

        /// Location
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.mapMarkerAlt,
              size: 12,
              color: Colors.red,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              'İstanbul, Sarıyer',
              style: kSmallTextStyle.copyWith(
                color: Colors.grey.withOpacity(0.8),
              ),
            ),
          ],
        ),

        /// TODO - fix
        TextButton(
            child: Text('Randevu aralığı belirleyiniz',
                style: kSmallTextStyle.copyWith(
                    color: Colors.grey.withOpacity(0.8))),
            onPressed: () {}),

        /// Working hours
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.access_time,
                color: Colors.grey.withOpacity(0.8), size: 20),
            SizedBox(width: 10),
            TimeDropdown(
              selected: "00:00",
            ),
            Text(
              "-",
              style: kSmallTextStyle.copyWith(
                color: Colors.grey.withOpacity(0.8),
              ),
            ),
            TimeDropdown(
              selected: "00:00",
            ),
          ],
        ),

        /// About text
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Container(
                width: size.width * 0.83,
                child: TextFormField(
                    onTap: () {
                      setState(() {
                        //isChanged = true;
                      });
                    },
                    keyboardType: TextInputType.multiline,
                    autofocus: false,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText:
                      'Kuaför hakkındaki bilgileri giriniz',
                      border: OutlineInputBorder(
                        borderRadius:
                        new BorderRadius.circular(20.0),
                        borderSide: new BorderSide(),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
