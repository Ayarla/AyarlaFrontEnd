import 'package:flutter/material.dart';
import 'package:randevudemo/constants/constants.dart';
import 'package:randevudemo/models/functions.dart';

///class'a eklemeler yapılabilir
class FloatingButton extends StatelessWidget {
  final String text;
  final Function function;
  final bool isGradient;
  final Color color;
  FloatingButton({this.text,this.function,this.isGradient=false,this.color=Colors.grey});
  Functions functions = Functions();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 7.5,
      decoration: BoxDecoration(
        color:color,
        borderRadius: BorderRadius.circular(15),
        gradient: isGradient?functions.decideColor(context):null,
      ),
      width: size.width / 3,
      child: FloatingActionButton.extended(
        onPressed: function,
        heroTag: null,
        elevation: 0,
        backgroundColor: Colors.transparent,
        highlightElevation: 0,
        label: Container(
          width: size.width - 4 * (size.width / 5.7),
          child: Center(
            child: Text(
              text,
              style: kTextStyle.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
