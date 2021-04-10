import 'package:ayarla/components/imageListItem.dart';

class CoiffureModel {
  final String name;
  final double star;
  final int index;
  final String city;
  final String district;
  final String time;
  final String text;
  final int averagePrice;
  final String telephone;
  final String address;
  final int comments;
  final List<ImageListItem> images;
  final String uniqueId;
  final bool isPrime;

  factory CoiffureModel.fromJson(json, int index) {
    return CoiffureModel(
      name: json['İsim'],
      star: json['Yıldız'].toDouble(),
      index: index,
      city: json['İl'],
      district: json['İlçe'],
      time: json['Saatler'],
      text: json['Hakkında'],
      averagePrice: json['Ort Fiyat'],
      telephone: json['Telefon'],
      address: json['Adres'],
      comments: json['Değerl'],
      // images: json['null'],
      uniqueId: json['UniqueId'],
      isPrime: json['Üye'],
    );
  }

  CoiffureModel(
      {this.name,
      this.time,
      this.index,
      this.star,
      this.text,
      this.averagePrice,
      this.city,
      this.district,
      this.telephone,
      this.address,
      this.comments,
      this.images,
      this.uniqueId,
      this.isPrime});
}
