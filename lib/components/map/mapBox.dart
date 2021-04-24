import 'package:ayarla/components/circularParent.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/constants/router.dart';
import 'package:ayarla/models/functions.dart';
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

  Functions functions = Functions();
  @override
  Widget build(BuildContext context) {
    MapboxMapController mapController;
    LatLng coordinates = Provider.of<BusinessAndUserData>(context, listen: true).coiffurePosition;
    void _onMapCreated(MapboxMapController controller) {
      mapController = controller;
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
            onPressed: () {
            },
            icon: Icon(Icons.account_circle, color: Colors.white, size: 35),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context,
            builder: (BuildContext context) {
              // return object of type Dialog
              return AlertDialog(
                title: Text("Adresinizi giriniz"),
                content:  MapBoxPlaceSearchWidget(
                  popOnSelect: false,
                  apiKey: "pk.eyJ1Ijoibmlsc3VveiIsImEiOiJja25jOTV6cmExanZrMnhxbmNxdm9nMWZvIn0.FeH5rtpx5yIc3b-0To-XJg",
                  searchHint: 'Your Hint here',
                  onSelected: (place) {
                    Provider.of<BusinessAndUserData>(context, listen: false).setPickedPlace(place);
                    setState(()  {
                      coordinates= Provider.of<BusinessAndUserData>(context, listen: false).coiffurePosition;
                    });
                  },
                  context: context,
                ),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  TextButton(
                    child: Text("Adrese Git"),
                    onPressed: () {
                      mapController.moveCamera(CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: coordinates,
                            zoom: 15,
                          )
                      ));
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Text("Ara"),
      ),
      body: MapboxMap(
        accessToken: "pk.eyJ1Ijoibmlsc3VveiIsImEiOiJja25jOTV6cmExanZrMnhxbmNxdm9nMWZvIn0.FeH5rtpx5yIc3b-0To-XJg",
        styleString: "mapbox://styles/nilsuoz/ckncausp71d9z17r1wpcxss8p",
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          zoom: 15.0,
          target: coordinates,
        ),
      ),
    );
  }
}

