import 'package:flutter/material.dart';

class OutlinedTextField extends StatelessWidget {
  const OutlinedTextField({
    Key? key,
    required this.label,
    this.prefix,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.helperText
  }) : super(key: key);

  final Widget? label;
  final Widget? prefix;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? helperText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: label,
        prefix: prefix,
        helperText: helperText,
      ),
    );
  }
}
