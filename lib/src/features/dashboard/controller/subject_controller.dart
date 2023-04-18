import 'package:attend_75/src/features/dashboard/model/subject/subject_model.dart';
import 'package:attend_75/src/repository/subjects/subject_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SubjectController extends GetxController {
  static SubjectController get instance => Get.find();

  final name = TextEditingController();
  final classes = TextEditingController();
  final attended = TextEditingController();

  final _subjectRepository = Get.put(SubjectRepository());

  addNewSubject() async {
    SubjectModel newSubject = SubjectModel(
      name: name.text.trim(),
      attended: int.parse(attended.text.trim()),
      classes: int.parse(classes.text.trim()),
    );
    await _subjectRepository.addNewSubject(newSubject);
  }
}
