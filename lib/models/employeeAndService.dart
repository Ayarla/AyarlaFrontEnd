class EmployeeModel {
  final String image;
  final String name;
  bool selected;
  final String gender;

  EmployeeModel({this.image,this.name,this.selected,this.gender});
}

class ServiceModel{
  final String name;
  final int price;
  bool selected;
  final List<EmployeeModel> employees;

  ServiceModel({this.selected,this.name,this.employees,this.price});
}