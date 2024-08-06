import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/feature/home/data/home_cubit/home_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<Map<String, List<String>>> getAllUserImagesStream() {
    return _firestore.collection('users').snapshots().asyncMap((querySnapshot) async {
      final userImages = <String, List<String>>{};

      for (var userDoc in querySnapshot.docs) {
        final userId = userDoc.id;
        final imagesQuerySnapshot = await _firestore
            .collection('users')
            .doc(userId)
            .collection('profile_photos')
            .orderBy('timestamp', descending: true)
            .get();

        final images = imagesQuerySnapshot.docs.map((doc) => doc['url'] as String).toList();
        userImages[userId] = images;
      }

      return userImages;
    });
  }
}
