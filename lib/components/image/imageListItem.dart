import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_view/photo_view.dart';
import 'package:ayarla/constants/constants.dart';

class ImageListItem extends StatelessWidget {
  final String image;
  final File file;
  final bool covered;
  final bool isFile;
  final bool isImage;
  final Image fileImage;
/// isFile koşulu imageListItem kullanılan yerlere eklenilecek
  ImageListItem({this.image,this.covered,this.isFile,this.file,this.isImage=false,this.fileImage});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kCardShadow,
      child: PhotoView(
        maxScale:  covered?PhotoViewComputedScale.covered:PhotoViewComputedScale.contained,
        minScale: covered?PhotoViewComputedScale.covered:PhotoViewComputedScale.contained,
        initialScale: covered?PhotoViewComputedScale.covered:PhotoViewComputedScale.contained,
        imageProvider:isFile==true?Image.file(file).image:isImage==true?fileImage.image:AssetImage(image),
      ),
    );
  }
}