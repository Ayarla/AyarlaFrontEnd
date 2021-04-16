import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/constants/router.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AcceptButton extends StatelessWidget {
  final Function acceptCondition;
  AcceptButton({this.acceptCondition});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('Onayla',
          style: kSmallTextStyle.copyWith(
              color: Colors.blue, fontWeight: FontWeight.bold)),
      onPressed: acceptCondition,
    );
  }
}

class CancelButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('İptal',
          style: kSmallTextStyle.copyWith(
              color: Colors.red, fontWeight: FontWeight.bold)),
      onPressed: () {
        Routers.router.pop(context);
      },
    );
  }
}
