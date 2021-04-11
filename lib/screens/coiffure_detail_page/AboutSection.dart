import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/coiffeurModel.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatefulWidget {
  final String firstHalf;
  final String secondHalf;
  AboutSection({
    this.firstHalf,
    this.secondHalf,
  });

  @override
  _AboutSectionState createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  bool flag = true;
  String text;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.secondHalf.isEmpty
          ? Text(
              widget.firstHalf,
              style: kSmallTextStyle,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  flag
                      ? (widget.firstHalf + "...")
                      : (widget.firstHalf + widget.secondHalf),
                  style: kSmallTextStyle,
                ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        flag ? "daha fazla" : "daha az",
                        style: kSmallTextStyle.copyWith(color: Colors.blue),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
