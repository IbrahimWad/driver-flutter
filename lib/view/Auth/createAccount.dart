import 'package:driver/core/controller/createAccountViewModel.dart';
import 'package:driver/view/Auth/Login.dart';
import 'package:driver/widget/CustomeBUtton.dart';
import 'package:driver/widget/CustomeTextForm.dart';
import 'package:driver/widget/CustomeTextFormField.dart';
import 'package:driver/widget/constant/colors.dart';
import 'package:driver/widget/imageUpload.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Get.offAll(Login());
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: primry,
                  size: 30,
                ))
          ],
        ),
        body: GetBuilder<CreateAccountViewModel>(
          init: CreateAccountViewModel(),
          builder: (controller) {
            return Form(
              key: controller.key,
              child: ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  Container(
                    // height: 180,
                    child: CustomTextFormFiled(
                        iconsax: Icons.phone_android,
                        maxLength: 10,
                        hint: '7500000000',
                        text: 'رقم الهاتف',
                        controller: controller.phoneController,
                        validator: (value) {
                          return controller.phoneValidate(value);
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextForm(
                    iconsax: Icons.person_2_rounded,
                    maxLength: 50,
                    hint: 'ابراهيم وديع المحمود',
                    text: 'الاسم',
                    controller: controller.controller,
                    validator: (value) {
                      return controller.nameValidate(value);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.pickImage1();
                    },
                    child: ImageUpload(
                        text: 'اجازة السوق',
                        color: controller.imageName1 != null
                            ? bgSuccess
                            : bgColorSec,
                        textBut: controller.imageName1 == null
                            ? 'تحميل اجازة السوق'
                            : 'تم تحميل الملف'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.pickImage2();
                    },
                    child: ImageUpload(
                        text: 'السنوية',
                        color: controller.imageName2 != null
                            ? bgSuccess
                            : bgColorSec,
                        textBut: controller.imageName2 == null
                            ? 'تحميل السنوية'
                            : 'تم تحميل الملف'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.pickImage3();
                    },
                    child: ImageUpload(
                        text: 'الجنسية',
                        color: controller.imageName3 != null
                            ? bgSuccess
                            : bgColorSec,
                        textBut: controller.imageName3 == null
                            ? 'تحميل الجنسية'
                            : 'تم تحميل الملف'),
                  ),
                  // ImageUpload(text: text, textBut: textBut)
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      text: 'ارسل الوثائق',
                      onPressed: () {
                        controller.createAccount();
                      })
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
