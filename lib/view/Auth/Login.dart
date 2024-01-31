import 'package:driver/core/controller/AuthViewModel.dart';
import 'package:driver/view/Auth/createAccount.dart';
import 'package:driver/widget/CustomeBUtton.dart';
import 'package:driver/widget/CustomeTextFormField.dart';
import 'package:driver/widget/constant/colors.dart';
import 'package:driver/widget/customeText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: GetBuilder<AuthViewModel>(
              init: AuthViewModel(),
              builder: (controller) {
                return ListView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      child: const CustomText(
                        text: 'اهلا بك ايها السائق',
                        alignment: Alignment.center,
                        fontsize: 24,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: const CustomText(
                        text: 'قم بتسحيل الدخول للاستفادة من مزايا التطبيق',
                        alignment: Alignment.centerRight,
                        height: 1.5,
                        fontsize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: controller.key,
                      child: Container(
                        //     height: 80,
                        child: CustomTextFormFiled(
                          iconsax: Icons.phone_android,
                          maxLength: 10,
                          hint: '7810000000',
                          text: 'رقم الهاتف',
                          controller: controller.controller,
                          validator: (value) {
                            return controller.validatePhone(value!);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        //  margin: EdgeInsets.symmetric(vertical: 10),
                        //  height: 50,
                        child: CustomButton(
                            text: 'تسجيل الدخول',
                            onPressed: () {
                              controller.login();
                              print('Hello');
                            })),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: 'لا تملك حساب؟'),
                        GestureDetector(
                          onTap: () {
                            Get.offAll(CreateAccount());
                          },
                          child: CustomText(
                            text: 'انشاء الحساب',
                            color: primry,
                          ),
                        )
                      ],
                    )
                  ],
                );
              })),
    );
  }
}
