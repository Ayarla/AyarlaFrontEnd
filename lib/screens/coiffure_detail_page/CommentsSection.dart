import 'package:ayarla/models/model_coiffure.dart';
import 'package:ayarla/models/model_comment.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

/// TODO - Make necessary implementations for relevant coiffure.
class CommentsSection extends StatelessWidget {
  // final CoiffureModel coiffureModel;
  // CommentsSection({this.coiffureModel});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(enableInfiniteScroll: false, enlargeCenterPage: false, height: 160),
      items: [
        CommentModel(
          userName: 'Fatih Özkan',
          rating: 2,
          comment: 'Harika!!',
          userImage: 'assets/worker_1.png',
          date: '21.10.2018',
          like: 5,
          dislike: 0,
        ),
        CommentModel(
          userName: 'Nixu',
          rating: 2,
          comment: 'Merhaba ben çok uzun bir yorum yazmak istiyorum. '
              'Uzun uzun anlatayım bir şeylerrrr.'
              'Merhaba ben çok uzun bir yorum yazmak istiyorum. '
              'Uzun uzun anlatayım bir şeylerrrr.'
              'Merhaba ben çok uzun bir yorum yazmak istiyorum. '
              'Uzun uzun anlatayım bir şeylerrrr.',
          userImage: 'assets/worker_1.png',
          date: '21.10.2020',
          like: 9,
          dislike: 4,
        ),
        CommentModel(
          userName: 'Bahadır İren',
          rating: 3,
          comment: 'Daha iyilerini görmüştüm ama idare eder. '
              'Ben de uzun bir yorum yazmak istiyorum.'
              'Ben de uzun bir yorum yazmak istiyorum.'
              'Ben de uzun bir yorum yazmak istiyorum.'
              'Ben de uzun bir yorum yazmak istiyorum.'
              'Ben de uzun bir yorum yazmak istiyorum.'
              'Ben de uzun bir yorum yazmak istiyorum.',
          userImage: 'assets/worker_2.jpg',
          date: '21.02.2021',
          like: 13,
          dislike: 1,
        ),
      ],
    );
  }
}
