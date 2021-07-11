import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/components/ayarla_textfield.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/constants/router.dart';
import 'package:flutter/material.dart';

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
        AyarlaTextField(hintText: Text('Adres giriniz', maxLines: null)),
        SizedBox(height: 10),
        // Container(
        //   width: size.width * 0.83,
        //   child: TextFormField(
        //       controller: TextEditingController(
        //           text: Provider.of<BusinessAndUserData>(context,
        //                   listen: true)
        //               .pickedResult
        //               .formattedAddress),
        //       keyboardType: TextInputType.multiline,
        //       autofocus: false,
        //       decoration: InputDecoration(
        //         hintText: 'Adres giriniz',
        //         border: OutlineInputBorder(
        //           borderRadius: BorderRadius.circular(20.0),
        //         ),
        //       )),
        // ),
        SizedBox(height: 20),

        /// Telephone
        Text('Telefon', style: kTextStyle),
        SizedBox(height: 10),

        /// TODO
        AyarlaTextField(hintText: Text('Telefon Giriniz - 555-555 555 55 55')),
        SizedBox(height: 10),
        // Container(
        //   width: size.width * 0.35,
        //   child: TextFormField(
        //       controller: TextEditingController(
        //           text: Provider.of<BusinessAndUserData>(context,
        //                   listen: true)
        //               .pickedResult
        //               .formattedPhoneNumber),
        //       maxLength: 13,
        //       textAlign: TextAlign.center,
        //       keyboardType: TextInputType.number,
        //       inputFormatters: <TextInputFormatter>[
        //         FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        //       ],
        //       autofocus: false,
        //       maxLines: null,
        //       decoration: InputDecoration(
        //         contentPadding: EdgeInsets.all(0),
        //         counter: Offstage(),
        //         hintText: '555-5555555',
        //         hintStyle: kSmallTextStyle,
        //         border: OutlineInputBorder(
        //           borderRadius: new BorderRadius.circular(20.0),
        //           borderSide: new BorderSide(),
        //         ),
        //       )),
        // ),
      ],
    );
  }
}
