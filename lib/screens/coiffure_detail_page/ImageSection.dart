import 'package:ayarla/components/imageListItem.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
    Key key,
    @required List<ImageListItem> pages,
    @required int currentPage,
  })  : _pages = pages,
        _currentPage = currentPage,
        super(key: key);

  final List<ImageListItem> _pages;
  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: CarouselSlider(
            items: _pages
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
              enableInfiniteScroll: false,
              aspectRatio: 1.6,
              // onPageChanged: (index, reason) {
              //   setState(() {
              //     _currentPage = index;
              //   });
              // }),
            ),
          ),
        ),
        // GestureDetector(
        //   child: Container(
        //     decoration: kCardShadow,
        //     child: ClipRRect(
        //       borderRadius:
        //           const BorderRadius.all(Radius.circular(8.0)),
        //       child: CarouselSlider(
        //         items: _pages,
        //         options: CarouselOptions(
        //             viewportFraction: 1,
        //             autoPlayInterval:
        //                 Duration(seconds: autoChangeSeconds),
        //             autoPlay: true,
        //             enableInfiniteScroll: false,
        //             aspectRatio: 1.6,
        //             onPageChanged: (index, reason) {
        //               setState(() {
        //                 _currentPage = index;
        //               });
        //             }),
        //       ),
        //     ),
        //   ),
        //
        //   // onTap: () {
        //   //   Navigator.push(
        //   //     context,
        //   //     MaterialPageRoute(
        //   //       builder: (context) =>
        //   //           GalleryPage(index: _currentPage),
        //   //     ),
        //   //   );
        //   // },
        //
        //   ///stops passing the pages automatically
        //   onLongPress: () {
        //     setState(() {
        //       pressed = true;
        //     });
        //   },
        //   onLongPressUp: () {
        //     setState(() {
        //       pressed = false;
        //     });
        //   },
        // ),

        /// dot indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _pages.map((url) {
            int index = _pages.indexOf(url);
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
}