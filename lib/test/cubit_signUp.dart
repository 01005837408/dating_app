// import 'package:bloc/bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dating_app/test/signUp_state.dart';
// import 'package:dating_app/test/userModel.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class UserCubit extends Cubit<UserState> {
//   UserCubit() : super(UserInitial());

//   Future<void> signUp(String name, String email, String password, DateTime date) async {
//     try {
//       emit(UserLoading());
//       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       UserModel userModel = UserModel(
//         uid: userCredential.user!.uid,
//         name: name,
//         email: email,
//         date: date,
//       );

//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userModel.uid)
//           .set(userModel.toMap());

//       emit(UserLoaded(userModel));
//     } catch (e) {
//       emit(UserError(e.toString()));
//     }
//   }

//   Future<void> fetchUser(String uid) async {
//     try {
//       emit(UserLoading());
//       DocumentSnapshot userDoc =
//           await FirebaseFirestore.instance.collection('users').doc(uid).get();
//       UserModel userModel = UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
//       emit(UserLoaded(userModel));
//     } catch (e) {
//       emit(UserError(e.toString()));
//     }
//   }
// }
