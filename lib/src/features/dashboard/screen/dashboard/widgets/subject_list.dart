import 'package:courses_app/src/features/dashboard/model/subject/subject_model.dart';
import 'package:flutter/material.dart';

import 'subject_card.dart';

class SubjectList extends StatefulWidget {
  const SubjectList({
    super.key,
  });

  @override
  State<SubjectList> createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  final allSubjects = SubjectModel.subjects;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
              SubjectModel subject = allSubjects[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 8.0, horizontal: 16.0),
            child: SubjectCard(
              subjectName: subject.name,
              attended: subject.attended,
              classes: subject.classes,
              onTap: () {
                print('open card ${subject.name}');
              },
            ),
          );
        },
        childCount: allSubjects.length,
      ),
    );
  }
}