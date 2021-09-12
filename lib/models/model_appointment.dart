import 'package:ayarla/models/model_employee.dart';
import 'package:ayarla/models/model_service.dart';
import 'package:ayarla/services/service_user.dart';
import 'package:provider/provider.dart';

class Appointment {
  String coiffureName;
  String date;
  DateTime dateTime;
  String hour;
  int totalPrice;
  bool isConfirmedByUser;
  bool isConfirmedByCoiffure;
  List<dynamic> appointmentDetails;

  Appointment({
    this.coiffureName = '',
    this.hour = '',
    this.date = '',
    this.totalPrice = 0,
    this.isConfirmedByUser = false,
    this.isConfirmedByCoiffure = false,
    this.appointmentDetails,
    this.dateTime,
  });

  /// TODO: need fixes.
  factory Appointment.fromJSON(json, index) {
    return Appointment(
      coiffureName: ' ',
      date: json["dayTime"].toString().substring(0, 10),
      hour: json["dayTime"].toString().substring(11, 19),
      totalPrice: json["totalPrice"],
      appointmentDetails: json["services"],
    );
  }

  Map<String, dynamic> appointmentToJson() => {
        // "userId": Provider.of<UserService>(context, listen: false).currentUser.id,
        "dayTime": dateTime.toString(),
        "services": appointmentDetails.map((e) => e.appointmentModelToJson()).toList(),
        "totalPrice": totalPrice,
        // "accountId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
        // "employeeId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      };
}

class AppointmentModel {
  ServiceModel serviceModel;
  EmployeeModel employeeModel;
  String hour;
  DateTime dateTime;

  AppointmentModel({
    this.employeeModel,
    this.serviceModel,
    this.hour,
    this.dateTime,
  });

  /// TODO: no need - but we need a fromJSON.
  // factory AppointmentModel.toJSON(json, index) {
  //   return AppointmentModel(
  //     serviceModel: json["serviceName"],
  //     employeeModel: json["employeeId"],
  //     hour: json["dayTime"],
  //   );
  // }

  /// TODO: Rework
  Map<String, dynamic> appointmentModelToJson() => {
        // "employeeId": employeeModel.name?,
        "serviceName": serviceModel.name ?? '',
        "price": serviceModel.price ?? 0,
        "serviceTime": hour,
        "serviceType": 1,
        "dateTime": dateTime.toString(),
        // "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6"
      };
}
