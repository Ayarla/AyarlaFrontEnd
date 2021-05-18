import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/model_coiffeur.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

/// TODO - rework for deeplinking.
class IconsRow extends StatefulWidget {
  final CoiffureModel coiffureModel;
  IconsRow({this.coiffureModel});
  @override
  _IconsRowState createState() => _IconsRowState();
}

class _IconsRowState extends State<IconsRow> {
  // final DynamicLinkService _dynamicLinkService = DynamicLinkService();
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
          height: 70,
          width: 70,
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
          height: 70,
          width: 70,
          onPressed: () {
            setState(() {
              if (Provider.of<AppointmentData>(context, listen: false)
                  .myState
                  .mounted) {
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
        GenericIconButton(
          iconContext: Icon(
            Icons.ios_share,
            color: Colors.blue,
            size: 40,
          ),
          text: 'Paylaş',
          textStyle: kSmallTextStyle.copyWith(color: Colors.blue),
          onPressed: () {},
          width: 70,
          height: 70,
        ),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: <Widget>[
        //     FutureBuilder<Uri>(
        //         future: _dynamicLinkService
        //             .createDynamicLink(widget.coiffureModel.uniqueId),
        //         builder: (context, snapshot) {
        //           if (snapshot.hasData) {
        //             Uri uri = snapshot.data;
        //             return IconButton(
        //               iconSize: 40,
        //               icon: Icon(
        //                 Icons.ios_share,
        //                 color: Colors.blue,
        //               ),
        //               onPressed: () {
        //                 Share.share(
        //                   uri.toString(),
        //
        //                   /// subject for email
        //                   subject: widget.coiffureModel.name,
        //                 );
        //               },
        //             );
        //           } else {
        //             return Container();
        //           }
        //         }),
        //     Text(
        //       "Paylaş",
        //       style: kSmallTextStyle.copyWith(color: Colors.blue),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
