// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontsize;
  final double? height;
  final BuildContext context;
  const TextWidget(
      {this.color,
      required this.context,
      this.fontWeight,
      this.fontsize,
      this.height,
      this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: TextStyle(
          color: color,
          fontSize: fontsize,
          fontWeight: fontWeight,
          height: height),
    );
  }
}
