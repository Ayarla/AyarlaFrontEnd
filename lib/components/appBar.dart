import 'package:ayarla/components/UI/responsiveWidget.dart';
import 'package:ayarla/constants/router.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'circularParent.dart';
import 'filter&order.dart';
import 'package:ayarla/components/UI/logos&icons&texts.dart' as UI;

class DefaultAppBar extends StatelessWidget {
  final Widget title;
  final Color childrenColor;
  final Color color;
  final Gradient gradient;
  final double radius;
  final bool showIconButton;
  final bool showBackButton;
  final double titleSpacing;
  final Function backButtonFunction;

  /// In order to call this component on a tree use DefaultAppBar().build(context)
  ///
  /// -> [showIconButton] is true by default.
  ///
  /// -> If [radius] is not specified, it will be 20 by default.
  ///
  /// -> [titleSpacing] is 0 by default.
  ///
  /// -> [childrenColor] stands for back button, for now.
  ///
  DefaultAppBar({
    this.title,
    this.childrenColor,
    this.color,
    this.gradient,
    this.radius,
    this.showIconButton,
    this.titleSpacing,
    this.backButtonFunction,
    this.showBackButton,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleSpacing: titleSpacing ?? 0,
      flexibleSpace: CircularParent(
        direction: Directions.bottom,
        radius: radius ?? 20,
        color: color ?? Colors.grey,
        gradient: gradient ?? null,
      ),
      leading: showBackButton ?? true
          ? BackButton(
              color: childrenColor,
              onPressed: backButtonFunction ?? null,
            )
          : InvisibleBackButton(),
      title: title,
      actions: [
        showIconButton ?? true
            ? IconButton(
                padding: EdgeInsets.only(left: 10, right: 20),
                iconSize: 35,
                icon: Badge(
                  badgeContent: Text('1',
                      style: kSmallTextStyle.copyWith(color: Colors.white)),
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => UserPage()));
                  Routers.router.navigateTo(context, "/KullanıcıSayfası");
                },
              )

            /// May cause other problems.
            : InvisibleBackButton(),
      ],
    );
  }
}

class InvisibleBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: BackButtonIcon(),
      disabledColor: Colors.transparent,
      iconSize: 50,
    );
  }
}

class SearchAppBar extends StatefulWidget {
  final Function onChanged;
  final MediaQueryData mediaQueryData;
  SearchAppBar({this.onChanged, this.mediaQueryData});
  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: widget.mediaQueryData.size.width / 2.7,
      collapsedHeight: widget.mediaQueryData.size.width / 8,
      toolbarHeight: widget.mediaQueryData.size.width / 8.2,
      floating: false,
      pinned: true,
      snap: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back_sharp,
                  size: widget.mediaQueryData.size.width / 20),
              onPressed: () => Routers.router.pop(context)),
          SizedBox(width: widget.mediaQueryData.size.width / 100),
          UI.AppBarTitleCustomer(),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: widget.mediaQueryData.size.width / 12,
            ),
            onPressed: () {
              Routers.router.navigateTo(context, "/KullanıcıSayfası");
            },
          ),
        ],
      ),
      flexibleSpace: CircularParent(
        radius: 20,
        direction: Directions.bottom,
        gradient: Functions().decideColor(context),
        child: FlexibleSpaceBar(
          background: SafeArea(
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: CircularParent(
                radius: 30,
                direction: Directions.bottom,
                color: Colors.white,
                gradient: Functions().decideColor(context),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: widget.mediaQueryData.size.width / 7,
                        left: widget.mediaQueryData.size.width / 20,
                        right: widget.mediaQueryData.size.width / 20,
                        bottom: widget.mediaQueryData.size.width / 120,
                      ),
                      child: SizedBox(
                        height: widget.mediaQueryData.size.width / 9,
                        width: widget.mediaQueryData.size.width / 1.05,
                        child: TextField(
                          textCapitalization: TextCapitalization.words,
                          autofocus: false,
                          autocorrect: false,
                          focusNode: FocusNode(canRequestFocus: false),
                          textAlignVertical: TextAlignVertical.bottom,
                          onChanged: widget.onChanged,
                          style: kSmallTextStyle.copyWith(
                              fontSize: widget.mediaQueryData.size.width / 30),
                          decoration: InputDecoration(
                            hintText: "Lütfen işletme adı veya kodu giriniz",
                            hintStyle: kSmallTextStyle.copyWith(
                              color: Colors.grey.withOpacity(0.8),
                              fontSize: widget.mediaQueryData.size.width / 30,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.search,
                                size: widget.mediaQueryData.size.width / 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(25.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    FilterOrderRow(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
