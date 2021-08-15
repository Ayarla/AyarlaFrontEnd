import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/services/businessOrUser_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

privacyOrAgreementModalBottomSheet(
    {BuildContext context, StateSetter setState, String heading, String content}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
    child: Container(
      height: context.size.height * 0.9,
      child: Column(
        children: <Widget>[
          Container(
            height: 70,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  right: 50,
                  left: 50,
                  child: Text(
                    heading,
                    textAlign: TextAlign.center,
                    style: kTitleStyle.copyWith(fontSize: context.size.width < 400 ? 16 : 22),
                  ),
                ),
                Positioned(
                  right: context.size.width < 650 ? 0 : 10,
                  child: IconButton(
                    icon: Icon(Icons.cancel_outlined, size: 30, color: Colors.red),
                    iconSize: 30,
                    onPressed: () {
                      setState(() {
                        Provider.of<BusinessAndUserData>(context, listen: false).checkBox = false;
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                Text(content, style: kSmallTextStyle),
              ],
            ),
          ),
          Spacer(),
          Container(
            width: 190,
            child: GenericIconButton(
              spaceBetween: 10,
              axis: Axis.horizontal,
              iconContext: Icon(Icons.check, size: 30, color: Colors.green),
              text: 'Onaylıyorum',
              onPressed: () {
                setState(() {
                  Provider.of<BusinessAndUserData>(context, listen: false).checkBox = true;
                });
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    ),
  );
}
