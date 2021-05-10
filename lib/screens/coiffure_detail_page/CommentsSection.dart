import 'package:ayarla/models/commentModel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CommentsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enableInfiniteScroll: false,
        enlargeCenterPage: false,
        height: 160,
      ),
      items: [
        CommentModel(
          name: 'Fatih Özkan',
          rating: 2,
          comment: 'Harika!!',
          image: 'assets/worker_1.png',
          date: '21.10.2018',
          like: 5,
          dislike: 0,
        ),
        CommentModel(
          name: 'Nixu',
          rating: 2,
          comment: 'Merhaba ben çok uzun bir yorum yazmak istiyorum. '
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
        CommentModel(
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
  }
}
