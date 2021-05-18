import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/model_coiffeur.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  final CoiffureModel coiffureModel;

  ContactSection({this.coiffureModel});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      runSpacing: 10,
      children: [
        Text('Adres', style: kTextStyle),
        SizedBox(height: 5),
        Text(coiffureModel.address, style: kSmallTextStyle),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Telefon: ', style: kTextStyle),
            Icon(Icons.call, color: Colors.green,),
            TextButton(
               child: Text(
                 coiffureModel.telephone,
                 style: kSmallTextStyle.copyWith(color: Colors.green),
               ),
               onPressed: () {
                 launch("tel://${coiffureModel.telephone}");
               },
             ),
          ],
        ),
      ],
    );
  }
}
