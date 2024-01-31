// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constant/colors.dart';
import 'customeText.dart';

class CustomTextForm extends StatelessWidget {
  CustomTextForm({
    Key? key,
    required this.iconsax,
    required this.maxLength,
    required this.hint,
    required this.text,
    required this.controller,
    required this.validator,
    this.fontWeight = FontWeight.normal,
  });

  final IconData iconsax;
  final int maxLength;
  final String hint;
  final String text;
  final FontWeight fontWeight;
  var validator;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Container(
            child: CustomText(
              text: text,
              fontsize: 18,
              color: text1,
              alignment: Alignment.topRight,
              height: 1,
              fontWeight: fontWeight,
            ),
          ),
          Container(
            // height: 80,
            child: TextFormField(
              controller: controller,
              validator: validator,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                filled: true,
                fillColor: input,
                hintText: hint,
                prefixIcon: Container(
                  margin: const EdgeInsets.only(right: 15, left: 5),
                  padding: const EdgeInsets.only(left: 3),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        iconsax,
                        color: text1,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 1,
                        height: 24,
                        color: border,
                        child: const Text(''),
                      ),
                    ],
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: border),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
