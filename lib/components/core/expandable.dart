import 'dart:async';
import 'package:ayarla/constants/constants.dart';
import 'package:flutter/material.dart';

abstract class Expandable extends StatefulWidget {
  /// • The widget that is placed at the collapsed part of the expandable.
  final Widget primaryWidget;

  /// • The widget that [sizeTransition] affects.
  final Widget secondaryWidget;

  /// • Function that is placed top of the widget tree.
  ///
  /// • Animation starts AFTER this function.
  ///
  /// • For the duration between see [beforeAnimationDuration].
  final Function onPressed;

  /// • Padding that affects inside of the widget.
  final Padding padding;

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

  final Image backGroundImage;

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
  });

  @override
  _ExpandableState createState() => _ExpandableState();
}

class _ExpandableState extends State<Expandable> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _sizeAnimation;
  bool _isExpanded = false;

  static final Animatable<double> _sizeTween = Tween<double>(
    begin: 0.0,
    end: 1.0,
  );

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

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration ?? Duration(milliseconds: 200),
    );

    final CurvedAnimation curve =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onPressed.toString() != 'null') {
          widget.onPressed();
        }

        Timer(widget.beforeAnimationDuration ?? Duration(milliseconds: 20), () {
          _toggleExpand();
        });
      },
      child: Card(
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
    );
  }
}
