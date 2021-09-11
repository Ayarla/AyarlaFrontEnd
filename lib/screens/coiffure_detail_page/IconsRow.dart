import 'package:ayarla/components/UI/genericIconButton.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/model_coiffure.dart';
import 'package:ayarla/services/service_user.dart';
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
    return Container(
      height: 91,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GenericIconButton(
            iconContext: Icon(Icons.call, color: Colors.green, size: 45),
            onPressed: () => launch("tel://${widget.coiffureModel.telephone}"),
            text: "Ara",
            textStyle: kSmallTextStyle.copyWith(color: Colors.green),
          ),
          GenericIconButton(
            iconContext: Icon(
              Provider.of<UserService>(context, listen: true).favorites.contains(widget.coiffureModel)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.red,
              size: 45,
            ),
            onPressed: () {
              setState(() => Provider.of<UserService>(context, listen: false).setOrChangeFav(widget.coiffureModel));
            },
            text: "Favori",
            textStyle: kSmallTextStyle.copyWith(color: Colors.red),
          ),
          GenericIconButton(
            iconContext: Icon(Icons.ios_share, color: Colors.blue, size: 45),
            text: 'Paylaş',
            textStyle: kSmallTextStyle.copyWith(color: Colors.blue),
            onPressed: () {},
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
      ),
    );
  }
}
