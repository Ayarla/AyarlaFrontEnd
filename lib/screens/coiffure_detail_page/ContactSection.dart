import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/coiffeurModel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  final CoiffureModel coiffureModel;

  ContactSection({this.coiffureModel});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      children: [
        Text('İletişim', style: kTextStyle),
        Text(coiffureModel.address, style: kSmallTextStyle),
        SizedBox(height: 10),
        Row(
          children: [
            Text('Telefon: ', style: kSmallTextStyle),
            Icon(Icons.call, size: 20, color: Colors.green),
            TextButton(
              child: Text(
                coiffureModel.telephone,
                style: kSmallTextStyle.copyWith(color: Colors.blue),
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
