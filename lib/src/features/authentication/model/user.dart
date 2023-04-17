class User {
  String? uid;
  String name;
  String email;

  User(
    this.uid,
    this.name,
    this.email,
  );

  toJson() {
    return {
      'name': name,
      'email': email,
      'userId': uid
    };
  }
}
