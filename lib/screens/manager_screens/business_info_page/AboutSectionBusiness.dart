import 'package:ayarla/components/ayarla_textfield.dart';
import 'package:ayarla/components/timeDropdown.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/services/service_management.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AboutSectionBusiness extends StatefulWidget {
  @override
  _AboutSectionBusinessState createState() => _AboutSectionBusinessState();
}

class _AboutSectionBusinessState extends State<AboutSectionBusiness> {
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
            Icon(FontAwesomeIcons.mapMarkerAlt, size: size.width <= 400 ? size.width / 16 : 25, color: Colors.red.shade600),
            SizedBox(width: 10),
            SizedBox(
              width: 120,
              child: AyarlaTextFormField(
                  initialValue: Provider.of<ManagementService>(context, listen: false).currentCoiffure.city,
                  hintText: 'İl Giriniz',
                  onChanged: (value) {
                    setState(() => Provider.of<ManagementService>(context, listen: false).currentCoiffure.city = value);
                  }),
            ),
            SizedBox(width: 10),
            SizedBox(
              width: 120,
              child: AyarlaTextFormField(
                  initialValue: Provider.of<ManagementService>(context, listen: false).currentCoiffure.district,
                  hintText: 'İlçe Giriniz',
                  onChanged: (value) {
                    setState(() => Provider.of<ManagementService>(context, listen: false).currentCoiffure.district = value);
                  }),
            ),
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
              Icon(Icons.access_time, color: Colors.blueGrey, size: size.width <= 400 ? size.width / 16 : 25),
              SizedBox(width: 10),
              TimeDropdown(
                timeList: dividedHours,
                defaultValue: Provider.of<ManagementService>(context, listen: false).currentCoiffure.time[0],
                onItemSelected: (value) {
                  setState(() {
                    Provider.of<ManagementService>(context, listen: false).currentCoiffure.time[0] = value;
                  });
                },
              ),
              Text(" - ", style: kSmallTextStyle.copyWith(color: Colors.grey.withOpacity(0.8))),
              TimeDropdown(
                timeList: dividedHours,
                defaultValue: Provider.of<ManagementService>(context, listen: false).currentCoiffure.time[1],
                onItemSelected: (value) {
                  setState(() => Provider.of<ManagementService>(context, listen: false).currentCoiffure.time[1] = value);
                },
              ),
            ],
          ),
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text('Randevu aralığı belirleyiniz: ', style: kSmallTextStyle.copyWith(color: Colors.black.withOpacity(0.8))),
            TimeDropdown(
              defaultValue: Provider.of<ManagementService>(context, listen: false).currentCoiffure.timePeriod ?? '0',
              timeList: dividedMinutes,
              onItemSelected: (value) {
                setState(() {
                  Provider.of<ManagementService>(context, listen: false).currentCoiffure.timePeriod = value;
                });
              },
            ),
            Text(' dk', style: kSmallTextStyle.copyWith(color: Colors.black.withOpacity(0.8))),
          ],
        ),
        SizedBox(height: 10),

        /// About text
        AyarlaTextFormField(
            initialValue: Provider.of<ManagementService>(context, listen: false).currentCoiffure.text,
            hintText: 'İşletmeniz hakkındaki bilgileri giriniz',
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            onChanged: (value) {
              setState(() => Provider.of<ManagementService>(context, listen: false).currentCoiffure.text = value);
            }),
      ],
    );
  }
}
