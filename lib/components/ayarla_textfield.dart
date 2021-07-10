import 'package:ayarla/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AyarlaTextField extends StatelessWidget {
  final Text hintText;
  final EdgeInsets padding;
  final Function onChanged;
  final List<TextInputFormatter> inputFormatter;
  final TextInputType keyboardType;

  /// TextField for general use.
  ///
  /// • TODO: [inputFormatter] needs test ASAP.
  ///
  /// • TODO: [maxLines] needs fix ASAP.
  AyarlaTextField({
    this.hintText,
    this.padding,
    this.onChanged,
    this.inputFormatter,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType ?? TextInputType.text,
      maxLines: hintText.maxLines ?? 1,
      cursorColor: Colors.green,
      style: hintText.style ?? kSmallTextStyle,
      textAlign: hintText.textAlign ?? TextAlign.start,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        hintText: hintText.data ?? '',
        hintStyle: hintText.style ?? kSmallTextStyle,
        fillColor: Colors.grey.shade200,
        filled: true,
        isDense: true,
        contentPadding: padding ??
            EdgeInsets.only(left: 15, top: 14, bottom: 14, right: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
