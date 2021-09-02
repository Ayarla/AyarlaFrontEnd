import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class UserImage extends StatelessWidget {
  final PickedFile pickedFile;
  final bool isWeb;
  UserImage({this.pickedFile,this.isWeb});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius:
        BorderRadius.circular(50),
        child: isWeb ? Image.network(pickedFile.path): Image.file(File(pickedFile.path),fit: BoxFit.cover,
          width: double.infinity,)
    );
  }
}
