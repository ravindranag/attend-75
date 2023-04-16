import 'package:flutter/material.dart';

class OutlinedPasswordTextField extends StatefulWidget {
  OutlinedPasswordTextField({
    Key? key,
    required this.label,
    this.prefix,
    this.controller,
  }) : super(key: key);

  Widget? label;
  Widget? prefix;
  TextEditingController? controller;

  @override
  State<OutlinedPasswordTextField> createState() =>
      _OutlinedPasswordTextFieldState();
}

class _OutlinedPasswordTextFieldState extends State<OutlinedPasswordTextField> {
  bool _showPassword = false;

  void _toggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !_showPassword,
      controller: widget.controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: widget.label,
        prefix: widget.prefix,
        suffixIcon: IconButton(
          onPressed: _toggleShowPassword,
          icon: Icon(_showPassword ? Icons.visibility_off : Icons.visibility),
        )
      ),
    );
  }
}
