import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/screens/search_page.dart';
import 'package:ayarla/virtual_data_base/genderSelection.dart';

class MenuItemData {
  String label;

  MenuItemData({this.label});
}

class MenuSection extends StatefulWidget {
  final Widget title;
  final Color backgroundColor;
  final Color accentColor;
  final List menuOptions;
  final String assetId;

  MenuSection(
      this.title, this.backgroundColor, this.accentColor, this.menuOptions,
      {this.assetId, Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SectionState();
}

class _SectionState extends State<MenuSection>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  static final Animatable<double> _sizeTween = Tween<double>(
    begin: 0.0,
    end: 1.0,
  );

  Animation<double> _sizeAnimation;

  bool _isExpanded = false;

  @override
  initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    /// This curve is controlled by [_controller].
    final CurvedAnimation curve =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    /// [_sizeAnimation] will interpolate using this curve - [Curves.fastOutSlowIn].
    _sizeAnimation = _sizeTween.animate(curve);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Whenever a tap is detected, toggle a change in the state and move the animation forward
  /// or backwards depending on the initial status.
  _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    switch (_sizeAnimation.status) {
      case AnimationStatus.completed:
        _controller.reverse();
        break;
      case AnimationStatus.dismissed:
        _controller.forward();
        break;
      case AnimationStatus.reverse:
      case AnimationStatus.forward:
        break;
    }
  }

  bool isSelected = false;
  // ignore:missing_return
  Icon buttonBehavior(bool isSelected) {
    if (isSelected == true) {
      return Icon(
        Icons.remove_circle_outline,
        size: 30,
        color: Colors.white,
      );
    } else if (isSelected == false) {
      return Icon(
        Icons.add_circle_outline,
        size: 30,
        color: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          _toggleExpand();
          if (isSelected == false) {
            isSelected = true;
          } else
            isSelected = false;
        },
        child: Center(
          child: Container(
              // height: 300,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.3),
                borderRadius: BorderRadius.circular(10.0),
                // color: widget.backgroundColor
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: -20,
                        top: 0,
                        child: Image.asset(
                          // 'assets/banner.png',
                          'assets/new/cfr2.png',
                          fit: BoxFit.fill,
                          // scale: 2.1,
                        ),
                      ),
                      Column(children: <Widget>[
                        Container(
                            height: 100.0,
                            // alignment: Alignment.bottomCenter,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 21.0,
                                  width: 21.0,
                                  margin: EdgeInsets.only(left: 0, bottom: 40),
                                ),
                                buttonBehavior(isSelected),
                                SizedBox(
                                  width: 3,
                                ),
                                widget.title,
                                // style: kSmallTitleStyle,
                              ],
                            )),
                        SizeTransition(
                          axisAlignment: 0.0,
                          axis: Axis.vertical,
                          sizeFactor: _sizeAnimation,
                          child: Container(
                            // width: size.width / 3,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 56.0, right: 20.0, top: 10.0),
                              child: Column(
                                  children: widget.menuOptions.map((item) {
                                return GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    if (item.label == 'Kadın') {
                                      Provider.of<GenderSelection>(context,
                                              listen: false)
                                          .selectGender(Gender.female);
                                      Navigator.pushNamed(
                                          context, SearchPage.id);
                                    } else if (item.label == 'Erkek') {
                                      Provider.of<GenderSelection>(context,
                                              listen: false)
                                          .selectGender(Gender.male);
                                      Navigator.pushNamed(
                                          context, SearchPage.id);
                                    } else {
                                      Provider.of<GenderSelection>(context,
                                              listen: false)
                                          .selectGender(Gender.unisex);
                                      Navigator.pushNamed(
                                          context, SearchPage.id);
                                    }
                                  },
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(width: 20),
                                        Container(
                                          // width: size.width / 2.5,
                                          margin: EdgeInsets.only(bottom: 14.0),
                                          child: Text(
                                            item.label,
                                            style: kTextStyle.copyWith(
                                                color: Colors.white),
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.arrow_right_rounded,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                      ]),
                                );
                              }).toList()),
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ))),
        ));
  }
}
