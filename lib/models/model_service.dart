import 'package:ayarla/models/model_employee.dart';
import 'package:ayarla/virtual_data_base/temporaryLists.dart';

class ServiceModel {
  final String name;
  final int price;
  bool selected;
  List<EmployeeModel> employees = employeesList;

  ServiceModel({this.selected, this.name, this.employees, this.price});
}
