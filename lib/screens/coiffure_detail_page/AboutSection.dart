import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/coiffeurModel.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatefulWidget {
  final CoiffureModel coiffureModel;
  AboutSection({this.coiffureModel});
  @override
  _AboutSectionState createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  bool flag = true;
  String text;
  String firstHalf;
  String secondHalf;

  @override
  void initState() {
    text = '${widget.coiffureModel.text}';

    if (text.length > 200) {
      firstHalf = text.substring(0, 200);
      secondHalf = text.substring(200, text.length);
    } else {
      firstHalf = text;
      secondHalf = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(firstHalf, style: kSmallTextStyle)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf),
                    style: kSmallTextStyle),
                SizedBox(width: double.infinity),
                Row(
                  children: [
                    Spacer(),
                    OutlinedButton(
                      child: SizedBox(
                        width: 85,
                        child: Text(
                          flag ? "daha fazla" : "daha az",
                          style: kSmallTextStyle.copyWith(color: Colors.blue),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          flag = !flag;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
