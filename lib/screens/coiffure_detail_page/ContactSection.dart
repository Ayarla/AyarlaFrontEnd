import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/model_coiffure.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  final CoiffureModel coiffureModel;
  ContactSection({this.coiffureModel});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Adres',
            style:
                kTextStyle.copyWith(fontSize: width <= 400 ? width / 20 : 20)),
        SizedBox(height: 5),
        Text(coiffureModel.address,
            style: kSmallTextStyle.copyWith(
                fontSize: width <= 400 ? width / 25 : 16)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Telefon: ',
              style:
                  kTextStyle.copyWith(fontSize: width <= 400 ? width / 20 : 20),
            ),
            Icon(
              Icons.call,
              color: Colors.green,
              size: width <= 400 ? width / 20 : 20,
            ),
            TextButton(
              child: Text(
                coiffureModel.telephone,
                style: kSmallTextStyle.copyWith(
                    color: Colors.green,
                    fontSize: width <= 400 ? width / 25 : 16),
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
