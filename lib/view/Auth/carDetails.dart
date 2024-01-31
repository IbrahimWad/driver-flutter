import 'package:driver/core/controller/carDetailsViewModel.dart';
import 'package:driver/widget/CustomeBUtton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../widget/TextFormCustom.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: GetBuilder<CarDetailsViewModel>(
              init: CarDetailsViewModel(),
              builder: (controller) {
                return Form(
                  key: controller.key,
                  child: ListView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      TextFormCustom(
                          hint: 'نيسان سني',
                          text: 'نوع السيارة',
                          controller: controller.carType,
                          validator: (value) {
                            return controller.nameValidate(value);
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormCustom(
                          textInputType: TextInputType.datetime,
                          hint: '2020',
                          text: 'سنة اصدار السيارة',
                          controller: controller.carYear,
                          validator: (value) {
                            return controller.yearValidate(value);
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormCustom(
                          hint: 'اسود',
                          text: 'لون السيارة',
                          controller: controller.carColor,
                          validator: (value) {
                            return controller.colorValidate(value);
                          }),
                      SizedBox(
                        height: 50,
                      ),
                      CustomButton(
                          text: 'تاكيد الطلب',
                          onPressed: () {
                            controller.completeData();
                          })
                    ],
                  ),
                );
              })),
    );
  }
}
