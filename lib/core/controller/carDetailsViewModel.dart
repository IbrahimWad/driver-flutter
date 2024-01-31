import 'dart:convert';

import 'package:driver/main.dart';
import 'package:driver/model/carDetailsModel.dart';
import 'package:driver/view/Auth/completeView.dart';
import 'package:driver/widget/constant/cash.dart';
import 'package:driver/widget/constant/urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CarDetailsViewModel extends GetxController {
  TextEditingController carType = TextEditingController();
  TextEditingController carColor = TextEditingController();
  TextEditingController carYear = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  bool isLoading = false;

  String? nameValidate(String? value) {
    if (value!.isEmpty || value.length < 5) {
      return 'الرجاء قم بادخال اسم السيارة';
    }
    return null;
  }

  String? yearValidate(String? value) {
    if (value?.length != 4) {
      return 'الرجاء قم بادخال عام صحيح';
    }
    return null;
  }

  String? colorValidate(String? value) {
    if (value!.length < 4) {
      return 'الرجاء قم بادخال لون';
    }
    return null;
  }

  completeData() async {
    final isValid = key.currentState!.validate();
    if (!isValid) {
    } else {
      try {
        isLoading = true;
        if (isLoading) {
          EasyLoading.show();
        }
        print(box.read(phoneBox));
        var response = await http.post(Uri.parse(carDetailsUrl),
            body: carDetailsModel(
                    name: carType.value.text,
                    color: carColor.value.text,
                    year: carYear.value.text,
                    phone: box.read(phoneBox))
                .toJson());

        var responseBody = jsonDecode(response.body);
        print(responseBody);
        isLoading = false;
        if (!isLoading) {
          EasyLoading.dismiss();
        }
        if (responseBody['status'] == 'Data has been inserted successfully') {
          print('Every Think gose well');
          Get.offAll(CompleteView());
        } else {
          print('SomeThing went wrong');
        }
      } catch (e) {
        print(e);
      }
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    carType;
    carColor;
    carYear;
    //nameValidate('');
    super.onInit();
  }
}
