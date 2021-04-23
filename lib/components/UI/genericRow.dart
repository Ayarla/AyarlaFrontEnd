import 'package:flutter/material.dart';

class GenericRow extends StatelessWidget {
  final Widget leading;
  final Widget body;
  final Widget trailing;
  final double spaceBetween;
  final double padding;
  final bool useFirstSpacer;
  final bool useSecondSpacer;

  GenericRow({
    this.leading,
    this.body,
    this.trailing,
    this.spaceBetween,
    this.padding,
    this.useFirstSpacer,
    this.useSecondSpacer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding ?? 0.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            leading ?? Container(),
            useFirstSpacer ?? false
                ? Spacer()
                : SizedBox(width: spaceBetween ?? 15),
            body ?? Container(),
            useSecondSpacer ?? false
                ? Spacer()
                : SizedBox(width: spaceBetween ?? 15),
            trailing ?? Container(),
          ],
        ),
      ),
    );
  }
}
