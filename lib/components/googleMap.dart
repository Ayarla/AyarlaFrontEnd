import 'package:flutter/material.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/virtual_data_base/businessOrUser_data.dart';

class GoogleMapSample extends StatefulWidget {
  static const id = 'GoogleMapSample';
  const GoogleMapSample({Key key}) : super(key: key);
  static final kInitialPosition = LatLng(41.015137, 28.979530);

  @override
  _GoogleMapSampleState createState() => _GoogleMapSampleState();
}

class _GoogleMapSampleState extends State<GoogleMapSample> {
  PickResult selectedPlace;


  @override
  Widget build(BuildContext context) {
    return PlacePicker(
      apiKey: "AIzaSyARRuNgrdwf-x12g2S6xrqyyZ9BZ3vJw2c",
      initialPosition: LatLng(41.015137, 28.979530),
      useCurrentLocation: true,
      selectInitialPosition: true,

      //usePlaceDetailSearch: true,
      onPlacePicked: (result) {
        selectedPlace = result;
        Navigator.of(context).pop();
        setState(() {});
      },
      forceSearchOnZoomChanged: true,
      automaticallyImplyAppBarLeading: false,
      autocompleteLanguage: "tr",
      region: 'tr',
      //selectInitialPosition: true,
      selectedPlaceWidgetBuilder: (_, selectedPlace, state, isSearchBarFocused) {
        print("state: $state, isSearchBarFocused: $isSearchBarFocused");
        return isSearchBarFocused
            ? Container()
            : FloatingCard(
          bottomPosition: 0.0, // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
          leftPosition: 0.0,
          rightPosition: 0.0,
          width: 500,
          borderRadius: BorderRadius.circular(12.0),
          child: state == SearchingState.Searching
              ? Center(child: CircularProgressIndicator())
              : ElevatedButton(
            child: Text("Pick Here"),
            onPressed: () {
              // IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
              //            this will override default 'Select here' Button.
              print("do something with [selectedPlace] data");
              Provider.of<BusinessAndUserData>(
                  context,
                  listen: false).setPickedResult(selectedPlace);
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }
}