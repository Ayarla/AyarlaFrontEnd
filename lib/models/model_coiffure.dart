import 'package:ayarla/components/image/imageListItem.dart';
import 'package:ayarla/models/model_employee.dart';
import 'package:ayarla/models/model_service.dart';

class CoiffureModel {
  final String name;
  final double star;
  final int index;
  final String city;
  final String district;
  final List time;
  final String text;
  final String telephone;
  final String address;
  final int totalComment;
  final List<ImageListItem> images;
  //final bool isPrime;
  final List<EmployeeModel> employeeList;
  final List<ServiceModel> serviceList;
  final String id;
  final int gender;
  final String location;

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
  });
}
