import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:ayarla/components/imageListItem.dart';

class BusinessAndUserData extends ChangeNotifier{
  List<ImageListItem> pages = [];
  File userImage;
  LatLng coiffurePosition = LatLng(41.015137, 28.979530);
  Marker coiffureLocationMarker;
  PickResult pickedResult = PickResult();

  setPickedResult(newResult){
    pickedResult=newResult;
    print(pickedResult.formattedPhoneNumber);
    notifyListeners();
  }
  addImage(ImageListItem image){
    pages.add(image);
    notifyListeners();
  }
  setUserImage(File image){
    userImage=image;
    notifyListeners();
  }

  setMarker(Marker marker){
    coiffureLocationMarker=marker;
    coiffurePosition=marker.position;
    notifyListeners();
  }


}