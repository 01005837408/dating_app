// ignore_for_file: empty_catches

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

  // Load liked posts for a user
  Future<void> loadLikedPosts({required String userId}) async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('likedPosts')
          .get();
      final likedPosts = snapshot.docs
          .map((doc) => LikedPost.fromJson(doc.data()))
          .toList();
      emit(likedPosts);
    } catch (e) {
      emit([]); // Emit an empty list in case of an error
    }
  }

  // Load posts liked by other users
  Future<void> loadLikesByOthers({required String userId}) async {
    try {
      final snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('likedByOthers')
          .get();
      final likedByOthers = snapshot.docs
          .map((doc) => LikedPost.fromJson(doc.data()))
          .toList();
      emit(likedByOthers);
    } catch (e) {
      emit([]); // Emit an empty list in case of an error
    }
  }

  // Save liked posts for the current user
  Future<void> saveLikedPosts(List<LikedPost> likedPosts) async {
    final user = _auth.currentUser;
    if (user != null) {
      try {
        final batch = _firestore.batch();
        final userLikedPostsCollection = _firestore
            .collection('users')
            .doc(user.uid)
            .collection('likedPosts');

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
      } catch (e) {
      }
    }
  }

  // Toggle post like/unlike
  Future<void> togglePostLike(
    String userId,
    String postId,
    String imageUrl,
    String userName,
  ) async {
    try {
      List<LikedPost> updatedPosts = List.from(state);
      if (isPostLiked(postId)) {
        // If already liked, remove from the liked posts
        updatedPosts.removeWhere((post) => post.postId == postId);
        await _removePostFromLikedByOthers(userId, postId);
      } else {
        // If not liked, add to the liked posts
        final newPost = LikedPost(
          postId: postId,
          imageUrl: imageUrl,
          userName: userName,
        );
        updatedPosts.add(newPost);
        await _addPostToLikedByOthers(userId, newPost);
      }
      await saveLikedPosts(updatedPosts);
    } catch (e) {
    }
  }

  // Check if a post is already liked
  bool isPostLiked(String postId) {
    return state.any((post) => post.postId == postId);
  }

  // Helper method to add a post to 'likedByOthers' collection
  Future<void> _addPostToLikedByOthers(String userId, LikedPost post) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('likedByOthers')
          .doc(post.postId)
          .set(post.toJson());
    } catch (e) {
    }
  }

  // Helper method to remove a post from 'likedByOthers' collection
  Future<void> _removePostFromLikedByOthers(String userId, String postId) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('likedByOthers')
          .doc(postId)
          .delete();
    } catch (e) {
    }
  }
}
