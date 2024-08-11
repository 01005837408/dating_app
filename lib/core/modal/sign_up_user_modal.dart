// class SignUpUserModal {
//   late final String fName;
//   late String lName;
//    String? id;
//   late String email;

//   SignUpUserModal({
//     required this.fName,
//     required this.lName,
//      required this.id,
//     required this.email,
//   });

//   SignUpUserModal.fromJson(Map<String, dynamic> json) {
//     fName = json['fName'] as String;
//     lName = json['lName'] ?? "";
//     id = json['id'] ?? "";
//     email = json['email'] ?? "";
//   }

//   toJson() {
//     return {
//       "fName": fName,
//       "lName": lName,
//       "id": id,
//       "email": email,
//     };
//   }
// }

//  // Map<String, dynamic> toJson() {
//   //   final data = <String, dynamic>{};
//   //   data['fName'] = fName;
//   //    data['lName'] = lName;    
//   //   data['id'] = id;
//   //   data['email'] = email;
//   //   return data;
//   // }