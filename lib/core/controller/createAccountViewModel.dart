import 'dart:convert';
import 'dart:io';
import 'package:driver/main.dart';
import 'package:driver/view/Auth/carDetails.dart';
import 'package:driver/widget/constant/cash.dart';
import 'package:driver/widget/constant/urls.dart';
import 'package:driver/widget/customeText.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:driver/core/Services/imagePicker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../widget/constant/colors.dart';

class CreateAccountViewModel extends GetxController {
  TextEditingController controller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  File? imageName1;
  File? imageName2;
  File? imageName3;
  String? imagePath1;
  String? imagePath2;
  String? imagePath3;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  bool isLoading = false;
  String? phoneValidate(String? value) {
    if (value!.isEmpty || value.length != 10) {
      return 'الرجاء قم بإدخال رقم صحيح';
    }
    return null;
  }

  String? nameValidate(String? value) {
    if (value!.isEmpty || value.length < 6) {
      return 'الرجاء قم بإدخال اسمك الكامل';
    }
    return null;
  }

  pickImage1() async {
    final pickedFile =
        await ImagePickerHelper().getImage(imageName1, imagePath1);
    if (pickedFile != null) {
      imageName1 = File(pickedFile.path);
      imagePath1 = pickedFile.path;
      update();
    }
  }

  pickImage2() async {
    final pickedFile =
        await ImagePickerHelper().getImage(imageName2, imagePath2);
    if (pickedFile != null) {
      imageName2 = File(pickedFile.path);
      imagePath2 = pickedFile.path;
      update();
    }
  }

  pickImage3() async {
    final pickedFile =
        await ImagePickerHelper().getImage(imageName3, imagePath3);
    if (pickedFile != null) {
      imageName3 = File(pickedFile.path);
      imagePath3 = pickedFile.path;
      update();
    }
  }

  createAccount() async {
    final isValid = key.currentState?.validate();
    if (isValid != null && isValid) {
      try {
        isLoading = true;
        if (isLoading == true) {
          EasyLoading.show();
        }
        final request =
            http.MultipartRequest('POST', Uri.parse(createAccountUrl));

        request.fields['phone'] = '+964${phoneController.value.text}';
        request.fields['name'] = controller.value.text;

        if (imageName1 != null) {
          final file1 =
              await http.MultipartFile.fromPath('image1', imageName1!.path);
          request.files.add(file1);
        }

        if (imageName2 != null) {
          final file2 =
              await http.MultipartFile.fromPath('image2', imageName2!.path);
          request.files.add(file2);
        }

        if (imageName3 != null) {
          final file3 =
              await http.MultipartFile.fromPath('image3', imageName3!.path);
          request.files.add(file3);
        }

        final response = await request.send();
        final responseString = await response.stream.bytesToString();
        var responseBody = jsonDecode(responseString);
        isLoading = false;
        if (isLoading == false) {
          EasyLoading.dismiss();
        }
        print(responseBody);
        if (responseBody['status'] == 'Phone number already exists') {
          Get.showSnackbar(
            GetBar(
              messageText: const CustomText(
                text: 'انت بالفعل تمتلك حساب',
                color: error,
                alignment: Alignment.centerRight,
              ),
              snackPosition: SnackPosition.TOP,
              duration: const Duration(seconds: 5),
            ),
            // colorText: Colors.white,
            //snackPosition: SnackPosition.TOP,
          );
          print('You have already registered your number');
        } else if (responseBody['status'] == 'Data inserted successfully') {
          // make Login here
          box.write(phoneBox, '+964${phoneController.value.text}');
          Get.offAll(CarDetails());
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  void onInit() {
    controller;
    phoneController;
    // TODO: implement onInit
    super.onInit();
  }
}
