// ignore_for_file: must_be_immutable

import 'package:driver/core/controller/theClientViewModel.dart';
import 'package:driver/model/orderMOdel.dart';
import 'package:driver/view/mapView/googleMap.dart';
import 'package:driver/widget/CustomeBUtton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class theClientView extends StatelessWidget {
  theClientView({
    super.key,
    required this.orderModel,
  });
  OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TheClientViewModel>(builder: (controller) {
      return Scaffold(
          body: Container(
        child: ListView(
          children: [
            CustomButton(
              text: 'الذهاب الى موقع العميل',
              onPressed: () async {
                controller.openGoogleMaps(
                    orderModel.latitude, orderModel.longitude);
                // Get.to(WebViewScreen(
                //     controller: controller.webViewController,
                //     orderModel: OrderModel(
                //         id: orderModel.id,
                //         phone: orderModel.phone,
                //         myLatitude: orderModel.myLatitude,
                //         myLongitude: orderModel.myLongitude,
                //         latitude: orderModel.latitude,
                //         longitude: orderModel.longitude,
                //         salary: orderModel.salary,
                //         payment: orderModel.payment)));
                // controller.launchGoogleMaps(
                //     orderModel.myLatitude, orderModel.myLongitude);
              },
            )
          ],
        ),
      ));
    });
  }
}
