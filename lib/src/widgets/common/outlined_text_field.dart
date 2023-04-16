import 'package:flutter/material.dart';

class OutlinedTextField extends StatelessWidget {
  OutlinedTextField({
    Key? key,
    required this.label,
    this.prefix,
    this.controller,
  }) : super(key: key);

  Widget? label;
  Widget? prefix;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: label,
        prefix: prefix,
      ),
    );
  }
}
