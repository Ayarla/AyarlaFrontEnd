import 'package:ayarla/models/model_employee.dart';
import 'package:ayarla/models/model_service.dart';

class Appointment {
  String coiffureName;
  int totalPrice;
  String date;
  String hour;
  bool isConfirmedByUser;
  bool isConfirmedByCoiffure;
  List<AppointmentModel> appointmentDetails;

  Appointment({
    this.coiffureName,
    this.totalPrice,
    this.isConfirmedByUser,
    this.isConfirmedByCoiffure,
    this.date,
    this.appointmentDetails,
    this.hour,
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

// class AppointmentInfo {
//   final String service;
//   String employee;
//   List availability;
//   String time;
//   DateTime dateTime;
//   bool isConfirmed;
//
//   AppointmentInfo({
//     this.service,
//     this.employee,
//     this.availability,
//     this.time,
//     this.dateTime,
//     this.isConfirmed = false,
//   });
// }
//
// class AvailabilityData {
//   List availability;
//   DateTime dateTime;
//   String service;
//
//   AvailabilityData({this.availability, this.dateTime, this.service});
// }
//
// class Appointment {
//   List<AppointmentInfo> appointment;
//   String name;
//   int price;
//   Appointment({this.appointment, this.name, this.price});
// }
