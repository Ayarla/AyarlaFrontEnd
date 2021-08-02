import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class UserImage extends StatelessWidget {
  final PickedFile pickedFile;
  UserImage({this.pickedFile});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius:
        BorderRadius.circular(50),
        child: Image.network(pickedFile.path)
    );
  }
}
