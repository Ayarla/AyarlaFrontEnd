import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:ayarla/virtual_data_base/dynamic_links_service.dart';
import 'welcome_page.dart';

class LoadingScreen extends StatefulWidget {
  static const id = 'LoadingScreen';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 1),
      () => Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            // ignore: non_constant_identifier_names
            pageBuilder: (context, FadeIn, FadeInDown) => WelcomePage()),
        ModalRoute.withName(WelcomePage.id),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// THE PLACE WE FETCH ALL COIFFURE LIST.
    Provider.of<AppointmentData>(context, listen: false).getAllCoiffures();
    return Container(
      color: Color(0xFFeceff1),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.3,
          child: Hero(
            tag: 'logo',
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage('assets/genel_logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
