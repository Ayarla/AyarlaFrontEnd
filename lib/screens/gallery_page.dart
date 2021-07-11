import 'package:flutter/material.dart';
import 'package:ayarla/components/dotsIndicator.dart';
import 'package:ayarla/components/imageListItem.dart';

class GalleryPage extends StatelessWidget {
  final int index;
  GalleryPage({this.index});
  final List<Widget> _pages = <Widget>[
    ImageListItem(image: "assets/kuafor_0.png"),
    ImageListItem(image: "assets/kuafor_1.jpg"),
    ImageListItem(image: "assets/kuafor_2.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    final PageController ctrl = PageController(
      initialPage: index,
    );
    return SafeArea(
      child: Container(
        child: Stack(children: [
          PageView(
            controller: ctrl,
            children: [
              ImageListItem(image: "assets/kuafor_0.png", covered: false),
              ImageListItem(image: "assets/kuafor_1.jpg", covered: false),
              ImageListItem(image: "assets/kuafor_2.jpg", covered: false),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.grey[800].withOpacity(0.5),
              padding: EdgeInsets.all(3.0),
              child: Center(
                child: DotsIndicator(
                  controller: ctrl,
                  itemCount: _pages.length,
                  onPageSelected: (int page) {
                    ctrl.animateToPage(
                      index,
                      duration: Duration(milliseconds: 3),
                      curve: Curves.ease,
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: RawMaterialButton(
              child: Icon(Icons.clear, color: Colors.white),
              constraints: BoxConstraints(),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ]),
      ),
    );
  }
}
