class SubjectModel {
  SubjectModel({required this.name, required this.attended, required this.classes});

  String name;
  int classes, attended;

  static List<SubjectModel> subjects = [
    SubjectModel(name: 'Computer Networks', attended: 32, classes: 40),
    SubjectModel(name: 'Software Engineering', attended: 30, classes: 40),
    SubjectModel(name: 'Machine Learning', attended: 36, classes: 40),
    SubjectModel(name: 'Cloud Computing', attended: 39, classes: 40),
  ];
}


