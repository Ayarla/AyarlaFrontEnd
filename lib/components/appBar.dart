import 'package:ayarla/components/UI/notificationBadge.dart';
import 'package:ayarla/components/ayarla_textfield.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/services/service_login.dart';
import 'package:ayarla/services/service_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:universal_platform/universal_platform.dart';
import 'circularParent.dart';
import 'package:ayarla/components/circularParent.dart';
import 'package:provider/provider.dart';

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
        color: color ?? Colors.orange,
        gradient: gradient ?? null,
      ),
      leading: showBackButton ?? true
          ? BackButton(color: childrenColor, onPressed: backButtonFunction ?? null)
          : InvisibleBackButton(),
      title: title,
      actions: [
        showIconButton ?? true
            ? IconButton(
                padding: EdgeInsets.only(left: 10, right: 20),
                iconSize: 35,
                icon: NotificationBadge(
                  showBadge: Provider.of<UserService>(context, listen: true).notifications.isNotEmpty ? true : false,
                  notificationNumber: Provider.of<UserService>(context, listen: true).notifications.length,
                ),
                onPressed: () => Provider.of<UserService>(context, listen: false).currentUser.isActive
                    ? Navigator.pushNamed(context, "/KullaniciSayfasi")
                    : Navigator.pushNamed(context, "/GirisYapmaSayfasi"),
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
    return IconButton(icon: BackButtonIcon(), disabledColor: Colors.transparent, iconSize: 50);
  }
}

class SearchAppBar extends StatefulWidget {
  final Function onChanged;
  final Function openEndDrawer;
  final Function openDrawer;

  SearchAppBar({
    this.onChanged,
    this.openDrawer,
    this.openEndDrawer,
  });

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  double dy = 0;
  @override
  Widget build(BuildContext context) {
    if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
      dy = MediaQuery.of(context).padding.top;
    }
    final width = MediaQuery.of(context).size.width;
    return SliverAppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      automaticallyImplyLeading: false,
      expandedHeight: width <= 375 ? 130 + dy : 130 + dy,
      floating: false,
      pinned: true,
      snap: false,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
              child: Icon(Icons.arrow_back_sharp, color: Colors.white, size: width <= 375 ? width / 15.6 : 24),
              onTap: () => Navigator.pop(context)),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Provider.of<LoginService>(context, listen: false).isLoggedIn
                    ? "Merhaba "
                    // + Provider.of<LoginService>(context, listen: false).userModel.name
                    : "Merhaba",
                style: kTitleStyle.copyWith(color: Colors.white, fontSize: width < 425 ? width / 19.3 : 22),
              ),
              Text(
                "Haydi randevunu ayarlayalım!",
                style: kSmallTextStyle.copyWith(color: Colors.white, fontSize: width < 425 ? width / 30.3 : 14),
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
            onTap: () => Provider.of<UserService>(context, listen: false).currentUser.isActive
                ? Navigator.pushNamed(context, "/KullaniciSayfasi")
                : Navigator.pushNamed(context, "/GirisYapmaSayfasi"),
          ),
        ],
      ),
      // backgroundColor: Colors.orange,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: Functions().decideColor(context), borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        child: FlexibleSpaceBar(
          background: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 3),
                AyarlaTextField(
                  hintText: Text(
                    "Lütfen işletme adı veya kodu giriniz",
                    style:
                        kSmallTextStyle.copyWith(color: Colors.grey.withOpacity(0.8), fontSize: width < 425 ? width / 30 : 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  onChanged: widget.onChanged,
                  color: Colors.blue[200],
                  textStyle: kSmallTextStyle.copyWith(fontSize: width < 425 ? width / 30 : 14),
                ),
                // width <= 375
                //     ?
                // TextField(
                //         textCapitalization: TextCapitalization.words,
                //         autofocus: false,
                //         autocorrect: false,
                //         focusNode: FocusNode(canRequestFocus: false),
                //         onChanged: widget.onChanged,
                //         style: kSmallTextStyle.copyWith(fontSize: width / 30),
                //         decoration: InputDecoration(
                //           isDense: true,
                //           hintText: "Lütfen işletme adı veya kodu giriniz",
                //           hintStyle: kSmallTextStyle.copyWith(
                //               color: Colors.grey.withOpacity(0.8), fontSize: width / 35),
                //           filled: true,
                //           fillColor: Colors.white,
                //           prefixIcon: Icon(Icons.search, size: width / 25),
                //           border: OutlineInputBorder(
                //             borderRadius: BorderRadius.all(Radius.circular(25.0)),
                //           ),
                //         ),
                //       )
                //     : TextField(
                //         textCapitalization: TextCapitalization.words,
                //         autofocus: false,
                //         autocorrect: false,
                //         focusNode: FocusNode(canRequestFocus: false),
                //         onChanged: widget.onChanged,
                //         style: kSmallTextStyle,
                //         decoration: InputDecoration(
                //           hintText: "Lütfen işletme adı veya kodu giriniz",
                //           hintStyle: kSmallTextStyle.copyWith(
                //               color: Colors.grey.withOpacity(0.8), fontSize: 12),
                //           filled: true,
                //           isDense: true,
                //           fillColor: Colors.white,
                //           prefixIcon: Icon(Icons.search),
                //           border: OutlineInputBorder(
                //             borderRadius: BorderRadius.all(Radius.circular(25.0)),
                //           ),
                //         ),
                //       ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        child: Row(children: [
                          Icon(Icons.filter_alt_outlined, color: Colors.white, size: width <= 375 ? width / 20 : 25),
                          SizedBox(width: 5),
                          Text(
                            'Filtrele',
                            style: kSmallTextStyle.copyWith(color: Colors.white, fontSize: width <= 375 ? width / 22 : 18),
                          ),
                        ]),
                        onPressed: () => widget.openDrawer(),
                      ),
                      SizedBox(width: 20),
                      TextButton(
                        child: Row(children: [
                          Icon(Icons.sort, color: Colors.white, size: width <= 375 ? width / 20 : 25),
                          SizedBox(width: 5),
                          Text(
                            'Sırala',
                            style: kSmallTextStyle.copyWith(color: Colors.white, fontSize: width <= 375 ? width / 22 : 18),
                          ),
                        ]),
                        onPressed: () => widget.openEndDrawer(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [Container()],
    );
  }
}
