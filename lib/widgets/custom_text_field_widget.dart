import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.myController,
    required this.hintText,
    required this.labelText,
    this.keyboardType,
  });

  final TextEditingController myController;
  final String hintText;
  final String labelText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      style: const TextStyle(color: Colors.black, fontSize: 21),
      keyboardType: keyboardType ?? TextInputType.name,
      decoration: InputDecoration(
          label: Text(
            labelText,
            style: const TextStyle(color: Colors.grey, fontSize: 24),
          ),
          hintText: hintText,
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(12))),
    );
  }
}
