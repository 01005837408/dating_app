class AppLoginState {}

class AppLoginInatialState extends AppLoginState {}

class AppLoginLoadingState extends AppLoginState {}

class AppLoginSuccessState extends AppLoginState {}

class AppLoginErrorState extends AppLoginState {
      String error ;
     AppLoginErrorState({required this.error});
}
class ChangeModePassword extends AppLoginState {

}
