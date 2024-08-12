class UserModel {
  final String uid;
  final String fname;
  final String lname;
  final String email;
  final String imageUrl; // Add this field for the image URL

  UserModel({
    required this.uid,
    required this.fname,
    required this.lname,
    required this.email,
    required this.imageUrl, // Initialize it
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      fname: map['fname'] ?? '',
      lname: map['lname'] ?? '',
      email: map['email'] ?? '',
      imageUrl: map['imageUrl'] ?? '', // Map this field
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fname': fname,
      'lname': lname,
      'email': email,
      'imageUrl': imageUrl, // Add this field to the map
    };
  }
}
