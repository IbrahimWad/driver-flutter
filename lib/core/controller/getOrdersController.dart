import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

import '../../model/orderModel.dart';

class GetOrderController extends GetxController {
  RxList<OrderModel> orders = RxList<OrderModel>([]);
  RxBool isLoading = RxBool(true);
  RxBool hasError = RxBool(false);

  WebSocketChannel? channel;

  Future<void> connectWebSocket() async {
    channel = IOWebSocketChannel.connect('ws://192.168.2.107:8080');

    channel?.stream.listen((message) {
      final List<OrderModel> orderList = parseOrders(message);
      orders.assignAll(orderList);
      isLoading.value = false;
      hasError.value = false;
      update();
    });
  }

  Future<void> closeWebSocket() async {
    await channel?.sink.close();
  }

  Future<void> fetchIrregularData() async {
    isLoading.value = true;
    hasError.value = false;
    await connectWebSocket();
  }

  List<OrderModel> parseOrders(String message) {
    try {
      final parsed = json.decode(message);
      if (parsed is List<dynamic>) {
        return parsed
            .map<OrderModel>((json) => OrderModel.fromJson(json))
            .toList();
      } else if (parsed is Map<String, dynamic>) {
        final inregular = parsed['inregular'];
        if (inregular is List<dynamic>) {
          return inregular
              .map<OrderModel>((json) => OrderModel.fromJson(json))
              .toList();
        } else if (inregular is Map<String, dynamic>) {
          return [OrderModel.fromJson(inregular)];
        }
      }
    } catch (e) {
      print('Error parsing orders: $e');
    }
    return [];
  }

  Future<void> _refreshData() async {
    await fetchIrregularData();
  }

  @override
  void onInit() {
    super.onInit();
    fetchIrregularData();
  }

  @override
  void onClose() {
    closeWebSocket();
    super.onClose();
  }
}
