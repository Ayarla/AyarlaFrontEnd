import 'package:ayarla/components/circularParent.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/constants/router.dart';
import 'package:ayarla/models/functions.dart';
import 'package:ayarla/virtual_data_base/businessOrUser_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart" as Latlong;
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_search_flutter/mapbox_search_flutter.dart';
import 'package:provider/provider.dart';

import '../floatingTextButton.dart';

class BusinessFlutterMap extends StatefulWidget {
  @override
  _BusinessFlutterMapState createState() => _BusinessFlutterMapState();
}

class _BusinessFlutterMapState extends State<BusinessFlutterMap> {
  Functions functions = Functions();

  @override
  Widget build(BuildContext context) {
    MapController mapController = MapController();
    Latlong.LatLng markerPoisiton = Provider.of<BusinessAndUserData>(context, listen: true)
        .markerPosition;
    Latlong.LatLng currentPosition =
        Provider.of<BusinessAndUserData>(context, listen: true).currentPosition;

    _onPositionChanged(mapPosition, b) {
       // Provider.of<BusinessAndUserData>(context, listen: false).setMarkerPosition(LatLng(mapPosition.center.latitude, mapPosition.center.longitude));
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: CircularParent(
          radius: 20,
          gradient: functions.decideColor(context),
          direction: Directions.bottom,
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 10),
          icon: BackButton(),
          onPressed: () {
            Provider.of<BusinessAndUserData>(context, listen: false).setDefault();
            Routers.router.pop(context);

          },
        ),
        title: Center(
            child: Text(
          "ayarla",
          style: kTitleStyle.copyWith(
              color: Colors.white, letterSpacing: 3, fontSize: 25),
        )),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 30, left: 10),
            onPressed: () {},
            icon: Icon(Icons.account_circle, color: Colors.white, size: 35),
          ),
        ],
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
      Row(
        children: [
          FloatingTextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    title: Text("Adresinizi giriniz"),
                    content: MapBoxPlaceSearchWidget(
                      popOnSelect: false,
                      apiKey:
                          "pk.eyJ1Ijoibmlsc3VveiIsImEiOiJja25jOTV6cmExanZrMnhxbmNxdm9nMWZvIn0.FeH5rtpx5yIc3b-0To-XJg",
                      searchHint: 'Your Hint here',
                      onSelected: (place) {
                        Provider.of<BusinessAndUserData>(context, listen: false)
                            .setPickedPlace(place);
                        mapController.onReady.then((value) => {
                          mapController.move(Latlong.LatLng(place.geometry.coordinates[1],place.geometry.coordinates[0]), 15)}).then((value) =>  Navigator.of(context).pop());
                      },
                      context: context,
                    ),
                    actions: <Widget>[
                      // usually buttons at the bottom of the dialog
                      TextButton(
                        child: Text("Geri Dön"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            text: "Ara",
            gradient: Functions().decideColor(context),
          ),
          Spacer(),
          FloatingTextButton(
            gradient: Functions().decideColor(context),
            text: "Kaydet",
            onPressed: (){
              Provider.of<BusinessAndUserData>(context, listen: false).setCoiffurePosition(LatLng(markerPoisiton.latitude, markerPoisiton.longitude));
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          center: currentPosition,
          onTap: (mapPosition) {

            Provider.of<BusinessAndUserData>(context, listen: false)
                .setMarkerPosition(
                LatLng(mapPosition.latitude, mapPosition.longitude));
          },
          zoom: 15.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate:
                "https://api.mapbox.com/styles/v1/nilsuoz/ckncausp71d9z17r1wpcxss8p/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoibmlsc3VveiIsImEiOiJja25jOHhiNWoxNTdnMnhsY2sxOGx4MnRsIn0.P8ZkwtMfptFGZE2y2KoEgw",
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1Ijoibmlsc3VveiIsImEiOiJja25jOHhiNWoxNTdnMnhsY2sxOGx4MnRsIn0.P8ZkwtMfptFGZE2y2KoEgw',
              'id': 'mapbox.streets',
            },
          ),
          MarkerLayerOptions(
            markers: [
            Marker(
            width: 50.0,
            height: 50.0,
            point: markerPoisiton,
            builder: (ctx) => Container(
                child: Icon(
                  Icons.location_on_rounded,
                  color: Colors.red,
                )),
          )
            ],
          ),
        ],
      ),
    );
  }
}
