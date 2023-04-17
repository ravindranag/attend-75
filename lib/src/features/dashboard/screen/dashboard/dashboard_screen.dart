import 'package:courses_app/src/widgets/common/FilledCard.dart';
import 'package:courses_app/src/widgets/common/OutlinedCard.dart';
import 'package:flutter/material.dart';

import 'widgets/subject_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hi Ravindra'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return SubjectCard(
                  subjectName: 'Subject $index',
                  attended: 20,
                  classes: 30,
                  onTap: () {
                    print('open card $index');
                  },
                );
              }, childCount: 8),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
