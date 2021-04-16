import 'package:ayarla/screens/popUpScreens/registrationPopUp.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => RegistrationPopUp().mailFieldDialog(context: context),
        child: Text('Kayıt'));
  }
}
