import 'package:ayarla/virtual_data_base/businessOrUser_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/models/functions.dart';

privacyPolicyModalBottomSheet({BuildContext context, StateSetter setState}) {
  final Size size = MediaQuery.of(context).size;
  final Functions functions = Functions();
  return Container(
    height: MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.height / 10),
    child: Scaffold(
      backgroundColor: Color(0xFFE5EBEE),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: <Widget>[
            Text(
              'Ayarla Gizlilik sozlesmesi',
            ),
            SizedBox(height: 10),
            Text(
                'sfhjskfjaksfhksafhjsahfjkshfksahdkfdskafksahfjkshagsgaskgkskagksadkgasgbsakjgfbskbfsjb'),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 32.0),
        child: Row(
          children: <Widget>[
            Container(
              width: size.width - 4 * (size.width / 6),
              decoration: BoxDecoration(
                gradient: functions.decideColor(context),
                borderRadius: BorderRadius.circular(15),
              ),
              child: FloatingActionButton.extended(
                elevation: 0,
                backgroundColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    Provider.of<BusinessAndUserData>(context, listen: false)
                        .checkBox = false;
                  });

                  Navigator.pop(context);
                },
                label: FittedBox(
                  fit: BoxFit.cover,
                  child: Icon(
                    Icons.cancel_outlined,
                    size: 40,
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              width: size.width - 4 * (size.width / 6),
              decoration: BoxDecoration(
                gradient: functions.decideColor(context),
                borderRadius: BorderRadius.circular(15),
              ),
              child: FloatingActionButton.extended(
                elevation: 0,
                backgroundColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    Provider.of<BusinessAndUserData>(context, listen: false)
                        .checkBox = true;
                  });
                  Navigator.pop(context);
                },
                label: FittedBox(
                  fit: BoxFit.cover,
                  child: Icon(
                    Icons.check,
                    size: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
