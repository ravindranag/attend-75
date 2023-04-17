import 'package:flutter/material.dart';

class FilledCard extends StatelessWidget {
  FilledCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: child,
    );
  }
}
