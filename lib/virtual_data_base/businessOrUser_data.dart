import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:ayarla/components/imageListItem.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import "package:latlong/latlong.dart" as LatLong;

class BusinessAndUserData extends ChangeNotifier{
  List<ImageListItem> pages = [];
  File userImage;
  LatLng coiffurePosition = LatLng(41.015137, 28.979530);
  LatLong.LatLng markerPosition=LatLong.LatLng(41.015137, 28.979530);
  LatLong.LatLng currentPosition=LatLong.LatLng(41.015137, 28.979530);
  PickResult pickedResult = PickResult();


  setPickedPlace(place){
    coiffurePosition=LatLng(place.geometry.coordinates[1],place.geometry.coordinates[0]);
    currentPosition = LatLong.LatLng(coiffurePosition.latitude,coiffurePosition.longitude);
    markerPosition = LatLong.LatLng(coiffurePosition.latitude,coiffurePosition.longitude);
    print("Koordinatlar ${place.geometry.coordinates}");
    notifyListeners();
  }
  setCoiffurePosition(position){
    coiffurePosition = position;
    currentPosition = LatLong.LatLng(position.latitude,position.longitude);
    markerPosition = LatLong.LatLng(position.latitude,position.longitude);
    notifyListeners();
  }

  setMarkerPosition(position){
    markerPosition = LatLong.LatLng(position.latitude,position.longitude);
    notifyListeners();
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