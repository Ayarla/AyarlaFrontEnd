class AppointmentInfo {
  final String service;
  String employee;
  List availability;
  String time;
  DateTime dateTime;
  bool isConfirmed;
  AppointmentInfo({this.service, this.employee, this.availability, this.time,this.dateTime,this.isConfirmed=false});


}

class AvailabilityData {
  List availability;
  DateTime dateTime;
  String service;

  AvailabilityData({this.availability, this.dateTime,this.service});
}

class Appointment{
  List<AppointmentInfo> appointment;
  String name;
  int price;
  Appointment({this.appointment,this.name,this.price});
}