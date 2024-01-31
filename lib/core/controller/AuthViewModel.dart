import 'dart:convert';

import 'package:driver/core/Services/loginServices.dart';
import 'package:driver/main.dart';
import 'package:driver/model/loginModel.dart';
import 'package:driver/view/Orders/OrderScreen.dart';
import 'package:driver/widget/constant/cash.dart';
import 'package:driver/widget/customeText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../widget/constant/colors.dart';

class AuthViewModel extends GetxController {
  TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  bool isLoading = false;

  String? validatePhone(String value) {
    if (value.length != 10 || value.isEmpty) {
      print(value);
      return 'الرجاء ادخال رقم هاتف صحيح';
    }
    print(value);
    update();
    return null;
  }

  login() async {
    final isValid = key.currentState!.validate();
    if (!isValid) {
      return null;
    } else {
      try {
        isLoading = true;
        if (isLoading == true) {
          EasyLoading.show();
        }
        var response = await LoginService().Login(
          UserModel(
            otp: '',
            phone: '+964${controller.value.text}',
          ),
        );
        var responseBody = jsonDecode(response.body);
        isLoading = false;
        if (isLoading == false) {
          EasyLoading.dismiss();
        }
        print(responseBody['status']);
        if (responseBody['status'] ==
            'Cannot login. Phone number is not verified') {
          Get.showSnackbar(
            GetBar(
              messageText: const CustomText(
                text: 'الرجاء الانتظار حتى يتم الاتصال بك',
                color: error,
                alignment: Alignment.centerRight,
              ),
              snackPosition: SnackPosition.TOP,
              duration: const Duration(seconds: 5),
            ),
            // colorText: Colors.white,
            //snackPosition: SnackPosition.TOP,
          );

          print('canoot login');
        } else if (responseBody['status'] ==
            'Cannot login. Phone number does not exist') {
          // الرقم غير موجود
          Get.showSnackbar(
            GetBar(
              messageText: const CustomText(
                text: 'رقمك غير مسجل.... قم بانشاء حساب',
                color: error,
                alignment: Alignment.centerRight,
              ),
              snackPosition: SnackPosition.TOP,
              duration: const Duration(seconds: 5),
            ),
            // colorText: Colors.white,
            //snackPosition: SnackPosition.TOP,
          );
        } else if (responseBody['status'] == 'OTP sent successfully') {
          Get.offAll(OrderView()); // change to verfication
          box.write(phoneBox, '+964${controller.value.text}');
          // تسجيل الدخول
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  void onInit() {
    controller;
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // controller.dispose();
    controller.clear();
    // TODO: implement onClose
    super.onClose();
  }
}
