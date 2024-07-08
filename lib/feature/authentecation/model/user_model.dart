class UserModel {
  String uid;
  String fname;
  String lname;
  String email;
  // DateTime date;

  UserModel({required this.uid, required this.fname , required this.lname, required this.email, });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fname': fname,
      'lname': lname,
      'email': email,
      // 'date': date.toIso8601String(),
    };
  }

 factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      fname: map['fname'] ?? '',
      lname: map['lname'] ?? '',
      email: map['email'] ?? '',
      // date: map['date'] != null ? DateTime.parse(map['date']) : DateTime.now(),
    );
  }
  
}
