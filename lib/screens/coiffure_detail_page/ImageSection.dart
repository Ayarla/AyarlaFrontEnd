import 'package:ayarla/components/UI/responsiveWidget.dart';
import 'package:ayarla/components/image/imageListItem.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSection extends StatefulWidget {
  final List<ImageListItem> pages;
  ImageSection({@required this.pages});
  @override
  _ImageSectionState createState() => _ImageSectionState();
}

class _ImageSectionState extends State<ImageSection> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        ResponsiveWidget(
            smallScreen: Padding(
              padding: const EdgeInsets.all(0.0),
              child: imageBody(),
            ),
            mediumScreen: Padding(
              padding: EdgeInsets.only(
                  left: size.width / 10, right: size.width / 10),
              child: imageBody(),
            ),
            largeScreen: Padding(
              padding:
                  EdgeInsets.only(left: size.width / 5, right: size.width / 5),
              child: imageBody(),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.pages.map((url) {
            int index = widget.pages.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 0.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  GestureDetector imageBody() {
    return GestureDetector(
      child: CarouselSlider(
        items: widget.pages
            .map(
              (element) => ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  element.image,
                  fit: BoxFit.cover,
                ),
              ),
            )
            .toList(),
        options: CarouselOptions(
          viewportFraction: 1,
          autoPlayInterval: Duration(seconds: 6),
          autoPlay: true,
          enableInfiniteScroll: true,
          aspectRatio: 1.6,
          onPageChanged: (index, reason) {
            setState(() {
              _currentPage = index;
            });
          },
        ),
      ),
    );
  }
}
