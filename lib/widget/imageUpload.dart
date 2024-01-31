import 'package:dotted_border/dotted_border.dart';
import 'package:driver/widget/constant/colors.dart';
import 'package:driver/widget/customeText.dart';
import 'package:flutter/material.dart';

class ImageUpload extends StatelessWidget {
  ImageUpload(
      {super.key,
      required this.text,
      required this.color,
      required this.textBut});
  final String text;
  final Color color;
  final String textBut;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: CustomText(
              text: text,
              fontWeight: FontWeight.normal,
              alignment: Alignment.centerRight,
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: color,
            ),
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              color: primry,
              child: Container(
                height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cloud_upload_outlined,
                      color: primry,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CustomText(
                      text: textBut,
                      color: primry,
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
