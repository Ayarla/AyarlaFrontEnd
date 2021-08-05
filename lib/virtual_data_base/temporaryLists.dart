import 'package:ayarla/components/image/imageListItem.dart';
import 'package:ayarla/models/model_employee.dart';
import 'package:ayarla/models/model_service.dart';

List<ImageListItem> images = [
  ImageListItem(image: "assets/kuafor_0.png", covered: true),
  ImageListItem(image: "assets/kuafor_1.jpg", covered: true),
  ImageListItem(image: "assets/kuafor_2.jpg", covered: true),
];

List<ServiceModel> newServiceList = [
  ServiceModel(name: 'Saç Kesimi', price: 20, selected: false),
  ServiceModel(name: 'Sakal Kesimi', price: 10, selected: false),
  ServiceModel(name: 'Saç Boyama', price: 100, selected: false),
  ServiceModel(name: 'Manikür', price: 30, selected: false),
  ServiceModel(name: 'Pedikür', price: 30, selected: false),
  ServiceModel(name: 'Perma', price: 100, selected: false),
  ServiceModel(name: 'Saç Bakımı', price: 50, selected: false),
];

//used in coiffure_detail card
List<EmployeeModel> employeesList = [
  EmployeeModel(name: 'Nilsu Öz', image: 'assets/worker_3.png', gender: 'female', selected: false),
  EmployeeModel(image: 'assets/worker_1.png', name: 'Fatih Özkan', selected: false, gender: 'male'),
  EmployeeModel(
      image: 'assets/worker_2.jpg', name: 'Bahadır İren', selected: false, gender: 'male'),
  EmployeeModel(image: 'assets/worker_1.png', name: 'Semih Gümüş', selected: false, gender: 'male'),
  EmployeeModel(
      image: 'assets/worker_2.jpg', name: 'Ahmed Akif Kaya', selected: false, gender: 'male'),
];

///fullTimeService List
///=> used in coiffure_detail card
///TODO halfTime services should be added.
List<ServiceModel> fullTimeServices = [
  ServiceModel(name: 'Saç Kesimi', price: 20, selected: false, employees: [
    EmployeeModel(
        image: 'assets/worker_3.png', name: 'Nilsu Öz', selected: false, gender: "female"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Fatih Özkan', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Bahadır İren', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Semih Gümüş', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Ahmed Akif Kaya', selected: false, gender: "male"),
  ]),
  ServiceModel(name: 'Sakal Kesimi', price: 10, selected: false, employees: [
    EmployeeModel(
        image: 'assets/worker_3.png', name: 'Nilsu Öz', selected: false, gender: "female"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Fatih Özkan', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Bahadır İren', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Semih Gümüş', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Ahmed Akif Kaya', selected: false, gender: "male"),
  ]),
  ServiceModel(name: 'Saç Boyama', price: 100, selected: false, employees: [
    EmployeeModel(
        image: 'assets/worker_3.png', name: 'Nilsu Öz', selected: false, gender: "female"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Fatih Özkan', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Bahadır İren', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Semih Gümüş', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Ahmed Akif Kaya', selected: false, gender: "male"),
  ]),
  ServiceModel(name: 'Manikür', price: 30, selected: false, employees: [
    EmployeeModel(
        image: 'assets/worker_3.png', name: 'Nilsu Öz', selected: false, gender: "female"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Fatih Özkan', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Bahadır İren', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Semih Gümüş', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Ahmed Akif Kaya', selected: false, gender: "male"),
  ]),
  ServiceModel(name: 'Pedikür', price: 30, selected: false, employees: [
    EmployeeModel(
        image: 'assets/worker_3.png', name: 'Nilsu Öz', selected: false, gender: "female"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Fatih Özkan', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Bahadır İren', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Semih Gümüş', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Ahmed Akif Kaya', selected: false, gender: "male"),
  ]),
  ServiceModel(name: 'Perma', price: 100, selected: false, employees: [
    EmployeeModel(
        image: 'assets/worker_3.png', name: 'Nilsu Öz', selected: false, gender: "female"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Fatih Özkan', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Bahadır İren', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Semih Gümüş', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Ahmed Akif Kaya', selected: false, gender: "male"),
  ]),
  ServiceModel(name: 'Saç Bakımı', price: 50, selected: false, employees: [
    EmployeeModel(
        image: 'assets/worker_3.png', name: 'Nilsu Öz', selected: false, gender: "female"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Fatih Özkan', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Bahadır İren', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_1.png', name: 'Semih Gümüş', selected: false, gender: "male"),
    EmployeeModel(
        image: 'assets/worker_2.jpg', name: 'Ahmed Akif Kaya', selected: false, gender: "male"),
  ]),
];

ServiceModel defaultService =
    ServiceModel(name: 'Hizmet Adı', price: 20, selected: false, employees: [
  EmployeeModel(
    image: 'assets/worker_3.png',
    name: 'Nilsu Öz',
    selected: false,
    gender: "female",
  ),
  EmployeeModel(image: 'assets/worker_1.png', name: 'Fatih Özkan', selected: false, gender: "male"),
  EmployeeModel(
      image: 'assets/worker_2.jpg', name: 'Bahadır İren', selected: false, gender: "male"),
  EmployeeModel(image: 'assets/worker_1.png', name: 'Semih Gümüş', selected: false, gender: "male"),
  EmployeeModel(
      image: 'assets/worker_2.jpg', name: 'Ahmed Akif Kaya', selected: false, gender: "male"),
]);

EmployeeModel defaultEmployee = EmployeeModel(
  image: 'assets/default_employee.jpg',
  name: 'Çalışan Ekle',
  selected: false,
  gender: "female",
);
