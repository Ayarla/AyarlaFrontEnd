import 'package:ayarla/components/comment.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        // autoPlay: true,
      ),
      items: [1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: size.width / 35),
              physics: BouncingScrollPhysics(),
              children: [
                Comment(
                  name: 'Fatih Özkan',
                  rating: 2,
                  comment: 'Harika!!',
                  image: 'assets/worker_1.png',
                  date: '21.10.2018',
                  like: 5,
                  dislike: 0,
                ),
                Divider(thickness: 1),
                Comment(
                  name: 'Nixu',
                  rating: 2,
                  comment:
                  'Merhaba ben çok uzun bir yorum yazmak istiyorum. '
                      'Uzun uzun anlatayım bir şeylerrrr.'
                      'Merhaba ben çok uzun bir yorum yazmak istiyorum. '
                      'Uzun uzun anlatayım bir şeylerrrr.'
                      'Merhaba ben çok uzun bir yorum yazmak istiyorum. '
                      'Uzun uzun anlatayım bir şeylerrrr.',
                  image: 'assets/worker_1.png',
                  date: '21.10.2020',
                  like: 9,
                  dislike: 4,
                ),
                Divider(thickness: 1),
                Comment(
                  name: 'Bahadır İren',
                  rating: 3,
                  comment: 'Daha iyilerini görmüştüm ama idare eder. '
                      'Ben de uzun bir yorum yazmak istiyorum.'
                      'Ben de uzun bir yorum yazmak istiyorum.'
                      'Ben de uzun bir yorum yazmak istiyorum.'
                      'Ben de uzun bir yorum yazmak istiyorum.'
                      'Ben de uzun bir yorum yazmak istiyorum.'
                      'Ben de uzun bir yorum yazmak istiyorum.',
                  image: 'assets/worker_2.jpg',
                  date: '21.02.2021',
                  like: 13,
                  dislike: 1,
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}