import 'package:attend_75/src/widgets/common/OutlinedCard.dart';
import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
    required this.subjectName,
    required this.attended,
    required this.classes,
    this.onTap
  });

  final String subjectName;
  final int classes;
  final int attended;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedCard(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      subjectName,
                      style: Theme.of(context).textTheme.titleLarge?.apply(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  const Icon(Icons.arrow_forward),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${classes == 0 ? 0 : (attended / classes * 100).toStringAsFixed(1).toString()}%',
                      style: Theme.of(context).textTheme.displayMedium?.apply(
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 16.0,
                        height: 16.0,
                        child: CircularProgressIndicator(
                          value: classes == 0 ? 0 : attended / classes,
                          color: Theme.of(context).colorScheme.tertiary,
                          strokeWidth: 3.0,
                          backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${classes.toString()} classes',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            '${attended.toString()} attended',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
