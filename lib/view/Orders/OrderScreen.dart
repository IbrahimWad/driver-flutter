import 'package:driver/core/controller/getOrdersController.dart';
import 'package:driver/model/orderMOdel.dart';
import 'package:driver/view/mapView/theClientView.dart';
import 'package:driver/widget/CustomeBUtton.dart';
import 'package:driver/widget/constant/colors.dart';
import 'package:driver/widget/customeText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderView extends StatelessWidget {
  final GetOrderController controller = GetOrderController();

  // Future<void> _refreshData() async {
  //  // await controller.fetchIrnegularData();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 70,
          title: CustomText(
            text: 'البحث عن راكب',
            color: primry,
            alignment: Alignment.center,
            fontsize: 24,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: GetX<GetOrderController>(
            init: GetOrderController(),
            builder: (controller) {
              return ListView.separated(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemBuilder: (context, index) {
                  // final order = controller.orders[index];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: bgColor,
                      border: Border.all(color: borderColor),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                alignment: Alignment.center,
                                text: controller.orders[index].phone,
                                fontsize: 16,
                                color: text1,
                              ),
                              CustomText(
                                alignment: Alignment.center,
                                text: '${controller.orders[index].salary}',
                                fontsize: 16,
                                color: success,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        const Divider(color: borderColor, thickness: 1),
                        SizedBox(height: 5),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.gps_fixed_outlined,
                                color: text1,
                              ),
                              CustomText(
                                text: 'where to go',
                                color: text1,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_history,
                                color: text1,
                              ),
                              CustomText(
                                text: 'where i am',
                                color: text1,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.merge_type,
                                    color: text1,
                                  ),
                                  CustomText(
                                      text: controller.orders[index].payment),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.car_rental_sharp),
                                CustomText(text: 'destination'),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                text: 'بدء الرحلة',
                                textColor: primry,
                                borderColorButton: bgColorSec,
                                onPressed: () {
                                  Get.to(theClientView(
                                      orderModel: OrderModel(
                                          id: controller.orders[index].id,
                                          phone: controller.orders[index].phone,
                                          myLatitude: controller
                                              .orders[index].myLatitude,
                                          myLongitude: controller
                                              .orders[index].myLongitude,
                                          latitude:
                                              controller.orders[index].latitude,
                                          longitude: controller
                                              .orders[index].longitude,
                                          salary:
                                              controller.orders[index].salary,
                                          payment: controller
                                              .orders[index].payment)));
                                },
                                color: bgColorSec,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: CustomButton(
                                text: 'تجاهل',
                                textColor: text1,
                                onPressed: () {},
                                color: Colors.white,
                                borderColorButton: borderColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16);
                },
                itemCount: controller.orders.length,
              );
            }),
      ),
    );
  }
}
