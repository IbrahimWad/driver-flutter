// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'constant/colors.dart';
import 'customeText.dart';

class TextFormCustom extends StatelessWidget {
  TextFormCustom({
    super.key,
    required this.hint,
    required this.text,
    required this.controller,
    required this.validator,
    this.textInputType = TextInputType.text,
    this.fontWeight = FontWeight.normal,
  });

  final String hint;
  final String text;
  final FontWeight fontWeight;
  final TextInputType textInputType;
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
            child: TextFormField(
              keyboardType: textInputType,
              controller: controller,
              validator: validator,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                filled: true,
                fillColor: input,
                hintText: hint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: border),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
