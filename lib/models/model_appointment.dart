import 'package:ayarla/models/model_employee.dart';
import 'package:ayarla/models/model_service.dart';

class Appointment {
  String coiffureName;
  String date;
  String hour;
  int totalPrice;
  bool isConfirmedByUser;
  bool isConfirmedByCoiffure;
  List<AppointmentModel> appointmentDetails;

  Appointment({
    this.coiffureName = '',
    this.hour = '',
    this.date = '',
    this.totalPrice = 0,
    this.isConfirmedByUser = false,
    this.isConfirmedByCoiffure = false,
    this.appointmentDetails,
  });
}

class AppointmentModel {
  ServiceModel serviceModel;
  EmployeeModel employeeModel;
  String hour;

  AppointmentModel({
    this.employeeModel,
    this.serviceModel,
    this.hour,
  });
}
