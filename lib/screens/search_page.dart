import 'dart:math';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/components/unFocuser.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/model_coiffure.dart';
import 'package:ayarla/services/service_appointment.dart';
import 'package:flutter/material.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/smallCoiffureCard.dart';
import 'package:ayarla/models/functions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => SearchPageState();
}

/// • Process: [generatingList] contains the all available coiffures on the screen.
///
/// • [localCoiffureList] holds the initial list. Do NOT edit or change it.
class SearchPageState extends State<SearchPage> {
  Functions functions = Functions();
  List<CoiffureModel> localCoiffureList = [];
  List<CoiffureModel> generatingList = [];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double _value = 0;

  getter() async {
    Provider.of<AppointmentService>(context, listen: false).mainCoiffureList.clear();
    localCoiffureList.clear();
    localCoiffureList =
        await Provider.of<AppointmentService>(context, listen: false).getAllCoiffures();
    generatingList = localCoiffureList;
  }

  @override
  initState() {
    super.initState();
    functions.getLocation();
    getter();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final padding = MediaQuery.of(context).padding.top;
    return UnFocuser(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.grey.shade200,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [appBar()],
          body: Provider.of<AppointmentService>(context, listen: true).mainCoiffureList.isEmpty
              ? SpinKitDoubleBounce(itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                      decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index.isEven ? Colors.grey : Colors.blueGrey,
                  ));
                })
              : body(width),
        ),
        drawer: leftDrawer(width, padding),
        endDrawer: rightDrawer(width, padding),
      ),
    );
  }

  appBar() => SearchAppBar(
      openDrawer: () => _scaffoldKey.currentState.openDrawer(),
      openEndDrawer: () => _scaffoldKey.currentState.openEndDrawer(),
      onChanged: (value) {
        if (value.toString().isNotEmpty && generatingList.isEmpty) {
          generatingList = localCoiffureList;
        } else if (value.toString().isNotEmpty) {
          generatingList = generatingList
              .where((element) =>
                  element.name.contains(value) || element.name.toLowerCase().contains(value))
              .toList();
        } else
          generatingList = localCoiffureList;
      });

  final Color small = Colors.black;
  final Color title = Colors.black;

  body(double width) => OverScroll(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Wrap(
                runSpacing: 0,
                spacing: 0,
                alignment: WrapAlignment.center,
                children: [
                  for (CoiffureModel coiffureModel in generatingList)
                    SmallCoiffureCard(coiffureModel: coiffureModel)
                ],
              ),
            ),
          ],
        ),
      );
  leftDrawer(double width, double padding) => Drawer(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(10),
          children: [
            SizedBox(height: padding),
            SizedBox(height: 10),
            Center(child: Text('Sıralama', style: kTitleStyle.copyWith(color: title))),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Yıldıza göre sırala', style: kSmallTitleStyle),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          child: Text('Azdan Çoka', style: kSmallTextStyle),
                          onPressed: () {
                            generatingList.sort((a, b) => a.star.compareTo(b.star));
                            super.setState(() {});
                            Navigator.pop(context);
                          },
                        ),
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(pi),
                          child: Icon(Icons.stacked_bar_chart,
                              size: width <= 400 ? width / 16 : 25, color: small),
                        ),
                        SizedBox(width: 5),

                        /// MORE TO LESS ACC STARS
                        TextButton(
                          child: Text('Çoktan Aza', style: kSmallTextStyle),
                          onPressed: () {
                            generatingList.sort((b, a) => a.star.compareTo(b.star));
                            super.setState(() {});
                            Navigator.pop(context);
                          },
                        ),
                        Icon(Icons.stacked_bar_chart,
                            size: width <= 400 ? width / 16 : 25, color: small),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.cover,
                      child: Text('Yorumlara göre sırala', style: kSmallTitleStyle),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          child: Center(child: Text('Azdan Çoka', style: kSmallTextStyle)),
                          onPressed: () {
                            // generatingList.sort((a, b) => a.comments.compareTo(b.comments));
                            super.setState(() {});
                            Navigator.pop(context);
                          },
                        ),
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(pi),
                          child:
                              Icon(Icons.stacked_bar_chart, size: width <= 400 ? width / 16 : 25),
                        ),
                        SizedBox(width: 5),
                        TextButton(
                          child: Center(child: Text('Çoktan Aza', style: kSmallTextStyle)),
                          onPressed: () {
                            // generatingList.sort((b, a) => a.comments.compareTo(b.comments));
                            super.setState(() {});
                            Navigator.pop(context);
                          },
                        ),
                        Icon(Icons.stacked_bar_chart, size: width <= 400 ? width / 16 : 25),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextButton(
                  child: Text('Sekmeyi Kapat', style: kTextStyle.copyWith(color: Colors.red[300])),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ),
      );
  rightDrawer(double width, double padding) => Drawer(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(10),
          children: [
            SizedBox(height: padding),
            SizedBox(height: 10),
            Center(child: Text('Filtreleme', style: kTitleStyle.copyWith(color: title))),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
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
                      activeColor: Colors.blueGrey,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                          generatingList =
                              generatingList.where((element) => element.star >= value).toList();
                          super.setState(() {});
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextButton(
                  child: Text('Sekmeyi Kapat', style: kTextStyle.copyWith(color: Colors.red[300])),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ),
      );
}
