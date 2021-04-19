import 'package:ayarla/components/UI/responsiveWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/screens/search_page.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'circularParent.dart';

class FilterOrderRow extends StatefulWidget {
  @override
  _FilterOrderRowState createState() => _FilterOrderRowState();
}

class _FilterOrderRowState extends State<FilterOrderRow> {
  Functions functions = Functions();
  List localList = [];

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
                            child: Text('Yıldıza göre filtrele',
                                style: kSmallTitleStyle))),
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
                                child: Text('Yıldıza göre filtrele',
                                    style: kSmallTitleStyle))),
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
                                child: Text('Yıldıza göre filtrele',
                                    style: kSmallTitleStyle))),
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
            child: Wrap(
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

                /// LESS TO MORE ACC STARS
                TextButton(
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text('Azdan Çoka', style: kSmallTextStyle),
                    ),
                  ),
                  onPressed: () {
                    var ancestralState =
                        context.findAncestorStateOfType<SearchPageState>();
                    ancestralState.setState(() {});

                    setState(() {
                      Provider.of<AppointmentData>(context, listen: false)
                          .currentList
                          .sort((a, b) => a.star.compareTo(b.star));
                      Provider.of<AppointmentData>(context, listen: false)
                          .setList(
                              Provider.of<AppointmentData>(context, listen: false)
                                  .currentList);
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
                    var ancestralState =
                        context.findAncestorStateOfType<SearchPageState>();
                    ancestralState.setState(() {});
                    setState(() {
                      Provider.of<AppointmentData>(context, listen: false)
                          .currentList
                          .sort((b, a) => a.star.compareTo(b.star));
                      Provider.of<AppointmentData>(context, listen: false)
                          .setList(
                              Provider.of<AppointmentData>(context, listen: false)
                                  .currentList);
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          mediumScreen: Align(
            alignment: Alignment.bottomCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: size.width / 1.5
              ),
              child: CircularParent(
                radius: 20,
                direction: Directions.top,
                color: Colors.white,
                child: Wrap(
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

                    /// LESS TO MORE ACC STARS
                    TextButton(
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text('Azdan Çoka', style: kSmallTextStyle),
                        ),
                      ),
                      onPressed: () {
                        var ancestralState =
                        context.findAncestorStateOfType<SearchPageState>();
                        ancestralState.setState(() {});

                        setState(() {
                          Provider.of<AppointmentData>(context, listen: false)
                              .currentList
                              .sort((a, b) => a.star.compareTo(b.star));
                          Provider.of<AppointmentData>(context, listen: false)
                              .setList(
                              Provider.of<AppointmentData>(context, listen: false)
                                  .currentList);
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
                        var ancestralState =
                        context.findAncestorStateOfType<SearchPageState>();
                        ancestralState.setState(() {});
                        setState(() {
                          Provider.of<AppointmentData>(context, listen: false)
                              .currentList
                              .sort((b, a) => a.star.compareTo(b.star));
                          Provider.of<AppointmentData>(context, listen: false)
                              .setList(
                              Provider.of<AppointmentData>(context, listen: false)
                                  .currentList);
                        });
                        Navigator.pop(context);
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
              constraints: BoxConstraints(
                  maxWidth: size.width / 1.5
              ),
              child: CircularParent(
                radius: 20,
                direction: Directions.top,
                color: Colors.white,
                child: Wrap(
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

                    /// LESS TO MORE ACC STARS
                    TextButton(
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text('Azdan Çoka', style: kSmallTextStyle),
                        ),
                      ),
                      onPressed: () {
                        var ancestralState =
                        context.findAncestorStateOfType<SearchPageState>();
                        ancestralState.setState(() {});

                        setState(() {
                          Provider.of<AppointmentData>(context, listen: false)
                              .currentList
                              .sort((a, b) => a.star.compareTo(b.star));
                          Provider.of<AppointmentData>(context, listen: false)
                              .setList(
                              Provider.of<AppointmentData>(context, listen: false)
                                  .currentList);
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
                        var ancestralState =
                        context.findAncestorStateOfType<SearchPageState>();
                        ancestralState.setState(() {});
                        setState(() {
                          Provider.of<AppointmentData>(context, listen: false)
                              .currentList
                              .sort((b, a) => a.star.compareTo(b.star));
                          Provider.of<AppointmentData>(context, listen: false)
                              .setList(
                              Provider.of<AppointmentData>(context, listen: false)
                                  .currentList);
                        });
                        Navigator.pop(context);
                      },
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ResponsiveWidget(
          smallScreen: TextButton(
            child: Row(children: [
              Icon(Icons.filter_alt_outlined,
                  color: Colors.white, size: (size.width - 100) / 20),
              SizedBox(width: size.width / 100),
              Text(
                'Filtrele',
                style: kSmallTextStyle.copyWith(
                    color: Colors.white, fontSize: (size.width - 100) / 30),
              ),
            ]),
            onPressed: () {
              setState(() {
                _filterSheet(context);
              });
            },
          ),
          mediumScreen: TextButton(
            child: Row(children: [
              Icon(Icons.filter_alt_outlined, color: Colors.white),
              SizedBox(width: 5),
              Text(
                'Filtrele',
                style: kSmallTextStyle.copyWith(color: Colors.white),
              ),
            ]),
            onPressed: () {
              setState(() {
                _filterSheet(context);
              });
            },
          ),
          largeScreen: TextButton(
            child: Row(children: [
              Icon(Icons.filter_alt_outlined, color: Colors.white),
              SizedBox(width: 5),
              Text(
                'Filtrele',
                style: kSmallTextStyle.copyWith(color: Colors.white),
              ),
            ]),
            onPressed: () {
              setState(() {
                _filterSheet(context);
              });
            },
          ),
        ),
        SizedBox(width: 5),
        TextButton(
          child: Row(children: [
            Icon(Icons.sort, color: Colors.white),
            SizedBox(width: 5),
            Text(
              'Sırala',
              style: kSmallTextStyle.copyWith(color: Colors.white),
            ),
          ]),
          onPressed: () {
            setState(() {
              _orderSheet(context);
            });
          },
        ),
      ],
    );
  }
}
