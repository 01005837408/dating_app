import 'package:dating_app/feature/authentecation/data/cubit_login/auth_login_state.dart';
import 'package:dating_app/feature/authentecation/data/cubit_sign_up/auth_sign_up_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthSignUpCubit extends Cubit<AuthSignUpState> {
  AuthSignUpCubit() : super(AuthSignUpInitial());
  signUpCreateUserAndPassword({required String emailAddress , required String password})async{
    try {
      emit(AuthSignUpLoading());
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      emit(AuthSignUpSuccess());
    } on FirebaseAuthException catch (e) {

      if (e.code == 'weak-password') {
        emit(AuthSignUpIFailure(error: 'The password provided is too weak.'));

      } else if (e.code == 'email-already-in-use') {
        emit(AuthSignUpIFailure(error: 'The account already exists for that email.'));

      }
    } catch (e) {
      emit(AuthSignUpIFailure(error: e.toString()));

    }
  }
}
