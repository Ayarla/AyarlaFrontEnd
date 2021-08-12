import 'dart:io';
import 'package:flutter/material.dart';


class UserImage extends StatelessWidget {
  final bool isFile;
  final File fileImage;
  final Image image;
  UserImage({this.isFile=false,this.fileImage,this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius:
        BorderRadius.circular(50),
        child:
            isFile == true?
            Image.file(
              fileImage,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ):
        image
    );
  }
}
