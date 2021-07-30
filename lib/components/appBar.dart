import 'package:ayarla/components/UI/notificationBadge.dart';
import 'package:ayarla/constants/router.dart';
import 'package:ayarla/screens/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:universal_platform/universal_platform.dart';
import 'circularParent.dart';
import 'package:ayarla/components/circularParent.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:ayarla/components/UI/responsiveWidget.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';

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
  /// FILTERING SHEET
  void _filterSheet(context1) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        final size = MediaQuery.of(context).size;
        double _value = 0;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return ResponsiveWidget(
              smallScreen: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView(
                  children: [
                    SizedBox(height: 10),
                    Center(
                        child: FittedBox(
                            fit: BoxFit.cover,
                            child: Text('Yıldıza göre filtrele', style: kSmallTitleStyle))),
                    SizedBox(height: 10),
                    SfSlider(
                      min: 0.0,
                      max: 5.0,
                      value: _value,
                      interval: 1,
                      enableTooltip: true,
                      tooltipShape: SfPaddleTooltipShape(),
                      minorTicksPerInterval: 0,
                      activeColor: Colors.deepPurple,
                      onChanged: (dynamic value) {
                        setModalState(() {
                          _value = value;
                        });
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              mediumScreen: Align(
                alignment: Alignment.bottomCenter,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: size.width / 1.5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: ListView(
                      children: [
                        SizedBox(height: 10),
                        Center(
                            child: FittedBox(
                                fit: BoxFit.cover,
                                child: Text('Yıldıza göre filtrele', style: kSmallTitleStyle))),
                        SizedBox(height: 10),
                        SfSlider(
                          min: 0.0,
                          max: 5.0,
                          value: _value,
                          interval: 1,
                          enableTooltip: true,
                          tooltipShape: SfPaddleTooltipShape(),
                          minorTicksPerInterval: 0,
                          activeColor: Colors.deepPurple,
                          onChanged: (dynamic value) {
                            setModalState(() {
                              _value = value;
                            });
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              largeScreen: Align(
                alignment: Alignment.bottomCenter,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: size.width / 1.5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: ListView(
                      children: [
                        SizedBox(height: 10),
                        Center(
                            child: FittedBox(
                                fit: BoxFit.cover,
                                child: Text('Yıldıza göre filtrele', style: kSmallTitleStyle))),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          child: SfSlider(
                            min: 0.0,
                            max: 5.0,
                            value: _value,
                            interval: 1,
                            enableTooltip: true,
                            tooltipShape: SfPaddleTooltipShape(),
                            minorTicksPerInterval: 0,
                            activeColor: Colors.deepPurple,
                            onChanged: (dynamic value) {
                              setModalState(() {
                                _value = value;
                              });
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  /// ORDERING SHEET
  _orderSheet(context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        final size = MediaQuery.of(context).size;
        return ResponsiveWidget(
          smallScreen: CircularParent(
            radius: 20,
            direction: Directions.top,
            color: Colors.white,
            child: ListView(
              children: [
                SizedBox(height: 10),

                /// ACC TO STARS
                Center(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text('Yıldıza göre sırala', style: kSmallTitleStyle),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /// LESS TO MORE ACC STARS
                    TextButton(
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text('Azdan Çoka', style: kSmallTextStyle),
                        ),
                      ),
                      onPressed: () {
                        var ancestralState = context.findAncestorStateOfType<SearchPageState>();
                        ancestralState.setState(() {});

                        setState(() {
                          Provider.of<AppointmentData>(context, listen: false)
                              .currentList
                              .sort((a, b) => a.star.compareTo(b.star));
                          Provider.of<AppointmentData>(context, listen: false).setList(
                              Provider.of<AppointmentData>(context, listen: false).currentList);
                        });
                        Navigator.pop(context);
                      },
                    ),

                    /// MORE TO LESS ACC STARS
                    TextButton(
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text('Çoktan Aza', style: kSmallTextStyle),
                        ),
                      ),
                      onPressed: () {
                        var ancestralState = context.findAncestorStateOfType<SearchPageState>();
                        ancestralState.setState(() {});
                        setState(() {
                          Provider.of<AppointmentData>(context, listen: false)
                              .currentList
                              .sort((b, a) => a.star.compareTo(b.star));
                          Provider.of<AppointmentData>(context, listen: false).setList(
                              Provider.of<AppointmentData>(context, listen: false).currentList);
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),

                /// ACC TO COMMENTS
                Center(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text('Yorumlara göre sırala', style: kSmallTitleStyle),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /// LESS TO MORE ACC STARS
                    TextButton(
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text('Azdan Çoka', style: kSmallTextStyle),
                        ),
                      ),
                      onPressed: () {
                        var ancestralState = context.findAncestorStateOfType<SearchPageState>();
                        ancestralState.setState(() {});

                        setState(() {
                          Provider.of<AppointmentData>(context, listen: false)
                              .currentList
                              .sort((a, b) => a.comments.compareTo(b.comments));
                          Provider.of<AppointmentData>(context, listen: false).setList(
                              Provider.of<AppointmentData>(context, listen: false).currentList);
                        });
                        Navigator.pop(context);
                      },
                    ),

                    /// MORE TO LESS ACC STARS
                    TextButton(
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text('Çoktan Aza', style: kSmallTextStyle),
                        ),
                      ),
                      onPressed: () {
                        var ancestralState = context.findAncestorStateOfType<SearchPageState>();
                        ancestralState.setState(() {});
                        setState(() {
                          Provider.of<AppointmentData>(context, listen: false)
                              .currentList
                              .sort((b, a) => a.comments.compareTo(b.comments));
                          Provider.of<AppointmentData>(context, listen: false).setList(
                              Provider.of<AppointmentData>(context, listen: false).currentList);
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          mediumScreen: Align(
            alignment: Alignment.bottomCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width / 1.5),
              child: CircularParent(
                radius: 20,
                direction: Directions.top,
                color: Colors.white,
                child: ListView(
                  children: [
                    SizedBox(height: 10),

                    /// ACC TO STARS
                    Center(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text('Yıldıza göre sırala', style: kSmallTitleStyle),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        /// LESS TO MORE ACC STARS
                        TextButton(
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text('Azdan Çoka', style: kSmallTextStyle),
                            ),
                          ),
                          onPressed: () {
                            var ancestralState = context.findAncestorStateOfType<SearchPageState>();
                            ancestralState.setState(() {});

                            setState(() {
                              Provider.of<AppointmentData>(context, listen: false)
                                  .currentList
                                  .sort((a, b) => a.star.compareTo(b.star));
                              Provider.of<AppointmentData>(context, listen: false).setList(
                                  Provider.of<AppointmentData>(context, listen: false).currentList);
                            });
                            Navigator.pop(context);
                          },
                        ),

                        /// MORE TO LESS ACC STARS
                        TextButton(
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text('Çoktan Aza', style: kSmallTextStyle),
                            ),
                          ),
                          onPressed: () {
                            var ancestralState = context.findAncestorStateOfType<SearchPageState>();
                            ancestralState.setState(() {});
                            setState(() {
                              Provider.of<AppointmentData>(context, listen: false)
                                  .currentList
                                  .sort((b, a) => a.star.compareTo(b.star));
                              Provider.of<AppointmentData>(context, listen: false).setList(
                                  Provider.of<AppointmentData>(context, listen: false).currentList);
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),

                    /// ACC TO COMMENTS
                    Center(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text('Yorumlara göre sırala', style: kSmallTitleStyle),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        /// LESS TO MORE ACC STARS
                        TextButton(
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text('Azdan Çoka', style: kSmallTextStyle),
                            ),
                          ),
                          onPressed: () {
                            var ancestralState = context.findAncestorStateOfType<SearchPageState>();
                            ancestralState.setState(() {});

                            setState(() {
                              Provider.of<AppointmentData>(context, listen: false)
                                  .currentList
                                  .sort((a, b) => a.comments.compareTo(b.comments));
                              Provider.of<AppointmentData>(context, listen: false).setList(
                                  Provider.of<AppointmentData>(context, listen: false).currentList);
                            });
                            Navigator.pop(context);
                          },
                        ),

                        /// MORE TO LESS ACC STARS
                        TextButton(
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text('Çoktan Aza', style: kSmallTextStyle),
                            ),
                          ),
                          onPressed: () {
                            var ancestralState = context.findAncestorStateOfType<SearchPageState>();
                            ancestralState.setState(() {});
                            setState(() {
                              Provider.of<AppointmentData>(context, listen: false)
                                  .currentList
                                  .sort((b, a) => a.comments.compareTo(b.comments));
                              Provider.of<AppointmentData>(context, listen: false).setList(
                                  Provider.of<AppointmentData>(context, listen: false).currentList);
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          largeScreen: Align(
            alignment: Alignment.bottomCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width / 1.5),
              child: CircularParent(
                radius: 20,
                direction: Directions.top,
                color: Colors.white,
                child: ListView(
                  children: [
                    SizedBox(height: 10),

                    /// ACC TO STARS
                    Center(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text('Yıldıza göre sırala', style: kSmallTitleStyle),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        /// LESS TO MORE ACC STARS
                        TextButton(
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text('Azdan Çoka', style: kSmallTextStyle),
                            ),
                          ),
                          onPressed: () {
                            var ancestralState = context.findAncestorStateOfType<SearchPageState>();
                            ancestralState.setState(() {});

                            setState(() {
                              Provider.of<AppointmentData>(context, listen: false)
                                  .currentList
                                  .sort((a, b) => a.star.compareTo(b.star));
                              Provider.of<AppointmentData>(context, listen: false).setList(
                                  Provider.of<AppointmentData>(context, listen: false).currentList);
                            });
                            Navigator.pop(context);
                          },
                        ),

                        /// MORE TO LESS ACC STARS
                        TextButton(
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text('Çoktan Aza', style: kSmallTextStyle),
                            ),
                          ),
                          onPressed: () {
                            var ancestralState = context.findAncestorStateOfType<SearchPageState>();
                            ancestralState.setState(() {});
                            setState(() {
                              Provider.of<AppointmentData>(context, listen: false)
                                  .currentList
                                  .sort((b, a) => a.star.compareTo(b.star));
                              Provider.of<AppointmentData>(context, listen: false).setList(
                                  Provider.of<AppointmentData>(context, listen: false).currentList);
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),

                    /// ACC TO COMMENTS
                    Center(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text('Yorumlara göre sırala', style: kSmallTitleStyle),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        /// LESS TO MORE ACC STARS
                        TextButton(
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text('Azdan Çoka', style: kSmallTextStyle),
                            ),
                          ),
                          onPressed: () {
                            var ancestralState = context.findAncestorStateOfType<SearchPageState>();
                            ancestralState.setState(() {});

                            setState(() {
                              Provider.of<AppointmentData>(context, listen: false)
                                  .currentList
                                  .sort((a, b) => a.comments.compareTo(b.comments));
                              Provider.of<AppointmentData>(context, listen: false).setList(
                                  Provider.of<AppointmentData>(context, listen: false).currentList);
                            });
                            Navigator.pop(context);
                          },
                        ),

                        /// MORE TO LESS ACC STARS
                        TextButton(
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text('Çoktan Aza', style: kSmallTextStyle),
                            ),
                          ),
                          onPressed: () {
                            var ancestralState = context.findAncestorStateOfType<SearchPageState>();
                            ancestralState.setState(() {});
                            setState(() {
                              Provider.of<AppointmentData>(context, listen: false)
                                  .currentList
                                  .sort((b, a) => a.comments.compareTo(b.comments));
                              Provider.of<AppointmentData>(context, listen: false).setList(
                                  Provider.of<AppointmentData>(context, listen: false).currentList);
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  double dy = 0;

  @override
  Widget build(BuildContext context) {
    if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
      /// TODO - has to be static.
      print(MediaQuery.of(context).padding);
      dy = 20;
      print(dy);
    }
    final width = MediaQuery.of(context).size.width;
    return SliverAppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      automaticallyImplyLeading: false,
      expandedHeight: width <= 375 ? 130 + dy : 140 + dy,
      floating: false,
      pinned: true,
      snap: false,
      backgroundColor: Colors.orange,
      elevation: 0,
      flexibleSpace: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(8),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  child: Icon(Icons.arrow_back_sharp,
                      color: Colors.white, size: width <= 375 ? width / 15.6 : 24),
                  onTap: () => Routers.router.pop(context)),
              SizedBox(width: 8),
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
                    style: kSmallTextStyle.copyWith(
                        color: Colors.white, fontSize: width < 425 ? width / 30.3 : 14),
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
          SizedBox(height: 6),
          width <= 375
              ? TextField(
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
                        color: Colors.grey.withOpacity(0.8), fontSize: width / 35),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search, size: width / 25),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                  ),
                )
              : TextField(
                  textCapitalization: TextCapitalization.words,
                  autofocus: false,
                  autocorrect: false,
                  focusNode: FocusNode(canRequestFocus: false),
                  onChanged: widget.onChanged,
                  style: kSmallTextStyle,
                  decoration: InputDecoration(
                    hintText: "Lütfen işletme adı veya kodu giriniz",
                    hintStyle:
                        kSmallTextStyle.copyWith(color: Colors.grey.withOpacity(0.8), fontSize: 12),
                    filled: true,
                    isDense: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                  ),
                ),
          SizedBox(height: 6),
          Row(
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
                    _filterSheet(context);
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
                    _orderSheet(context);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
