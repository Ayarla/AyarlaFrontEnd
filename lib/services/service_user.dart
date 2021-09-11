import 'package:ayarla/api_services/appointment_api_services.dart';
import 'package:ayarla/components/image/userImage.dart';
import 'package:ayarla/models/model_appointment.dart';
import 'package:ayarla/models/model_user.dart';
import 'package:ayarla/screens/authentication_page.dart';
import 'package:flutter/material.dart';

class UserService extends ChangeNotifier {
  AppointmentApiServices _httpAppointmentFunctions = AppointmentApiServices();
  UserModel currentUser = UserModel(isActive: false);
  List<Appointment> waitingAppointments = [];
  List<Appointment> confirmedAppointments = [];
  List favorites = [];
  List notifications = [];
  UserImage userImage;
  bool checkBox = false;

  redirect(context) {
    if (currentUser.isActive == false)
      WidgetsBinding.instance.addPostFrameCallback((_) => Navigator.pushNamed(context, "/GirisYapmaSayfasi"));
  }

  /// adds or deletes the coiffure from favorites
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

  getAllAppointments() async => await _httpAppointmentFunctions.getAllAppointment();

  deleteAppointment({String id}) async => await _httpAppointmentFunctions.deleteAppointment(id: id);

  /// TODO: function for fetching all appointments of a specific user.
}
