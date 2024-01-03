import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.textStyle,
    required this.color,
    this.leftSideRadius = 0,
    this.rightSideRadius = 0,
  });
  final String text;
  final double leftSideRadius;
  final double rightSideRadius;
  final void Function()? onPressed;
  final TextStyle textStyle;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: Size(
          MediaQuery.of(context).size.width * 150 / 375,
          MediaQuery.of(context).size.height * 48 / 812,
        ),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(leftSideRadius),
            topRight: Radius.circular(rightSideRadius),
            bottomLeft: Radius.circular(leftSideRadius),
            bottomRight: Radius.circular(rightSideRadius),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
