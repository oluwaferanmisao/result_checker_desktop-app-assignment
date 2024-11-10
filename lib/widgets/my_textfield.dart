import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  const MyTextfield(
    this.maxLength,
    this.icon, {
    required this.controller,
    required this.obscureText,
    required this.labelText,
    super.key,
  });
  // Variables to be used
  final TextEditingController controller;
  final String labelText;
  final Icon icon;
  final int maxLength;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      maxLength: maxLength,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: labelText,
        icon: icon,
      ),
    );
  }
}
