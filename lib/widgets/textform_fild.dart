import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final double? fontSize;
  final double? width;
  final TextInputType? keyboardType;
  final String? hintText;
  final Color? cursorColor;
  final dynamic suffixIcon;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const TextFormFieldWidget({
    Key? key,
    required this.controller,
    this.fontSize,
    this.width,
    required this.hintText,
    this.cursorColor,
    this.suffixIcon,
    this.errorText,
    this.inputFormatters,
    this.keyboardType,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      controller: controller,
      keyboardType: keyboardType,
      autofocus: false,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).hintColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).hintColor),
        ),
      ),
    );
  }
}
