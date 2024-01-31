import 'dart:convert';

import 'package:driver/model/messageModelClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

class MessageController extends GetxController {
  RxList<messageModel> messages = RxList<messageModel>([]);
  WebSocketChannel? channel;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    connectWebSocket();
  }

  @override
  void onClose() {
    closeWebSocket();
    super.onClose();
  }

  void connectWebSocket() {
    channel = IOWebSocketChannel.connect('ws://192.168.2.107:8080');

    channel?.stream.listen((message) {
      //   print('Received message from WebSocket: $message');

      final Map<String, dynamic> jsonData = json.decode(message);
      if (jsonData.containsKey('messages')) {
        final List<dynamic> messageList = jsonData['messages'];
        print(messageList);
        final List<messageModel> parsedMessages =
            messageList.map((json) => messageModel.fromJson(json)).toList();
        messages.assignAll(parsedMessages);
      }
    });

    fetchMessages(); // Fetch existing messages when connecting to WebSocket
  }

  void closeWebSocket() {
    channel?.sink.close();
  }

  void fetchMessages() {
    final data = {
      'table': 'messages',
    };
    final jsonData = json.encode(data);
    channel?.sink.add(jsonData);
  }

  void postMessage(messageModel message) {
    final jsonMessage = message.toJson();
    final data = {
      'table': 'messages', // Specify the table name here
      'values': jsonMessage,
    };
    final jsonData = json.encode(data);
    channel?.sink.add(jsonData);
  }
}
