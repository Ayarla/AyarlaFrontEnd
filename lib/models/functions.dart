import 'dart:io';
import 'dart:ui';
import 'package:ayarla/components/image/userImage.dart';
import 'package:ayarla/models/model_employee.dart';
import 'package:ayarla/models/model_service.dart';
import 'package:ayarla/virtual_data_base/appointment_data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:ayarla/components/circularParent.dart';
import 'package:ayarla/components/image/imageListItem.dart';
import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/virtual_data_base/businessOrUser_data.dart';
import 'package:ayarla/virtual_data_base/login.dart';
import '../virtual_data_base/genderSelection.dart';
import 'package:flutter/rendering.dart';

class Functions {
  decideColor(context) {
    Gender selectedGender =
        Provider.of<GenderSelection>(context, listen: false).currentGender[0];
    if (selectedGender == Gender.female) {
      return LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Color(0xFFffa7ca), Color(0xFFca7799)],
      );
    } else if (selectedGender == Gender.male) {
      return LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF09C6F9), Color(0xFF045DE9)],
      );
    } else if (selectedGender == Gender.unisex) {
      return LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [Color(0xFF7b5ba7), Color(0xFF3f6eb6)],
      );
    }
  }

  void getLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    PermissionStatus _serviceGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    _permissionGranted = await location.hasPermission();
    if ((!_serviceEnabled) &&
        _permissionGranted != PermissionStatus.denied &&
        _serviceGranted != PermissionStatus.denied) {
      print(_permissionGranted);
      _serviceEnabled = await location.requestService();
      _serviceGranted = PermissionStatus.deniedForever;
      _permissionGranted = PermissionStatus.deniedForever;
      if (!_serviceEnabled) {
        _serviceGranted = PermissionStatus.deniedForever;
        return;
      }
    }

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = PermissionStatus.deniedForever;
        return;
      }
    }
    try {
      _locationData = await location.getLocation();
      print(_locationData);
    } catch (e) {
      print(e);
    }
  }

  /// Will be removed.
  createTitle(BuildContext context, String title) {
    final size = MediaQuery.of(context).size;
    Functions functions = Functions();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width / 10),
      decoration: BoxDecoration(
          gradient: functions.decideColor(context),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Center(
          child: FittedBox(
            fit: BoxFit.cover,
            child: Text(
              title,
              style: kTitleStyle.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
  /// takes image from file
  /// TODO dart:io web desteği yok
  imageFromFile(context) async {

    ///Image fromPicker = await ImagePickerFoWeb.getImage(
    ///    outputType: ImageType.widget);

    PickedFile fromPicker = await ImagePicker().getImage(source: ImageSource.gallery);
    if (fromPicker != null) {
      if (Provider
          .of<Login>(context, listen: false)
          .isManager) {
        Provider.of<BusinessAndUserData>(context, listen: false)
            .addImage(ImageListItem(isFile:false,isImage: true, covered: true, fileImage: fromPicker,));
      } else {
        Provider.of<BusinessAndUserData>(context, listen: false)
            .setUserImage(UserImage(isFile:false,image: fromPicker));
      }
    }
    }

  ///takes an image from camera and adds it to the list
  imgFromCamera(context) async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    if (image != null) {
      if (Provider.of<Login>(context, listen: false).isManager) {
        Provider.of<BusinessAndUserData>(context, listen: false)
            .addImage(ImageListItem(file: image, isFile: true, covered: true));
      } else {
        Provider.of<BusinessAndUserData>(context, listen: false)
            .setUserImage(UserImage(isFile:true,fileImage: image));
      }
    }
  }

  ///takes an image from gallery and adds it to the list
  imgFromGallery(context) async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    if (image != null) {
      if (Provider.of<Login>(context, listen: false).isManager) {
        Provider.of<BusinessAndUserData>(context, listen: false)
            .addImage(ImageListItem(file: image, isFile: true, covered: true));
      } else {
        Provider.of<BusinessAndUserData>(context, listen: false)
            .setUserImage(UserImage(isFile:true,fileImage: image));
      }
    }
  }

  void showPicker(context) {
    bool isWeb;
    try{
      if(Platform.isAndroid||Platform.isIOS) {
        isWeb=false;
      } else {
        isWeb=true;
      }
    } catch(e){
      isWeb=true;
    }
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return CircularParent(
            radius: 20,
            direction: Directions.top,
            color: Colors.white,
            child: new Wrap(
              children: <Widget>[
                if(isWeb==true)
                new ListTile(
                  leading: new Icon(Icons.upload_file),
                  title: new Text('Dosya'),
                  tileColor: Colors.transparent,
                  onTap: () {
                    imageFromFile(context);
                    Navigator.of(context).pop();
                  },
                )
                else
                  Column(
                    children: [
                      new ListTile(
                          leading: new Icon(Icons.photo_library),
                          title: new Text('Galeri'),
                          tileColor: Colors.transparent,
                          onTap: () {
                            imgFromGallery(context);
                            Navigator.of(context).pop();
                          }),
                      new ListTile(
                        leading: new Icon(Icons.photo_camera),
                        title: new Text('Kamera'),
                        tileColor: Colors.transparent,
                        onTap: () {
                          imgFromCamera(context);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  )

              ],
            ),
          );
        });
  }

  int findIndex(ServiceModel x, context) {
    return Provider.of<AppointmentData>(context, listen: false)
        .fullTimeServices
        .indexOf(x);
  }

  int findIndexOfEmployee(int employeeIndex, EmployeeModel y, context) {
    return Provider.of<AppointmentData>(context, listen: false)
        .fullTimeServices[employeeIndex]
        .employees
        .indexOf(y);
  }

  int findIndexEmployee(EmployeeModel y, context) {
    return Provider.of<AppointmentData>(context, listen: false)
        .employeesList
        .indexOf(y);
  }
}

/// Fixes the coiffure detail page URL for web.
String createURL(String url) => url.replaceAll(' ', '-');

// String reverseURL(String url) => url.replaceAll('-', ' ');

String fixTurkishCharacters(String string) {
  List charList = ['Ö', 'ö', 'ı', 'İ', 'ş', 'Ş', 'Ç', 'ç', 'Ü', 'ü', 'Ğ', 'ğ'];
  List charList2 = ['O', 'o', 'i', 'I', 's', 'S', 'C', 'c', 'U', 'u', 'G', 'g'];
  for (String letter in charList)
    string = string.replaceAll(letter, charList2[charList.indexOf(letter)]);
  return string;
}
