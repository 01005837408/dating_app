import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/feature/authentecation/data/cubit_sign_up/auth_sign_up_state.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signUp(String fName, String lName, String email, String password,) async {
    try {
      emit(UserLoading());
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel userModel = UserModel(
        uid: userCredential.user!.uid,
        fname: fName,
        lname: lName,
        email: email,
      
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userModel.uid)
          .set(userModel.toMap());

      emit(UserLoaded(userModel));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> fetchUser(String uid) async {
    try {
      emit(UserLoading());
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      UserModel userModel = UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
      emit(UserLoaded(userModel));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

Future<void> login(String email, String password) async {
    try {
      emit(UserLoading());
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      UserModel userModel = UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
      emit(UserLoaded(userModel));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
