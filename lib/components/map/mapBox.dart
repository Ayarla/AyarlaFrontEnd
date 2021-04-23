import 'package:ayarla/virtual_data_base/businessOrUser_data.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_search_flutter/mapbox_search_flutter.dart';
import 'package:provider/provider.dart';
class MapBox extends StatefulWidget {
  static const id = 'MapBoxSample';

  @override
  _MapBoxState createState() => _MapBoxState();
}

class _MapBoxState extends State<MapBox> {
  @override
  Widget build(BuildContext context) {
    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Text("Adresinizi giriniz"),
            content:  MapBoxPlaceSearchWidget(
              popOnSelect: true,
              apiKey: "pk.eyJ1Ijoibmlsc3VveiIsImEiOiJja25jOTV6cmExanZrMnhxbmNxdm9nMWZvIn0.FeH5rtpx5yIc3b-0To-XJg",
              searchHint: 'Your Hint here',
              onSelected: (place) {
                Provider.of<BusinessAndUserData>(context, listen: false).setPickedPlace(place);
              },
              context: context,
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              TextButton(
                child: Text("Adrese Git"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showDialog();
        },
        child: Text("Ara"),
      ),
      body: MapBoxWidget(coordinates: LatLng(Provider.of<BusinessAndUserData>(context, listen: true).selectedPlace.geometry.coordinates[0],
          Provider.of<BusinessAndUserData>(context, listen: true).selectedPlace.geometry.coordinates[1]),),
    );
  }
}

class MapBoxWidget extends StatelessWidget {
  final LatLng coordinates;
  MapBoxWidget({this.coordinates});

  @override
  Widget build(BuildContext context) {
    return MapboxMap(
      styleString: "mapbox://styles/nilsuoz/ckncausp71d9z17r1wpcxss8p",
      initialCameraPosition: CameraPosition(
        zoom: 5.0,
        target: coordinates ?? LatLng(41.015137, 28.979530),
      ),

    );
  }
}

