import 'package:flutter/material.dart';
import 'constant/colors.dart';
import 'customeText.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color color;
  final Color textColor;
  final Color borderColorButton;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = primry,
    this.textColor = Colors.white,
    this.borderColorButton = primry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: borderColorButton),
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        )),
        onPressed: onPressed,
        child: CustomText(
          alignment: Alignment.center,
          text: text,
          fontsize: 18,
          color: textColor,
          //fontSize: 18,
        ),
      ),
    );
  }
}
