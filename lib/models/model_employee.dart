import 'package:ayarla/models/model_service.dart';

class EmployeeModel {
  final String image;
  final String name;
  bool selected;
  final String gender;
  List<ServiceModel> services;
  List<String> availableHours;

  EmployeeModel({
    this.image,
    this.name,
    this.selected,
    this.gender,
    this.services,
    this.availableHours,
  });
}
