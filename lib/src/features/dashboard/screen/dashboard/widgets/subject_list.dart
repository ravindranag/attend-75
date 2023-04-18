import 'dart:math';

import 'package:attend_75/src/features/dashboard/model/subject/subject_model.dart';
import 'package:attend_75/src/repository/subjects/subject_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'subject_card.dart';

class SubjectList extends StatefulWidget {
  const SubjectList({
    super.key,
  });

  @override
  State<SubjectList> createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  final subjectRepository = Get.put(SubjectRepository());
  bool loading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      loading = true;
    });
    subjectRepository.getAllSubjects().then((value) {
      setState(() {
        loading = false;
      });
    }).catchError((e) {
      print(e);
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (SubjectRepository.instance.allSubjects.isEmpty) {
              if (loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Center(child: Text('Add a subject to track'));
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
                  print('open card ${subject.name}');
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
