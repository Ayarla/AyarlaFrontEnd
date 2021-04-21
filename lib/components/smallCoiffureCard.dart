import 'package:ayarla/components/UI/responsiveWidget.dart';
import 'package:ayarla/components/textOverFlowHandler.dart';
import 'package:ayarla/constants/router.dart';
import 'package:ayarla/screens/coiffure_detail_page/coiffure_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/screens/search_page.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';

class SmallCoiffureCard extends StatefulWidget {
  final coiffureModel;
  SmallCoiffureCard({this.coiffureModel});

  @override
  _SmallCoiffureCardState createState() => _SmallCoiffureCardState();
}

class _SmallCoiffureCardState extends State<SmallCoiffureCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Routers.router.navigateTo(
          context,
          "/Isletme/:name",
          routeSettings: RouteSettings(
            name: "/Isletme/${fixURL(widget.coiffureModel.name.toString())}",
            arguments: CoiffureDetailPage(
                coiffureModel: widget.coiffureModel,
                name: widget.coiffureModel.name),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Stack(
          children: [
            cardBody(context),
            Positioned(
              top: 9,
              right: 9,
              child: Material(
                shape: CircleBorder(),
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  onTap: () {
                    var state =
                        context.findAncestorStateOfType<SearchPageState>();
                    state.setState(() {});
                    Provider.of<AppointmentData>(context, listen: false)
                        .myState = state;
                    Provider.of<AppointmentData>(context, listen: false)
                        .setOrChangeFav(widget.coiffureModel);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(7),
                    child: ResponsiveWidget(
                      smallScreen: Icon(
                        Provider.of<AppointmentData>(context, listen: true)
                                .favorites
                                .contains(widget.coiffureModel)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                        size: size.width / 25,
                      ),
                      mediumScreen: Icon(
                        Provider.of<AppointmentData>(context, listen: true)
                                .favorites
                                .contains(widget.coiffureModel)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                        // size: size.width / 17,
                      ),
                      largeScreen: Icon(
                        Provider.of<AppointmentData>(context, listen: true)
                                .favorites
                                .contains(widget.coiffureModel)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                        // size: size.width / 17,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container cardBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            offset: const Offset(4, 4),
            blurRadius: 20,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              _cardImage(),
              CardInfo(coiffureModel: widget.coiffureModel),
            ],
          ),
        ),
      ),
    );
  }

  AspectRatio _cardImage() {
    return AspectRatio(
      aspectRatio: 2,
      child: Image.asset(
        'assets/kuafor_0.png',
        fit: BoxFit.cover,
      ),
    );
  }
}

class CardInfo extends StatelessWidget {
  final coiffureModel;
  CardInfo({this.coiffureModel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 8, bottom: 8, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /// name
                  TextOverFlowHandler(
                    child: Text(
                      coiffureModel.name,
                      style: kTextStyle.copyWith(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 5),

                  /// First line
                  Row(
                    children: <Widget>[
                      SizedBox(width: 1),
                      Icon(
                        FontAwesomeIcons.mapMarkerAlt,
                        size: 13,
                        color: Colors.red,
                      ),
                      SizedBox(width: 7),
                      Padding(
                        padding: EdgeInsets.only(top: 1.0),
                        child: TextOverFlowHandler(
                          child: Text(
                            '${coiffureModel.city}, ${coiffureModel.district}',
                            style: kSmallTextStyle.copyWith(
                              color: Colors.grey.withOpacity(0.8),
                              // fontSize: 12,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        '${coiffureModel.time}',
                        style: kTextStyle.copyWith(fontSize: 13),
                      ),
                      SizedBox(width: 1),
                    ],
                  ),
                  SizedBox(height: 2),

                  /// Second Line
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade700,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Padding(
                        padding: EdgeInsets.only(top: 4.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${coiffureModel.star}',
                                style: kSmallTextStyle.copyWith(
                                  color: Colors.grey.withOpacity(0.8),
                                  fontSize: 13,
                                ),
                              ),
                              TextSpan(
                                text: ' (${coiffureModel.comments} yorum)',
                                style: kSmallTextStyle.copyWith(
                                  color: Colors.grey.withOpacity(0.8),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      size.width < 340
                          ? Container()
                          : Padding(
                              padding: EdgeInsets.only(top: 4.0),
                              child: Text(
                                'Çalışma Saatleri',
                                style: kSmallTextStyle.copyWith(
                                  color: Colors.grey.withOpacity(0.8),
                                  fontSize: 13,
                                ),
                              ),
                            ),
                      SizedBox(width: 1),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
