import 'package:flutter/material.dart';
import 'package:otp_api/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final double? radius;
  final double? height;
  final double? width;
  final String buttontext;
  final Color buttonTextColor;
  final Color backgroundColor;
  final double buttonTextSize;
  final BuildContext context;
  final FontWeight buttonTextfontWeight;

  const ButtonWidget(
      {super.key,
      this.radius,
      this.height,
      this.width,
      required this.buttontext,
      required this.buttonTextColor,
      required this.backgroundColor,
      required this.buttonTextSize,
      required this.context,
      required this.buttonTextfontWeight});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(radius!),
          ),
          fixedSize: Size(width!, height!),
          backgroundColor: backgroundColor),
      child: TextWidget(
        context: context,
        text: buttontext,
        fontsize: buttonTextSize,
        color: buttonTextColor,
      ),
    );
  }
}
