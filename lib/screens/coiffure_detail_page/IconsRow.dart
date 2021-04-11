import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/coiffeurModel.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:ayarla/virtual_data_base/dynamic_links_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class IconsRow extends StatefulWidget {
  final CoiffureModel coiffureModel;

  IconsRow({this.coiffureModel});

  @override
  _IconsRowState createState() => _IconsRowState();
}

class _IconsRowState extends State<IconsRow> {
  final DynamicLinkService _dynamicLinkService = DynamicLinkService();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GenericIconButton(
          iconContext: Icon(
            Icons.call,
            color: Colors.green,
            size: 40,
          ),
          onPressed: () {
            launch("tel://${widget.coiffureModel.telephone}");
          },
          text: "Ara",
          textStyle: kSmallTextStyle.copyWith(color: Colors.green),
        ),
        GenericIconButton(
          iconContext: Icon(
            Provider.of<AppointmentData>(context, listen: false)
                .favorites
                .contains(widget.coiffureModel)
                ? Icons.favorite
                : Icons.favorite_border,
            color: Colors.red,
            size: 40,
          ),
          onPressed: () {
            setState(() {
              if (Provider.of<AppointmentData>(context, listen: false)
                  .myState !=
                  null) {
                Provider.of<AppointmentData>(context, listen: false)
                    .myState
                    .setState(() {});
              }
              Provider.of<AppointmentData>(context, listen: false)
                  .setOrChangeFav(widget.coiffureModel);
            });
          },
          text: "Favori",
          textStyle: kSmallTextStyle.copyWith(color: Colors.red),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<Uri>(
                future: _dynamicLinkService
                    .createDynamicLink(widget.coiffureModel.uniqueId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Uri uri = snapshot.data;
                    return IconButton(
                      iconSize: 40,
                      icon: Icon(
                        Icons.ios_share,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        Share.share(
                          uri.toString(),

                          /// subject for email
                          subject: widget.coiffureModel.name,
                        );
                      },
                    );
                  } else {
                    return Container();
                  }
                }),
            Text(
              "Paylaş",
              style: kSmallTextStyle.copyWith(color: Colors.blue),
            ),
          ],
        ),
      ],
    );
  }
}
