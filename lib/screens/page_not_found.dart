import 'package:ayarla/components/UI/logos&icons&texts.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: AppBarTitleCustomer(),
        color: Color(0xFF90a4ae).withOpacity(0.4),
        showBackButton: false,
      ).build(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: Text('Aradığınız Sayfayı Bulamadık', style: kTitleStyle)),
          SizedBox(height: 5),
          TextButton(
            child: Text('Anasayfaya Dön', style: kTitleStyle),
            onPressed: () => Navigator.pushNamed(context, '/Hosgeldiniz'),
          ),
        ],
      ),
    );
  }
}
