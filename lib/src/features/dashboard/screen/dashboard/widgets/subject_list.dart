import 'dart:math';

import 'package:attend_75/src/features/dashboard/model/subject/subject_model.dart';
import 'package:attend_75/src/features/dashboard/screen/subject/subject_detail_screen.dart';
import 'package:attend_75/src/repository/subjects/subject_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'subject_card.dart';

class SubjectList extends StatelessWidget {
  const SubjectList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final subjectRepository = Get.put(SubjectRepository());

    return Obx(
      () => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (SubjectRepository.instance.allSubjects.isEmpty) {
              return const Center(child: Text('Add a subject to track'));
            }
            SubjectModel subject =
                SubjectRepository.instance.allSubjects[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: SubjectCard(
                subjectName: subject.name,
                attended: subject.attended,
                classes: subject.classes,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SubjectDetailScreen(subject: subject);
                      },
                    ),
                  );
                },
              ),
            );
          },
          childCount: max(SubjectRepository.instance.allSubjects.length, 1),
        ),
      ),
    );
  }
}
