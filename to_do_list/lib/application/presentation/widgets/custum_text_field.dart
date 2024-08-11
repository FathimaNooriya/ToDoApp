import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  CustomTextFeild({
    super.key,
    required this.label,
    required this.controller,
    required this.textInputType,
    required this.maxLines,
    required this.validation,
  });
  final TextEditingController controller;
  final String label;
  final TextInputType textInputType;
  final int maxLines;
  final Function() validation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelText: label,
        ),
        validator: (value) {
          return validation(); // Validation function for the input
        },
      ),
    );
  }
}
