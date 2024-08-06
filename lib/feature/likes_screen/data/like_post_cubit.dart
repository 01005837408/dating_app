import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LikedPost {
  final String imageUrl;
  final String userName;

  LikedPost({required this.imageUrl, required this.userName});

  Map<String, dynamic> toJson() => {
    'imageUrl': imageUrl,
    'userName': userName,
  };

  factory LikedPost.fromJson(Map<String, dynamic> json) => LikedPost(
    imageUrl: json['imageUrl'],
    userName: json['userName'],
  );
}

class LikedPostsCubit extends Cubit<List<LikedPost>> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  LikedPostsCubit() : super([]);

  Future<void> loadLikedPosts({required String userId}) async {
    final snapshot = await _firestore.collection('users').doc(userId).collection('likedPosts').get();
    final likedPosts = snapshot.docs.map((doc) => LikedPost.fromJson(doc.data())).toList();
    emit(likedPosts);
  }

  Future<void> saveLikedPosts(String userId, List<LikedPost> likedPosts) async {
    final batch = _firestore.batch();
    final userLikedPostsCollection = _firestore.collection('users').doc(userId).collection('likedPosts');

    // Clear existing liked posts
    final existingPosts = await userLikedPostsCollection.get();
    for (var doc in existingPosts.docs) {
        batch.delete(doc.reference);
    }

    // Add new liked posts
    for (var post in likedPosts) {
        batch.set(userLikedPostsCollection.doc(), post.toJson());
    }

    await batch.commit();
    emit(likedPosts);
  }

  bool isPostLiked(String userId, String imageUrl, String userName) {
    return state.any((post) => post.imageUrl == imageUrl && post.userName == userName);
  }

  Future<void> togglePostLike(String userId, String imageUrl, String userName) async {
    List<LikedPost> updatedPosts = List.from(state);
    if (isPostLiked(userId, imageUrl, userName)) {
      updatedPosts.removeWhere((post) => post.imageUrl == imageUrl && post.userName == userName);
    } else {
      updatedPosts.add(LikedPost(imageUrl: imageUrl, userName: userName));
    }
    await saveLikedPosts(userId, updatedPosts);
  }
}
