import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: hint),
        ));
  }
}
