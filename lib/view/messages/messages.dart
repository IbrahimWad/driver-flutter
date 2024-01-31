import 'package:driver/core/controller/messageViewModel.dart';
import 'package:driver/model/messageModelClass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageView extends StatelessWidget {
  final MessageController _messageController = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                if (_messageController.messages.isEmpty) {
                  return Center(
                    child: Text('No messages'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: _messageController.messages.length,
                    itemBuilder: (context, index) {
                      final message = _messageController.messages[index];
                      return ListTile(
                        title: Text(message.senderNumber),
                        subtitle: Text(message.message),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController.textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final senderNumber = '+7816841440';
                    final receiverNumber = '+7816841441';
                    final message =
                        _messageController.textEditingController.text;

                    final newMessage = messageModel(
                      senderNumber: senderNumber,
                      receiverNumber: receiverNumber,
                      message: message,
                    );

                    _messageController
                        .postMessage(newMessage);
                    _messageController.textEditingController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
