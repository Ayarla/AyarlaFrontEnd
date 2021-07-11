import 'package:ayarla/models/model_employee.dart';

class ServiceModel {
  final String name;
  final int price;
  bool selected;
  final List<EmployeeModel> employees;

  ServiceModel({this.selected, this.name, this.employees, this.price});
}