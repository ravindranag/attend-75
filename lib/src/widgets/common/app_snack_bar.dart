import 'package:flutter/material.dart';

class AppSnackBar extends StatelessWidget {
  const AppSnackBar({Key? key, required this.content}) : super(key: key);

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return SnackBar(content: content);
  }
}
