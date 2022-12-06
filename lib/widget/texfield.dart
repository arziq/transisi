import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/theme.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
      this.suffix,
      required this.label,
      required this.controller,
      this.prefix,
      this.errorText,
      this.inputFormatters,
      this.validator,
      this.typeKeyboard})
      : super(key: key);
  final Widget? suffix;
  final Widget? prefix;
  final String label;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;
  final TextInputType? typeKeyboard;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      controller: controller,
      keyboardType: typeKeyboard,
      validator: validator,
      decoration: InputDecoration(
        errorText: errorText == "" ? null : errorText,
        prefix: prefix,
        suffix: suffix,
        focusColor: MyColors.greyColor,
        hoverColor: MyColors.greyColor,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 1,
            color: MyColors.greyColor,
          ),
        ),
        filled: true,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 1,
            color: MyColors.primaryColor,
          ),
        ),
        labelText: label,
      ),
    );
  }
}
