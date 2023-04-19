import 'package:attend_75/src/features/dashboard/model/subject/subject_model.dart';
import 'package:attend_75/src/widgets/common/filled_icon_button.dart';
import 'package:attend_75/src/widgets/common/outlined_icon_button.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({
    super.key,
    required this.value,
    required this.name,
    required this.decrement,
    required this.increment,
  });

  final int value;
  final String name;
  final Function(String) increment;
  final Function(String) decrement;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 220,
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Positioned(
                bottom: 0,
                child: OutlinedIconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => widget.decrement(widget.name),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Align(
                child: Container(
                  padding: const EdgeInsets.all(32.0),
                  decoration: BoxDecoration(
                    color: widget.name == 'attended'
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Text(
                    widget.value.toString(),
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: widget.name == 'attended'
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Align(
                alignment: Alignment.topRight,
                child: FilledIconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => widget.increment(widget.name),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
