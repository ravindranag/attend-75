class UserModel {
  String? uid;
  String name;
  String email;
  String password;

  UserModel({
    this.uid,
    required this.name,
    required this.email,
    required this.password,
  });

  toJson() {
    return {
      'name': name,
      'email': email,
      'userId': uid,
    };
  }

  setUid(String uid) {
    this.uid = uid;
  }
}
