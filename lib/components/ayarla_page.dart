import 'package:flutter/material.dart';

class AyarlaPage extends StatelessWidget {
  final Widget child;
  AyarlaPage({this.child});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width >= 650
        ? Center(child: Container(width: 650, child: child))
        : Center(
            child: Container(
              child: Padding(padding: EdgeInsets.all(8.0), child: child),
            ),
          );
  }
}

class AyarlaPageNoC extends StatelessWidget {
  final Widget child;
  AyarlaPageNoC({this.child});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width >= 650
        ? Container(width: 650, child: child)
        : Container(
            child: Padding(padding: EdgeInsets.all(8.0), child: child),
          );
  }
}
