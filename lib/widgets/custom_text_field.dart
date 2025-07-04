import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;

  const CustomTextField({required this.hintText, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
