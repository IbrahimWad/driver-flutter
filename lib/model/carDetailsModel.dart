// ignore_for_file: unnecessary_null_comparison

class carDetailsModel {
  late String color, name, year, phone;

  carDetailsModel({
    required this.name,
    required this.color,
    required this.year,
    required this.phone,
    // required this.image2,
    // required this.image3,
  });

  carDetailsModel.fromeJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    year = map['carYear'];
    name = map['carType'];
    color = map['carColor'];
    phone = map['phone'];
    // image2 = map['carLicense'];
    // image3 = map['idCart'];
  }

  toJson() {
    return {
      'carYear': year,
      'carType': name,
      'carColor': color,
      'phone': phone,
    };
  }
}
