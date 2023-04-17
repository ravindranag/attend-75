import 'package:courses_app/src/widgets/common/OutlinedCard.dart';
import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  SubjectCard({
    super.key,
    required this.subjectName,
    required this.attended,
    required this.classes,
    this.onTap
  });

  String subjectName;
  int classes;
  int attended;
  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: OutlinedCard(
        child: InkWell(
          onTap: () => onTap!(),
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
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward),
                    )
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
                        '${(attended / classes * 100).toStringAsFixed(1).toString()}%',
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
                            value: 0.60,
                            color: Theme.of(context).colorScheme.tertiary,
                            strokeWidth: 3.0,
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
      ),
    );
  }
}
