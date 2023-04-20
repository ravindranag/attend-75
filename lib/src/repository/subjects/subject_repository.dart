import 'package:attend_75/src/features/dashboard/model/subject/subject_model.dart';
import 'package:attend_75/src/repository/auth/auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SubjectRepository extends GetxController {
  static SubjectRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _authRepo = Get.put(AuthRepository());
  late final allSubjects = <SubjectModel>[].obs;


  @override
  void onReady() {
    getAllSubjects();
  }

  Future<List<SubjectModel>> getAllSubjects() async {
    // print(_authRepo.firebaseUser.value?.uid);
    // return SubjectModel.subjects;
    String uid = _authRepo.firebaseUser.value!.uid;
    try {
      final snapshot = await _db.collection('Subject').where('ownerId', isEqualTo: uid).get();
      final subjects = snapshot.docs.map((e) => SubjectModel.fromSnapshot(e)).toList();
      // print(subjects);
      allSubjects.clear();
      allSubjects.insertAll(0, subjects);
      return subjects;
    } catch (e) {
      // print('empty');
      throw 'Empty list';
    }
  }

  addNewSubject(SubjectModel subject) async {
    String uid = _authRepo.firebaseUser.value!.uid;
    subject.setOwnerId(uid);
    await _db.collection('Subject').add(subject.toJson());
    allSubjects.insert(0, subject);
    // print(allSubjects);
  }

  updateSubject(String id, dynamic data) async {
    await _db.collection('Subject').doc(id).update(data);
    await getAllSubjects();
  }

  deleteSubject(String id) async {
    await _db.collection('Subject').doc(id).delete();
    allSubjects.removeWhere((element) => element.id == id);
  }

}