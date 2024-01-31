// ignore_for_file: unnecessary_null_comparison

class CreateAccountModel {
  late String phone, name, image1, image2, image3;

  CreateAccountModel({
    required this.name,
    required this.phone,
    required this.image1,
    required this.image2,
    required this.image3,
  });

  CreateAccountModel.fromeJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    phone = map['phone'];
    name = map['name'];
    image1 = map['drivingLicense'];
    image2 = map['carLicense'];
    image3 = map['idCart'];
  }

  toJson() {
    return {
      'phone': phone,
      'name': name,
      'drivingLicense': image1,
      'carLicense': image2,
      'idCart': image3,
    };
  }
}
