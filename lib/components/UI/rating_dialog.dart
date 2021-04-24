import 'package:flutter/cupertino.dart';
import 'package:rating_dialog/rating_dialog.dart';

class RatingDialogPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RatingDialog(
      title: 'Aldığınız Hizmeti Değerlendirin',
      message:
          'Puanınızı belirtmek için bir yıldıza tıklayın!',
      image: Image(
          image: AssetImage('assets/genel_logo.png'),
          alignment: AlignmentDirectional.center),
      commentHint: 'Yorumunuzu buraya yazabilirsiniz',
      submitButton: 'Gönder',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, comment: ${response.comment}');
        if (response.rating < 3.0) {
          // send their comments to your email or anywhere you wish
          // ask the user to contact you instead of leaving a bad review
        } else {
          // _rateAndReviewApp();
        }
      },
    );
  }
}
