import 'package:ayarla/components/image/imageListItem.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/services/service_management.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageSectionBusiness extends StatefulWidget {
  @override
  _ImageSectionBusinessState createState() => _ImageSectionBusinessState();
}

class _ImageSectionBusinessState extends State<ImageSectionBusiness> {
  int autoChangeSeconds = 6;
  Functions functions = Functions();
  int _currentPage = 0;
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    final List<ImageListItem> _pages =
        Provider.of<ManagementService>(context, listen: true).pages;
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        GestureDetector(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.grey.shade200,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: _pages.length == 0
                      ? Container(
                          height: size.height * 0.35,
                          width: size.width,
                          child: IconButton(
                            icon: Icon(
                              Icons.add_a_photo,
                              color: Colors.green.shade700,
                            ),
                            onPressed: () {
                              functions.showPicker(context);
                              setState(() {
                                //isChanged = true;
                              });
                            },
                          ),
                        )
                      : CarouselSlider(
                          items: _pages,
                          options: CarouselOptions(
                              viewportFraction: 1,
                              autoPlayInterval:
                                  Duration(seconds: autoChangeSeconds),
                              autoPlay: true,
                              enableInfiniteScroll: false,
                              aspectRatio: 1.6,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentPage = index;
                                });
                              }),
                        ),
                ),
              ),
              if (_pages.length != 0)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.add_circle,
                            color: Colors.green,
                            size: 40,
                          ),
                          onTap: () {
                            functions.showPicker(context);
                            setState(() {
                              //isChanged = true;
                            });
                          },
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                            size: 40,
                          ),
                          onTap: () {
                            if (_pages.length == 1) {
                              Provider.of<ManagementService>(context,
                                      listen: false)
                                  .deleteImage(_pages[0]);
                            } else {
                              Provider.of<ManagementService>(context,
                                      listen: false)
                                  .deleteImage(_pages[_currentPage]);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),

          ///stops passing the pages automatically
          onLongPress: () {
            setState(() {
              pressed = true;
            });
          },
          onLongPressUp: () {
            setState(() {
              pressed = false;
            });
          },
        ),

        /// dot indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _pages.map((url) {
            int index = _pages.indexOf(url);
            return Container(
              width: 8.0,
              height: 20.0,
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
