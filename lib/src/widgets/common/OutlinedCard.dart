import 'package:flutter/material.dart';

class OutlinedCard extends StatelessWidget {
  OutlinedCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12))
      ),
      child: child,
    );
  }
}
