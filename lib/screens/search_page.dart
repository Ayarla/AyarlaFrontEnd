import 'package:ayarla/components/UI/responsiveWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/components/smallCoiffureCard.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/components/UI/logos&icons&texts.dart' as UI;

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  Functions functions = Functions();
  List generatingList = [];
  List coiffureList;
  // List uniqueCodes = ['340101'];

  @override
  initState() {
    super.initState();
    functions.getLocation();
    coiffureList =
        Provider.of<AppointmentData>(context, listen: false).coiffureList;
    generatingList = coiffureList;
    Provider.of<AppointmentData>(context, listen: false).currentList =
        generatingList;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SearchAppBar(
              title: UI.AppBarTitleCustomer(),
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty) {
                    Provider.of<AppointmentData>(context, listen: false)
                            .currentList =
                        Provider.of<AppointmentData>(context, listen: false)
                            .currentList
                            .where((element) => element.name.contains(value))
                            .toList();
                  } else
                    Provider.of<AppointmentData>(context, listen: false)
                        .currentList = generatingList;
                });

                /// Known issue - Need fix for entering wrong name.
              },
              mediaQueryData: MediaQuery.of(context),
            ),
          ];
        },
        body: OverScroll(
          child: ResponsiveWidget(
            smallScreen: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 20),
              itemCount: Provider.of<AppointmentData>(context, listen: true)
                  .currentList
                  .length,
              itemBuilder: (BuildContext context, int index) {
                return SmallCoiffureCard(
                    coiffureModel:
                        Provider.of<AppointmentData>(context, listen: true)
                            .currentList[index]);
              },
            ),
            mediumScreen: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(
                  top: 20, left: size.width / 10, right: size.width / 10),
              itemCount: Provider.of<AppointmentData>(context, listen: true)
                  .currentList
                  .length,
              itemBuilder: (BuildContext context, int index) {
                return SmallCoiffureCard(
                    coiffureModel:
                        Provider.of<AppointmentData>(context, listen: true)
                            .currentList[index]);
              },
            ),
            largeScreen: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
              shrinkWrap: true,
              padding: EdgeInsets.only(
                  top: 20),
              itemCount: Provider.of<AppointmentData>(context, listen: true)
                  .currentList
                  .length,
              itemBuilder: (BuildContext context, int index) {
                return SmallCoiffureCard(
                    coiffureModel:
                        Provider.of<AppointmentData>(context, listen: true)
                            .currentList[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
