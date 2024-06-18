import 'package:dating_app/feature/authentecation/data/cubit_login/auth_login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLoginCubit extends Cubit<AppLoginState> {
  AppLoginCubit() : super(AppLoginInatialState());

  Future<void> userLogin(
      {required String email, required String password}) async {
    emit(AppLoginLoadingState());
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(AppLoginSuccessState());
    }  catch (e) {

      emit(AppLoginErrorState(
        error: e.toString(),
      ));
    }
  }
}