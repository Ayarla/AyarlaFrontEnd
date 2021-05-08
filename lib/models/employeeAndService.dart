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

class ServiceModel {
  final String name;
  final int price;
  bool selected;
  final List<EmployeeModel> employees;

  ServiceModel({this.selected, this.name, this.employees, this.price});
}
