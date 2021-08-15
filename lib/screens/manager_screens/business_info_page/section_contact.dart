import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/components/ayarla_textfield.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text('Adres', style: kTextStyle),

        ///MAP
        Center(
          child: GenericIconButton(
            iconContext: Icon(Icons.map_rounded),
            textStyle: kTextStyle,
            text: "Haritadan Bulunuz",
            axis: Axis.horizontal,
            onPressed: () => Navigator.pushNamed(context, "/Harita"),
          ),
        ),
        Center(child: Text('veya', style: kSmallTextStyle)),
        SizedBox(height: 10),
        AyarlaTextFormField(
          hintText: 'Adres giriniz',
          keyboardType: TextInputType.multiline,
          maxLines: 3,
        ),
        SizedBox(height: 30),

        /// Telephone
        Text('Telefon', style: kTextStyle),
        SizedBox(height: 10),
        AyarlaTextFormField(
          hintText: 'Telefon Giriniz - 555-555 555 55 55',
          keyboardType: TextInputType.number,
          inputFormatter: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
