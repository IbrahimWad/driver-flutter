class OrderModel {
  late int id;
  late String phone;
  late double myLatitude;
  late double myLongitude;
  late double latitude;
  late double longitude;
  late double salary;
  late String payment;

  OrderModel({
    required this.id,
    required this.phone,
    required this.myLatitude,
    required this.myLongitude,
    required this.latitude,
    required this.longitude,
    required this.salary,
    required this.payment,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      phone: json['phone'],
      myLatitude: json['mylatitude'],
      myLongitude: json['mylongitude'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      salary: json['salary'],
      payment: json['payment'],
    );
  }

  static List<OrderModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => OrderModel.fromJson(json)).toList();
  }
}
