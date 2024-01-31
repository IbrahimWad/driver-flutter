class messageModel {
  final String senderNumber;
  final String receiverNumber;
  final String message;

  messageModel({
    required this.senderNumber,
    required this.receiverNumber,
    required this.message,
  });

  factory messageModel.fromJson(Map<String, dynamic> json) {
    return messageModel(
      senderNumber: json['senderNumber'],
      receiverNumber: json['receiverNumber'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'senderNumber': senderNumber,
      'receiverNumber': receiverNumber,
      'message': message,
    };
  }
}
