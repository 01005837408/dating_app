 class AuthSignUpState {}

class AuthSignUpInitial extends AuthSignUpState {}
 class AuthSignUpLoading extends AuthSignUpState {}
 class AuthSignUpSuccess extends AuthSignUpState {}
 class AuthSignUpIFailure extends AuthSignUpState {
   String error ;
   AuthSignUpIFailure({required this.error}) ;
 }