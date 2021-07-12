import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/components/ayarla_textfield.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/constants/router.dart';
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
            height: 30,
            width: 250,
            axis: Axis.horizontal,
            onPressed: () => Routers.router.navigateTo(context, "/Harita"),
          ),
        ),
        Center(child: Text('veya', style: kSmallTextStyle)),
        SizedBox(height: 10),

        /// TODO
        AyarlaTextFormField(
          hintText: 'Adres giriniz',
          keyboardType: TextInputType.multiline,
        ),
        SizedBox(height: 10),
        SizedBox(height: 20),

        /// Telephone
        Text('Telefon', style: kTextStyle),
        SizedBox(height: 10),

        /// TODO
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
