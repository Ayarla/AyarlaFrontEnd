import 'package:ayarla/components/image/userImage.dart';
import 'package:ayarla/models/model_appointment.dart';
import 'package:ayarla/screens/search_page.dart';
import 'package:flutter/material.dart';

class UserService extends ChangeNotifier {
  List<Appointment> waitingAppointments = [];
  List<Appointment> confirmedAppointments = [];
  List favorites = [];
  UserImage userImage;
  bool checkBox = false;
  ///adds or deletes the coiffure from favorites
  setOrChangeFav(coiffureModel) {
    if (favorites.contains(coiffureModel)) {
      favorites.remove(coiffureModel);
    } else {
      favorites.add(coiffureModel);
    }
    notifyListeners();
  }

  setUserImage(UserImage image) {
    userImage = image;
    notifyListeners();
  }

  State myState = SearchPage().createState();
}
