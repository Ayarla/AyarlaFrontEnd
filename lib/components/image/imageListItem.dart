import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:ayarla/constants/constants.dart';

class ImageListItem extends StatelessWidget {
  final String image;
  final bool covered;
  final bool isPicked;
  final PickedFile  pickedFile;
  final bool isWeb;
/// isFile koşulu imageListItem kullanılan yerlere eklenilecek
  ImageListItem({this.image,this.covered,this.isPicked=false,this.pickedFile,this.isWeb});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kCardShadow,
      child: PhotoView(
        maxScale:  covered?PhotoViewComputedScale.covered:PhotoViewComputedScale.contained,
        minScale: covered?PhotoViewComputedScale.covered:PhotoViewComputedScale.contained,
        initialScale: covered?PhotoViewComputedScale.covered:PhotoViewComputedScale.contained,
        imageProvider:isWeb?NetworkImage(pickedFile.path):FileImage(File(pickedFile.path)),
      ),
    );
  }
}