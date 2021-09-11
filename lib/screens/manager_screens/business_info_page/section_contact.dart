import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/components/ayarla_textfield.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/services/service_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ContactSection extends StatefulWidget {
  @override
  _ContactSectionState createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
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
          initialValue: Provider.of<ManagementService>(context, listen: false).currentCoiffure.address,
          hintText: 'Adres giriniz',
          keyboardType: TextInputType.multiline,
          maxLines: 3,
          onChanged: (value) =>
              setState(() => Provider.of<ManagementService>(context, listen: false).currentCoiffure.address = value),
        ),
        SizedBox(height: 30),

        /// Telephone
        Text('Telefon', style: kTextStyle),
        SizedBox(height: 10),
        AyarlaTextFormField(
          initialValue: Provider.of<ManagementService>(context, listen: false).currentCoiffure.telephone,
          hintText: 'Telefon Giriniz - 555-555 555 55 55',
          keyboardType: TextInputType.number,
          inputFormatter: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
          onChanged: (value) =>
              setState(() => Provider.of<ManagementService>(context, listen: true).currentCoiffure.telephone = value),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
