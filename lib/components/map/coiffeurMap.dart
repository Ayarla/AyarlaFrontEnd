import 'package:ayarla/virtual_data_base/businessOrUser_data.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:provider/provider.dart';

class CoiffeurMap extends StatelessWidget {
  bool enableScroll;
  CoiffeurMap({this.enableScroll=false});
  @override
  Widget build(BuildContext context) {
    MapboxMapController mapController;
    LatLng coordinates = Provider.of<BusinessAndUserData>(context, listen: true).coiffurePosition;
    void _onMapCreated(MapboxMapController controller) {
      mapController = controller;
    }

    return MapboxMap(
      rotateGesturesEnabled: enableScroll,
      scrollGesturesEnabled: enableScroll,
      zoomGesturesEnabled: enableScroll,
      accessToken: "pk.eyJ1Ijoibmlsc3VveiIsImEiOiJja25jOTV6cmExanZrMnhxbmNxdm9nMWZvIn0.FeH5rtpx5yIc3b-0To-XJg",
      styleString: "mapbox://styles/nilsuoz/ckncausp71d9z17r1wpcxss8p",
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        zoom: 15,
        target: coordinates,
      ),
    );
  }
}
