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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Ratings
        Text("Hakkında", style: kTitleStyle),
        SizedBox(height: 5),

        /// Location
        SizedBox(
          width: size.width,
          child: Row(
            children: [
              Icon(
                FontAwesomeIcons.mapMarkerAlt,
                size: size.width <= 400 ? size.width / 16 : 25,
                color: Colors.red.shade600,
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 100,
                child: TextField(
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.green, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    hintText: 'İl',
                    hintStyle: kSmallTextStyle,
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    isDense: true,
                    contentPadding:
                        EdgeInsets.only(left: 15, top: 14, bottom: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 100,
                child: TextField(
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.green, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    hintText: 'İlçe',
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    isDense: true,
                    hintStyle: kSmallTextStyle,
                    contentPadding:
                        EdgeInsets.only(left: 15, top: 14, bottom: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Icon(
                FontAwesomeIcons.edit,
                color: Colors.green.shade700,
                size: size.width <= 400 ? size.width / 16 : 25,
              ),
            ],
          ),
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
              TimeDropdown(
                selected: "00:00",
                timeList: dividedHours,
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  "-",
                  style: kSmallTextStyle.copyWith(
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ),
              ),
              TimeDropdown(
                selected: "00:00",
                timeList: dividedHours,
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text('Randevu aralığı belirleyiniz: ',
                style: kSmallTextStyle.copyWith(
                    color: Colors.black.withOpacity(0.8))),
            TimeDropdown(
              selected: '0',
              timeList: dividedMinutes,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text('dk',
                  style: kSmallTextStyle.copyWith(
                      color: Colors.black.withOpacity(0.8))),
            ),
          ],
        ),
        SizedBox(height: 10),

        /// About text
        TextFormField(
            keyboardType: TextInputType.multiline,
            autofocus: false,
            maxLines: null,
            cursorColor: Colors.green,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green, width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
              hintStyle: kSmallTextStyle,
              fillColor: Colors.grey.shade200,
              filled: true,
              isDense: true,
              contentPadding: EdgeInsets.only(left: 15, top: 14, bottom: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none,
              ),
              hintText: 'Kuaför hakkındaki bilgileri giriniz',
            )),
      ],
    );
  }
}
