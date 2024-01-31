import 'package:driver/view/Auth/Login.dart';
import 'package:driver/widget/CustomeBUtton.dart';
import 'package:driver/widget/constant/colors.dart';
import 'package:driver/widget/customeText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteView extends StatelessWidget {
  const CompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          const SizedBox(
            height: 200,
          ),
          const CustomText(
            text: 'تم حفظ معلوماتك بنجاح!',
            fontsize: 30,
            alignment: Alignment.center,
            color: primry,
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomText(
            text: 'الرجاء الانتظار حتى يتم التاكد من معلوماتك',
            fontsize: 20,
            alignment: Alignment.center,
            color: text2,
          ),
          const CustomText(
            text: 'او قم بالاتصال على الرقم التالي :  07816841440',
            fontsize: 18,
            alignment: Alignment.center,
            color: text2,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: CustomButton(
                text: 'الذهاب الى صفحة تسجيل الدخول',
                onPressed: () {
                  Get.offAll(const Login());
                }),
          )
        ],
      )),
    );
  }
}
