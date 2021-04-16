import 'dart:async';
import 'package:ayarla/constants/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 1),
      () => Routers.router.navigateTo(context, "/Hosgeldiniz"),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
