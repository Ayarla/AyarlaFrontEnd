import 'package:ayarla/components/core/expandable_ayarla.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  final String aboutText;
  final ScrollController controller;
  AboutSection(this.aboutText, {this.controller});

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
    return AyarlaExpandable.singleTextChild(
      text: aboutText,
      maxLines: 3,
      animationDuration: Duration(milliseconds: 200),
      backGroundColor: Colors.transparent,
      onPressed: () => controller.animateTo(size.width/3,
          duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn),
    );
  }

}
