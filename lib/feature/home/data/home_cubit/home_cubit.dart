import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/feature/home/data/home_cubit/home_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> fetchImages() async {
    try {
      emit(HomeLoading());

      // Get current user
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        emit(HomeError("User not authenticated"));
        return;
      }

      final querySnapshot = await _firestore
          .collection('users')
          .doc(currentUser.uid)
          .collection('profile_photos')
          .orderBy('timestamp', descending: true)
          .get();
      final images =
          querySnapshot.docs.map((doc) => doc['url'] as String).toList();
      print(images.length);
      emit(HomeLoaded(images));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}

