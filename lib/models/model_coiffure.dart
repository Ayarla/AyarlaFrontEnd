import 'package:ayarla/components/image/imageListItem.dart';
import 'package:ayarla/models/model_employee.dart';
import 'package:ayarla/models/model_service.dart';

class CoiffureModel {
  String name;
  double star;
  int index;
  String city;
  String district;
  List<dynamic> time;
  String text;
  String telephone;
  String address;
  int totalComment;
  List<ImageListItem> images;
  //final bool isPrime;
  List<EmployeeModel> employeeList;
  List<ServiceModel> serviceList;
  String id;
  int gender;
  String location;
  String timePeriod;

  factory CoiffureModel.fromJson(json, int index) {
    return CoiffureModel(
      name: json['accountName'],
      star: json['meanRating'],
      index: index,
      city: json['city'],
      district: json['district'],
      time: json['openCloseTimes'],
      text: json['accountNotes'],
      telephone: json['phone1'],
      address: json['address'],
      totalComment: json['commentNumber'],
      // images: json['accountImage'],
      //isPrime: json['Üye'],
      id: json['id'],
      gender: json['gender'],
      location: json['location'],
      timePeriod: json["timePeriod"],
    );
  }

  CoiffureModel({
    this.name,
    this.time,
    this.index,
    this.star,
    this.text,
    this.city,
    this.district,
    this.telephone,
    this.address,
    this.totalComment,
    this.images,
    //this.isPrime,
    this.employeeList,
    this.serviceList,
    this.id,
    this.gender,
    this.location,
    this.timePeriod,
  });
}
