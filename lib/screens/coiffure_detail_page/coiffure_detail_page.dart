import 'package:ayarla/components/ayarla_page.dart';
import 'package:ayarla/components/floatingTextButton.dart';
import 'package:ayarla/components/imageListItem.dart';
import 'package:ayarla/components/map/flutterMap.dart';
import 'package:ayarla/components/overScroll.dart';
import 'package:ayarla/components/textOverFlowHandler.dart';
import 'package:ayarla/constants/router.dart';
import 'package:ayarla/screens/calender_page.dart';
import 'package:ayarla/screens/coiffure_detail_page/AboutSection.dart';
import 'package:ayarla/screens/coiffure_detail_page/CommentsSection.dart';
import 'package:ayarla/screens/coiffure_detail_page/ContactSection.dart';
import 'package:ayarla/screens/coiffure_detail_page/IconsRow.dart';
import 'package:ayarla/screens/coiffure_detail_page/ImageSection.dart';
import 'package:ayarla/screens/coiffure_detail_page/ServicesSection.dart';
import 'package:ayarla/screens/coiffure_detail_page/EmployeeRow.dart';
import 'package:ayarla/screens/comments_page.dart';
import 'package:ayarla/virtual_data_base/temporaryLists.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/appBar.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/model_coiffeur.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';

class CoiffureDetailPage extends StatefulWidget {
  CoiffureModel coiffureModel;
  final String name;

  /// name is useless.
  CoiffureDetailPage({this.coiffureModel, this.name});
  @override
  _CoiffureDetailPageState createState() => _CoiffureDetailPageState();
}

class _CoiffureDetailPageState extends State<CoiffureDetailPage> {
  List<ImageListItem> _pages = images;
  ScrollController _listViewController = ScrollController();

  @override
  void initState() {
    if (widget.coiffureModel == null) {
      widget.coiffureModel =
          Provider.of<AppointmentData>(context).coiffureList[0];
    }
    Provider.of<AppointmentData>(context, listen: false)
        .setName(widget.coiffureModel.name);
    super.initState();
  }

  @override
  void dispose() {
    _listViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int total = Provider.of<AppointmentData>(context, listen: true).total;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DefaultAppBar(
        gradient: Functions().decideColor(context),
        title: Center(
          child: TextOverFlowHandler(
              child: Text(widget.coiffureModel.name,
                  style: kTitleStyle.copyWith(color: Colors.white))),
        ),
      ).build(context),
      body: ListView(
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        children: [
          AyarlaPage(
            child: OverScroll(
              child: ListView(
                shrinkWrap: true,
                controller: _listViewController,
                children: <Widget>[
                  ImageSection(pages: _pages),
                  SizedBox(height: 10),
                  IconsRow(coiffureModel: widget.coiffureModel),
                  Text("Hakkında", style: kTitleStyle),
                  AboutSection(widget.coiffureModel,
                      controller: _listViewController),
                  ServicesSection(),
                  Text('Personeller', style: kTextStyle),
                  SizedBox(height: 10),
                  EmployeeRow(width: size.width),
                  Row(
                    children: [
                      Text('Yorumlar', style: kTextStyle),
                      Spacer(),
                      TextButton(
                        child: Text('Tümünü Gör',
                            style: kTextStyle.copyWith(
                                fontSize: 12, color: Colors.blue)),
                        onPressed: () {
                          Routers.router.navigateTo(
                            context,
                            "/Isletme/:name/Yorumlar",
                            routeSettings: RouteSettings(
                              name:
                                  "/Isletme/${fixURL(widget.coiffureModel.name.toString())}/Yorumlar",
                              arguments: CommentsPage(),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  CommentsSection(),
                  ContactSection(coiffureModel: widget.coiffureModel),
                  SizedBox(height: 5),

                  /// Map
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 320,
                      width: 300,
                      child: FlutterMapCoiffure(),
                    ),
                  ),

                  /// create enough space for map
                  total != 0
                      ? SizedBox(height: MediaQuery.of(context).size.width / 7)
                      : SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: total != 0
          ? AyarlaPageNoC(
              child: Row(
                children: [
                  FloatingTextButton(text: "Toplam = $total TL"),
                  Spacer(),
                  FloatingTextButton(
                    text: "Saati Belirle",
                    onPressed: () async {
                      await Provider.of<AppointmentData>(context, listen: false)
                          .getServicesWithEmployee();
                      Routers.router.navigateTo(
                        context,
                        'SaatSayfasi',
                        routeSettings: RouteSettings(
                          arguments: CalenderPage(
                              servicesAndEmployees:
                                  Provider.of<AppointmentData>(context,
                                          listen: false)
                                      .servicesAndEmployees),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
