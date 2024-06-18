import 'package:dating_app/feature/authentecation/data/cubit_forget_pass/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppForgetPasswordCubit extends Cubit<AppForgetPasswordState> {
  AppForgetPasswordCubit() : super(InitialState());
  resetPasswordLink({required String email}) async {
    try {
      emit(LoadedState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(AppSuccessForgetPasswordState());
    } catch (e) {
      print(e.toString());
      emit(AppErrorForgetPasswordState(
        // error: e.toString(),
      ));
    }
  }
}
