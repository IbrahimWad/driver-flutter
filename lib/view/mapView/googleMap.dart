import 'package:driver/model/orderMOdel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final WebViewController controller;
  final OrderModel orderModel;

  const WebViewScreen({
    required this.orderModel,
     required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Simple Example'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
