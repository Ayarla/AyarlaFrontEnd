import 'package:ayarla/models/model_appointment.dart';
import 'package:flutter/material.dart';

class UserService extends ChangeNotifier {
  List<Appointment> waitingAppointments = [];
  List<Appointment> confirmedAppointments = [];
  List favorites = [];

  ///adds or deletes the coiffure from favorites
  setOrChangeFav(coiffureModel) {
    if (favorites.contains(coiffureModel)) {
      favorites.remove(coiffureModel);
    } else {
      favorites.add(coiffureModel);
    }
    notifyListeners();
  }
}
