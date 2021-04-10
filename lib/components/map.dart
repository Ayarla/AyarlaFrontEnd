import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/virtual_data_base/businessOrUser_data.dart';


class MapSample extends StatefulWidget {
  final bool clickable;
  MapSample({@required this.clickable});
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng( Provider.of<BusinessAndUserData>(context, listen: false).pickedResult.geometry.location.lat,
            Provider.of<BusinessAndUserData>(context, listen: false).pickedResult.geometry.location.lng),
          zoom: 16,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        ///markers: {Provider.of<BusinessAndUserData>(context, listen: false).coiffureLocationMarker},
        rotateGesturesEnabled: widget.clickable,
        scrollGesturesEnabled: widget.clickable,
        zoomControlsEnabled: widget.clickable,
        zoomGesturesEnabled: widget.clickable,
        mapToolbarEnabled: widget.clickable,
      ),

    );
  }

}