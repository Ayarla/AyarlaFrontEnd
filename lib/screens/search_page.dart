import 'package:ayarla/components/ayarla_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/components/smallCoiffureCard.dart';
import 'package:ayarla/services/service_appointment.dart';
import 'package:ayarla/models/functions.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  Functions functions = Functions();
  List generatingList = [];
  List localCoiffureList;

  @override
  initState() {
    super.initState();
    functions.getLocation();
    //localCoiffureList = coiffureList;
    generatingList = localCoiffureList;
    //Provider.of<AppointmentService>(context, listen: false).currentList = localCoiffureList;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SearchAppBar(
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty) {
                    Provider.of<AppointmentService>(context, listen: false).currentList =
                        Provider.of<AppointmentService>(context, listen: false)
                            .currentList
                            .where((element) => element.name.contains(value))
                            .toList();
                  } else
                    Provider.of<AppointmentService>(context, listen: false).currentList =
                        generatingList;
                });

                /// Known issue - Need fix for entering wrong name.
              },
            ),
          ];
        },
        body: AyarlaPage(
          child: OverScroll(
            child: width < 580
                ? ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: false,
                    itemCount:
                        Provider.of<AppointmentService>(context, listen: true).currentList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 10),
                        child: SmallCoiffureCard(
                            coiffureModel: Provider.of<AppointmentService>(context, listen: true)
                                .currentList[index]),
                      );
                    },
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    padding: EdgeInsets.only(top: 5),
                    itemCount:
                        Provider.of<AppointmentService>(context, listen: true).currentList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Wrap(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: SmallCoiffureCard(
                                coiffureModel:
                                    Provider.of<AppointmentService>(context, listen: true)
                                        .currentList[index]),
                          ),
                        ],
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
