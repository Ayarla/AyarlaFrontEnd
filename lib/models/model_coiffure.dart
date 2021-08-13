import 'package:ayarla/components/image/imageListItem.dart';
import 'package:ayarla/models/model_employee.dart';
import 'package:ayarla/models/model_service.dart';

class CoiffureModel {
  final String name;
  final double star;
  final int index;
  final String city;
  final String district;
  final String time;
  final String text;
  final String telephone;
  final String address;
  final int comments;
  final List<ImageListItem> images;
  final String uniqueId;
  final bool isPrime;
  final List<EmployeeModel> employeeList;
  final List<ServiceModel> serviceList;
  final String id;

  factory CoiffureModel.fromJson(json, int index) {
    return CoiffureModel(
      name: json['İsim'],
      star: json['Yıldız'].toDouble(),
      index: index,
      city: json['İl'],
      district: json['İlçe'],
      time: json['Saatler'],
      text: json['Hakkında'],
      telephone: json['Telefon'],
      address: json['Adres'],
      comments: json['Değerl'],
      // images: json['null'],
      uniqueId: json['UniqueId'],
      isPrime: json['Üye'],
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
    this.comments,
    this.images,
    this.uniqueId,
    this.isPrime,
    this.employeeList,
    this.serviceList,
    this.id,
  });
}
