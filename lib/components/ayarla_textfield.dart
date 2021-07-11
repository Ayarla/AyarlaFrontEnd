import 'package:ayarla/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AyarlaTextField extends StatelessWidget {
  final Text hintText;
  final EdgeInsets padding;
  final Function onChanged;
  final List<TextInputFormatter> inputFormatter;
  final TextInputType keyboardType;
  final Color color;

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
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType ?? TextInputType.text,
      maxLines: hintText.maxLines ?? 1,
      cursorColor: color ?? Colors.green,
      style: hintText.style ?? kSmallTextStyle,
      textAlign: hintText.textAlign ?? TextAlign.start,
      onChanged: onChanged,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color ?? Colors.green, width: 2.0),
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

  /// TODO - ASAP
class AyarlaTextFormField extends StatelessWidget {
  final String text;
  final TextInputType keyboardType;
  final String hintText;
  final FormFieldValidator formFieldValidator;
  final List<TextInputFormatter> inputFormatter;
  final Function onChanged;

  AyarlaTextFormField({
    this.keyboardType,
    this.text,
    this.hintText,
    this.formFieldValidator,
    this.inputFormatter,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: formFieldValidator,
      cursorColor: Colors.green,
      controller: TextEditingController(text: text ?? ' '),
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.multiline,
      inputFormatters: inputFormatter ?? null,
      autofocus: false,
      decoration: InputDecoration(
        hintText: hintText ?? 'Your Hint Text Here!',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        fillColor: Colors.grey.shade200,
        filled: true,
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
