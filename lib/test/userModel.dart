// class UserModel {
//   String uid;
//   String name;
//   String email;
//   DateTime date;

//   UserModel({required this.uid, required this.name, required this.email, required this.date});

//   Map<String, dynamic> toMap() {
//     return {
//       'uid': uid,
//       'name': name,
//       'email': email,
//       'date': date.toIso8601String(),
//     };
//   }

//   factory UserModel.fromMap(Map<String, dynamic> map) {
//     return UserModel(
//       uid: map['uid'],
//       name: map['name'],
//       email: map['email'],
//       date: DateTime.parse(map['date']),
//     );
//   }
// }
