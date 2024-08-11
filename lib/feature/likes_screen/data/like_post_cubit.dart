import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

class LikedPost {
  final String postId;
  final String imageUrl;
  final String userName;

  LikedPost({
    required this.postId,
    required this.imageUrl,
    required this.userName,
  });

  Map<String, dynamic> toJson() => {
        'postId': postId,
        'imageUrl': imageUrl,
        'userName': userName,
      };

  factory LikedPost.fromJson(Map<String, dynamic> json) => LikedPost(
        postId: json['postId'],
        imageUrl: json['imageUrl'],
        userName: json['userName'],
      );
}

class LikedPostsCubit extends Cubit<List<LikedPost>> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LikedPostsCubit() : super([]);

  Future<void> loadLikedPosts({required String userId}) async {
    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('likedPosts')
        .get();
    final likedPosts =
        snapshot.docs.map((doc) => LikedPost.fromJson(doc.data())).toList();
    emit(likedPosts);
  }

  Future<void> loadLikesByOthers({required String userId}) async {
    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('likedByOthers')
        .get();
    final likedByOthers =
        snapshot.docs.map((doc) => LikedPost.fromJson(doc.data())).toList();
    emit(likedByOthers);
  }

  Future<void> saveLikedPosts(List<LikedPost> likedPosts) async {
    final user = _auth.currentUser;
    if (user != null) {
      final batch = _firestore.batch();
      final userLikedPostsCollection =
          _firestore.collection('users').doc(user.uid).collection('likedPosts');

      // Clear existing liked posts
      final existingPosts = await userLikedPostsCollection.get();
      for (var doc in existingPosts.docs) {
        batch.delete(doc.reference);
      }

      // Add new liked posts
      for (var post in likedPosts) {
        batch.set(userLikedPostsCollection.doc(post.postId), post.toJson());
      }

      await batch.commit();
      emit(likedPosts);
    }
  }

  Future<void> togglePostLike(
    String userId,
    String postId,
    String imageUrl,
    String userName,
  ) async {
    List<LikedPost> updatedPosts = List.from(state);
    if (isPostLiked(postId)) {
      updatedPosts.removeWhere((post) => post.postId == postId);
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('likedByOthers')
          .doc(postId)
          .delete();
    } else {
      final newPost = LikedPost(
        postId: postId,
        imageUrl: imageUrl,
        userName: userName,
      );
      updatedPosts.add(newPost);
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('likedByOthers')
          .doc(postId)
          .set(newPost.toJson());
    }
    await saveLikedPosts(updatedPosts);
  }

  bool isPostLiked(String postId) {
    return state.any((post) => post.postId == postId);
  }
}
