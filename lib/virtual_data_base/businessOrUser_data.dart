import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:ayarla/components/imageListItem.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_search/mapbox_search.dart';
import "package:latlong/latlong.dart" as LatLong;

class BusinessAndUserData extends ChangeNotifier{
  List<ImageListItem> pages = [];
  File userImage;
  LatLong.LatLng markerPosition=LatLong.LatLng(41.015137, 28.979530);
  LatLong.LatLng currentPosition=LatLong.LatLng(41.015137, 28.979530);
  PickResult pickedResult = PickResult();


  setPickedPlace(place){
    currentPosition = LatLong.LatLng(place.geometry.coordinates[1],place.geometry.coordinates[0]);
    markerPosition = LatLong.LatLng(place.geometry.coordinates[1],place.geometry.coordinates[0]);
    setInfo(place);
    print("Koordinatlar ${place.geometry.coordinates}");
    notifyListeners();
  }
  setCoiffurePosition(position){
    currentPosition = LatLong.LatLng(position.latitude,position.longitude);
    markerPosition = LatLong.LatLng(position.latitude,position.longitude);
    notifyListeners();
  }

  setMarkerPosition(position){
    markerPosition = LatLong.LatLng(position.latitude,position.longitude);
    notifyListeners();
  }

  setInfo(MapBoxPlace place){
    print("ADdressNumber: ${place.addressNumber}");
    print("BBox: ${place.bbox}");
    print("Context: ${place.context}");
    print("Properties: ${place.properties.address}");
    print("Wikidata: ${place.properties.wikidata}");
  }
  setPickedResult(newResult){
    pickedResult=newResult;
    print(pickedResult.formattedPhoneNumber);
    notifyListeners();
  }
  addImage(ImageListItem image){
    pages.add(image);
    notifyListeners();
  }
  deleteImage(ImageListItem image){
    pages.remove(image);
    notifyListeners();
  }
  setUserImage(File image){
    userImage=image;
    notifyListeners();
  }
  

}