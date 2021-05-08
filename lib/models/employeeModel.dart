import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/employeeAndService.dart';

class EmployeeModel {
  final String image;
  final String name;
  final bool selected;
  final Gender gender;
  final List<ServiceModel> services;

  EmployeeModel({
    this.image,
    this.name,
    this.selected,
    this.gender,
    this.services,
  });
}
