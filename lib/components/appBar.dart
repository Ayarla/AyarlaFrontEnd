import 'package:ayarla/components/UI/notificationBadge.dart';
import 'package:ayarla/constants/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'circularParent.dart';

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
  final bool centerTitle;

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
    this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: centerTitle ?? false,
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
                icon: NotificationBadge(),
                onPressed: () {
                  Routers.router.navigateTo(context, "/KullaniciSayfasi");
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
  SearchAppBar({this.onChanged});
  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    print(width);
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: width <= 375 ? 130 : 140,
      floating: false,
      pinned: true,
      snap: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back_sharp, size: width <= 375 ? width / 15.6 : 24),
              onPressed: () => Routers.router.pop(context)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Merhaba Nilsu",
                style: kTitleStyle.copyWith(
                    color: Colors.white, fontSize: width < 425 ? width / 19.3 : 22),
              ),
              Text(
                "Haydi randevunu ayarlayalım!",
                style: kSmallTextStyle.copyWith(fontSize: width < 425 ? width / 30.3 : 14),
              )
            ],
          ),
          Spacer(),
          GestureDetector(
              child: NotificationBadge(
                child: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: width <= 375 ? width / 10.4 : 36,
                ),
              ),
              onTap: () => Routers.router.navigateTo(context, "/KullaniciSayfasi")),
        ],
      ),
      flexibleSpace: Container(
        color: CupertinoColors.destructiveRed,
        child: FlexibleSpaceBar(
          background: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              width <= 375
                  ? SizedBox(
                      width: width / 1.11,
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        autofocus: false,
                        autocorrect: false,
                        focusNode: FocusNode(canRequestFocus: false),
                        onChanged: widget.onChanged,
                        style: kSmallTextStyle.copyWith(fontSize: width / 30),
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: "Lütfen işletme adı veya kodu giriniz",
                          hintStyle: kSmallTextStyle.copyWith(
                            color: Colors.grey.withOpacity(0.8),
                            fontSize: width / 35,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.search, size: width / 25),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                        top: 3,
                        left: 15,
                        right: 15,
                        bottom: 3,
                      ),
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        autofocus: false,
                        autocorrect: false,
                        focusNode: FocusNode(canRequestFocus: false),
                        onChanged: widget.onChanged,
                        style: kSmallTextStyle,
                        decoration: InputDecoration(
                          hintText: "Lütfen işletme adı veya kodu giriniz",
                          hintStyle: kSmallTextStyle.copyWith(
                              color: Colors.grey.withOpacity(0.8), fontSize: 12),
                          filled: true,
                          isDense: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          ),
                        ),
                      ),
                    ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Row(children: [
                        Icon(Icons.filter_alt_outlined,
                            color: Colors.white, size: width <= 375 ? width / 20 : 25),
                        SizedBox(width: 5),
                        Text(
                          'Filtrele',
                          style: kSmallTextStyle.copyWith(
                              color: Colors.white, fontSize: width <= 375 ? width / 22 : 18),
                        ),
                      ]),
                      onPressed: () {
                        setState(() {
                          // _filterSheet(context);
                        });
                      },
                    ),
                    SizedBox(width: 20),
                    TextButton(
                      child: Row(children: [
                        Icon(Icons.sort, color: Colors.white, size: width <= 375 ? width / 20 : 25),
                        SizedBox(width: 5),
                        Text(
                          'Sırala',
                          style: kSmallTextStyle.copyWith(
                              color: Colors.white, fontSize: width <= 375 ? width / 22 : 18),
                        ),
                      ]),
                      onPressed: () {
                        setState(() {
                          // _orderSheet(context);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
