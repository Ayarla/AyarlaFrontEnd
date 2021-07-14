import 'dart:io';
import 'package:ayarla/components/image/userImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:ayarla/components/image/imageListItem.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import "package:latlong/latlong.dart" as LatLong;
import 'package:mapbox_search/mapbox_search.dart';

class BusinessAndUserData extends ChangeNotifier {
  bool checkBox = false;
  List<ImageListItem> pages = [];
  UserImage userImage;
  LatLong.LatLng markerPosition = LatLong.LatLng(41.015137, 28.979530);
  LatLong.LatLng currentPosition = LatLong.LatLng(41.015137, 28.979530);
  PickResult pickedResult = PickResult();

  setPickedPlace(place) {
    currentPosition = LatLong.LatLng(
        place.geometry.coordinates[1], place.geometry.coordinates[0]);
    markerPosition = LatLong.LatLng(
        place.geometry.coordinates[1], place.geometry.coordinates[0]);
    setInfo(place);
    print("Koordinatlar ${place.geometry.coordinates}");
    notifyListeners();
  }

  setCoiffurePosition(position) {
    currentPosition = LatLong.LatLng(position.latitude, position.longitude);
    markerPosition = LatLong.LatLng(position.latitude, position.longitude);
    print("marker $markerPosition");
    notifyListeners();
  }

  setMarkerPosition(position) {
    markerPosition = LatLong.LatLng(position.latitude, position.longitude);
    notifyListeners();
  }

  setDefault() {
    print('as');
    markerPosition = LatLong.LatLng(41.015137, 28.979530);
    print(markerPosition);

    /// from database
    currentPosition = LatLong.LatLng(41.015137, 28.979530);
    print(currentPosition);

    /// from database
    notifyListeners();
  }

  setInfo(MapBoxPlace place) {
    print("ADdressNumber: ${place.addressNumber}");
    print("BBox: ${place.bbox}");
    print("Context: ${place.context}");
    print("Properties: ${place.properties.address}");
    print("Wikidata: ${place.properties.wikidata}");
  }

  setPickedResult(newResult) {
    pickedResult = newResult;
    print(pickedResult.formattedPhoneNumber);
    notifyListeners();
  }

  addImage(ImageListItem image) {
    pages.add(image);
    notifyListeners();
  }

  deleteImage(ImageListItem image) {
    pages.remove(image);
    notifyListeners();
  }

  setUserImage(UserImage image) {
    userImage = image;
    notifyListeners();
  }
}
