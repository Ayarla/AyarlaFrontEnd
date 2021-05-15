import 'dart:async';
import 'package:ayarla/constants/constants.dart';
import 'package:flutter/material.dart';

abstract class Expandable extends StatefulWidget {
  /// • The widget that is placed at the collapsed part of the expandable.
  final Widget primaryWidget;

  /// • The widget that [sizeTransition] affects.
  final Widget secondaryWidget;

  ///
  final Widget additionalWidget;

  /// • Function that is placed top of the widget tree.
  ///
  /// • Animation starts AFTER this function.
  ///
  /// • For the duration between see [beforeAnimationDuration].
  final Function onPressed;

  /// • Padding that affects inside of the widget.
  final EdgeInsets padding;

  /// • Needed for [AyarlaExpandable.singleTextChild].
  final String text;

  /// • Determines the maximum line of the [text] when the widget is collapsed.
  final int maxLines;

  final Color backGroundColor;

  /// • Elevation of expandable widget.
  final double elevation;

  /// • Shape of the component.
  ///
  /// • Notice that [shape] is a [ShapeBorder] not [BoxShape].
  final ShapeBorder shape;

  /// • Duration for expand animation.
  final Duration animationDuration;

  /// • Duration between [onPressed] & expand animation.
  final Duration beforeAnimationDuration;

  /// • Background image of the expandable.
  final DecorationImage backGroundImage;

  /// • General padding.
  ///
  /// • Recommended to set 0 if it is used with [backGroundImage].
  final EdgeInsets cardPadding;

  /// Icon that changes its direction with respect to expand animation.
  final bool showArrowIcon;

  final Color arrowColor;

  final bool initiallyExpanded;

  /// TEST - Designed for web.
  final bool hoverOn;

  /// • Expandable abstract class for general use.
  Expandable({
    this.primaryWidget,
    this.secondaryWidget,
    this.onPressed,
    this.padding,
    this.backGroundColor,
    this.text,
    this.elevation,
    this.maxLines,
    this.shape,
    this.animationDuration,
    this.beforeAnimationDuration,
    this.backGroundImage,
    this.cardPadding,
    this.showArrowIcon,
    this.arrowColor,
    this.initiallyExpanded,

    /// TEST
    this.hoverOn,
    this.additionalWidget,
  });

  @override
  _ExpandableState createState() => _ExpandableState();
}

class _ExpandableState extends State<Expandable> with TickerProviderStateMixin {
  AnimationController _sizeController;
  Animation<double> _sizeAnimation;
  bool _isExpanded = false;
  AnimationController _rotationController;
  Animation<double> _rotationAnimation;
  bool _isRotated = false;

  bool checker = false;

  static final Animatable<double> _rotationTween = Tween<double>(
    begin: 0.0,
    end: 2,
  );
  static final Animatable<double> _sizeTween = Tween<double>(
    begin: 00,
    end: 1.0,
  );

  _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    switch (_sizeAnimation.status) {
      case AnimationStatus.completed:
        _sizeController.reverse();
        break;
      case AnimationStatus.dismissed:
        _sizeController.forward();
        break;
      case AnimationStatus.reverse:
      case AnimationStatus.forward:
        break;
    }
  }

  _toggleRotate() {
    setState(() {
      _isRotated = !_isRotated;
    });
    switch (_rotationAnimation.status) {
      case AnimationStatus.completed:
        _rotationController.reverse();
        break;
      case AnimationStatus.dismissed:
        _rotationController.forward();
        break;
      case AnimationStatus.reverse:
      case AnimationStatus.forward:
        break;
    }
  }

  @override
  initState() {
    super.initState();
    _sizeController = AnimationController(
      vsync: this,
      duration: widget.animationDuration ?? Duration(milliseconds: 200),
    );

    _rotationController = AnimationController(
        duration: Duration(milliseconds: 200), vsync: this, lowerBound: 0.5);

    final CurvedAnimation curve =
        CurvedAnimation(parent: _sizeController, curve: Curves.fastOutSlowIn);

    _sizeAnimation = _sizeTween.animate(curve);
    _rotationAnimation = _rotationTween.animate(_rotationController);
    _sizeController.addListener(() {
      setState(() {});
    });
    checker = widget.initiallyExpanded;
  }

  @override
  dispose() {
    _sizeController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (checker == true) {
      _toggleExpand();
      checker = false;
    }
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      onHover: widget.hoverOn ?? false
          ? (value) {
              if (value = true) {
                _toggleExpand();
                _toggleRotate();
              } else if (value = false) {
                _isExpanded = true;
              }
            }
          : null,
      onTap: () {
        if (widget.onPressed.toString() != 'null') {
          widget.onPressed();
        }

        Timer(widget.beforeAnimationDuration ?? Duration(milliseconds: 20), () {
          _toggleExpand();
          _toggleRotate();
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: widget.backGroundImage ?? null,
        ),
        child: Card(
          margin: widget.cardPadding ?? EdgeInsets.all(5),
          elevation: widget.elevation ?? 0,
          shape: widget.shape ?? roundedShape,
          color: widget.backGroundColor ?? Colors.white,
          child: Padding(
            padding: widget.padding ?? EdgeInsets.all(0),
            child: Column(
              children: [
                widget.text != null
                    ? AnimatedCrossFade(
                        duration: widget.animationDuration ??
                            Duration(milliseconds: 100),
                        crossFadeState: _isExpanded
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        firstChild: Text(widget.text, style: kSmallTextStyle),
                        secondChild: Text(
                          widget.text,
                          style: kSmallTextStyle,
                          maxLines: widget.maxLines,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : widget.showArrowIcon
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              widget.primaryWidget,
                              RotationTransition(
                                turns: Tween(begin: 0.0, end: 1.0)
                                    .animate(_rotationController),
                                child: Icon(
                                  Icons.keyboard_arrow_up_rounded,
                                  color: widget.arrowColor ?? Colors.white,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          )
                        : widget.additionalWidget.toString() != 'null'
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      widget.primaryWidget,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          widget.additionalWidget,
                                          RotationTransition(
                                            turns: Tween(begin: 0.0, end: 1.0)
                                                .animate(_rotationController),
                                            child: Icon(
                                              Icons.keyboard_arrow_up_rounded,
                                              color: widget.arrowColor ??
                                                  Colors.white,
                                              size: 25.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              )
                            : widget.primaryWidget,
                SizeTransition(
                  axisAlignment: 0.0,
                  sizeFactor: _sizeAnimation,
                  child: widget.secondaryWidget,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}