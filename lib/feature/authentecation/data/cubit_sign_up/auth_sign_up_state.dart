import 'package:dating_app/feature/authentecation/model/user_model.dart';
import 'package:dating_app/test/userModel.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}


class ObscurePasswordTextUpdateState extends UserState {}
class UserSuccessState extends UserState {
  final UserModel user;

  UserSuccessState(this.user);
}

class UserError extends UserState {
  final String message;

  UserError(this.message);
}
