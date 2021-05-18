import 'package:ayarla/constants/constants.dart';
import 'package:ayarla/models/model_service.dart';

class EmployeeModel {
  final String image;
  final String name;
  bool selected;
  final String gender;
  List<ServiceModel> services;

  EmployeeModel({
    this.image,
    this.name,
    this.selected,
    this.gender,
    this.services,
  });
}