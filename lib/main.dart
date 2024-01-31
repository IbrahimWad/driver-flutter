import 'package:chatview/chatview.dart';
import 'package:driver/core/helper/Bining.dart';
import 'package:driver/view/Orders/OrderScreen.dart';
import 'package:driver/view/mapView/theClientView.dart';
import 'package:driver/view/messages/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

final box = GetStorage();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MessageView(),
      initialBinding: Binding(),
      builder: EasyLoading.init(),
      locale: Locale('ar'),
    );
  }
}
