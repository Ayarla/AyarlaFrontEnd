import 'package:ayarla/components/textOverFlowHandler.dart';
import 'package:ayarla/models/model_coiffure.dart';
import 'package:ayarla/services/service_user.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/functions.dart';

class SmallCoiffureCard extends StatefulWidget {
  final CoiffureModel coiffureModel;
  SmallCoiffureCard({this.coiffureModel});
  @override
  _SmallCoiffureCardState createState() => _SmallCoiffureCardState();
}

class _SmallCoiffureCardState extends State<SmallCoiffureCard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return TextButton(
      style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.transparent)),
      onPressed: () {
        Navigator.pushNamed(
          context,
          '/Isletme/${fixTurkishCharacters(createURL(widget.coiffureModel.name))}',
        );
        FirebaseAnalytics()
            .logEvent(name: 'coiffueur_cart', parameters: {'name': widget.coiffureModel.name});
      },
      child: Stack(
        children: [
          cardBody(context),
          Positioned(
            top: 9,
            right: 9,
            child: Material(
              shape: CircleBorder(),
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                onTap: () {
                  setState(() {
                    Provider.of<UserService>(context, listen: false)
                        .setOrChangeFav(widget.coiffureModel);
                  });
                  if (Provider.of<UserService>(context, listen: false)
                      .favorites
                      .contains(widget.coiffureModel)) {
                    FirebaseAnalytics().logEvent(
                        name: 'favorites_button',
                        parameters: {'coiffeur': widget.coiffureModel.name, 'state': 'added'});
                  } else {
                    FirebaseAnalytics().logEvent(
                        name: 'favorites_button',
                        parameters: {'coiffeur': widget.coiffureModel.name, 'state': 'deleted'});
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Icon(
                    Provider.of<UserService>(context, listen: true).
                            favorites
                            .contains(widget.coiffureModel)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                    size: width < 700 ? 20 : 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container cardBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        // boxShadow: <BoxShadow>[BoxShadow(color: Colors.grey, offset: Offset(1, 1), blurRadius: 5)],
      ),
      child: Column(
        children: <Widget>[_cardImage(), CardInfo(coiffureModel: widget.coiffureModel)],
      ),
    );
  }

  _cardImage() =>
      ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.asset('assets/kuafor_0.png'));
}

class CardInfo extends StatelessWidget {
  final coiffureModel;
  CardInfo({this.coiffureModel});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10, top: 8, bottom: 8, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// name
                TextOverFlowHandler(
                    child: Text(coiffureModel.name,
                        style: kTextStyle.copyWith(fontSize: width < 425 ? width / 20 : 20))),
                SizedBox(height: 5),

                /// First line
                Row(
                  children: <Widget>[
                    SizedBox(width: 1),
                    Icon(FontAwesomeIcons.mapMarkerAlt, size: 13, color: Colors.red),
                    SizedBox(width: 7),
                    Padding(
                      padding: EdgeInsets.only(top: 1.0),
                      child: Text(
                        '${coiffureModel.city}, ${coiffureModel.district}',
                        style: kSmallTextStyle.copyWith(
                          color: Colors.grey.withOpacity(0.8),
                          fontSize: 13,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Spacer(),
                    Text('${coiffureModel.time}', style: kTextStyle.copyWith(fontSize: 13)),
                    SizedBox(width: 1),
                  ],
                ),
                SizedBox(height: 2),

                /// Second Line
                Row(
                  children: <Widget>[
                    Icon(Icons.star, color: Colors.yellow.shade700, size: 16),
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
                    width < 340
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
      ],
    );
  }
}
