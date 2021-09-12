import 'package:ayarla/api_services/appointment_api_services.dart';
import 'package:ayarla/components/image/userImage.dart';
import 'package:ayarla/models/model_appointment.dart';
import 'package:ayarla/models/model_user.dart';
import 'package:flutter/material.dart';

class UserService extends ChangeNotifier {
  AppointmentApiServices _appointmentApiServices = AppointmentApiServices();
  UserModel currentUser = UserModel();
  List<Appointment> waitingAppointments = [];
  List<Appointment> confirmedAppointments = [];
  List favorites = [];
  List notifications = [];
  UserImage userImage;

  redirect(context) {
    if (currentUser.isLoggedIn == false)
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

  getAllAppointments() async => await _appointmentApiServices.getAllAppointment();

  getAppointment({String id}) async => await _appointmentApiServices.getAppointment(id: id);

  deleteAppointment({String id}) async => await _appointmentApiServices.deleteAppointment(id: id);
}
