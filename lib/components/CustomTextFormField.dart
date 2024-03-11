import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final TextInputAction? action;
  final TextInputType? type;
  final Color? colorFill;

  CustomTextFormField(
      {required this.controller,
      this.hintText,
      this.validator,
      this.prefixIcon,
      this.type,
      this.action,
      this.colorFill});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      textInputAction: action,
      keyboardType: type,
      style:
          TextStyle(fontWeight: FontWeight.w600, color: Colors.grey.shade700),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Colors.grey.shade700)
            : null,
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade700,
        ),
        fillColor: colorFill ?? Colors.grey.shade300,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
