import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/feature/likes_screen/data/like_post_cubit.dart';
import 'package:dating_app/feature/likes_screen/data/model_liked_post.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addLikedPost(String userId, String imageUrl, String userName) async {
    try {
      await _firestore.collection('users').doc(userId).collection('likedPosts').add({
        'imageUrl': imageUrl,
        'userName': userName,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error adding liked post: $e');
    }
  }

  Stream<List<LikedPost>> getLikedPosts(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('likedPosts')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => LikedPost.fromJson(doc.data() as Map<String, dynamic>))
            .toList());
  }
}
