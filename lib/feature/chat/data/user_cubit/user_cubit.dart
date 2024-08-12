// import 'package:dating_app/feature/authentecation/data/cubit_sign_up/auth_sign_up_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dating_app/core/api/api.dart';
// import 'package:dating_app/feature/authentecation/model/user_model.dart';



// class UserCubit extends Cubit<UserState> {
//   UserCubit() : super(UserInitial());

//   void fetchUsers() async {
//     emit(UserLoading());
//     try {
//       final usersStream = Api.getAllUser();
//       usersStream.listen((snapshot) {
//         final users = snapshot.docs.map((e) => UserModel.fromMap(e.data())).toList();
//         emit(UserLoaded(users as UserModel));
//       }, onError: (error) {
//         emit(UserError(error.toString()));
//       });
//     } catch (e) {
//       emit(UserError(e.toString()));
//     }
//   }
// }
