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

  /// TODO: fix dates.
  factory Appointment.fromJSON(json, index) {
    return Appointment(
      coiffureName: ' ',
      date: json["dayTime"],
      hour: json["dayTime"],
      totalPrice: json["totalPrice"],
      appointmentDetails: json["services"],
    );
  }

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

  /// TODO: need fix.
  factory AppointmentModel.fromJSON(json, index) {
    return AppointmentModel(
      serviceModel: json["serviceName"],
      employeeModel: json["employeeId"],
      hour: json["dayTime"],
    );
  }

  AppointmentModel({
    this.employeeModel,
    this.serviceModel,
    this.hour,
  });
}
