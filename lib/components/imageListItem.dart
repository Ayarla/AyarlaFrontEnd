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
/// isFile koşulu imageLisİtem kullanılan yerlere eklenilecek

  ImageListItem({this.image,this.covered,this.isFile,this.file});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kCardShadow,
      child: PhotoView(
        maxScale:  covered?PhotoViewComputedScale.covered:PhotoViewComputedScale.contained,
        minScale: covered?PhotoViewComputedScale.covered:PhotoViewComputedScale.contained,
        initialScale: covered?PhotoViewComputedScale.covered:PhotoViewComputedScale.contained,
        imageProvider:isFile!=null?Image.file(file).image:AssetImage(image),
      ),
    );
  }
}
