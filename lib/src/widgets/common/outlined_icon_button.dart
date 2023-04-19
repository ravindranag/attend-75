import 'package:flutter/material.dart';

class OutlinedIconButton extends StatelessWidget {
  const OutlinedIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      style: OutlinedButton.styleFrom(
          side: BorderSide(
              color: Theme.of(context).colorScheme.outline
          )
      ),
    );
  }
}