// import 'dart:convert';
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LikedPost {
//   final String imageUrl;
//   final String userName;

//   LikedPost({required this.imageUrl, required this.userName});

//   Map<String, dynamic> toJson() => {
//         'imageUrl': imageUrl,
//         'userName': userName,
//       };

//   factory LikedPost.fromJson(Map<String, dynamic> json) => LikedPost(
//         imageUrl: json['imageUrl'],
//         userName: json['userName'],
//       );
// }

// class LikedPostsCubit extends Cubit<List<LikedPost>> {
//   LikedPostsCubit() : super([]);

//   Future<void> loadLikedPosts() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? likedPostsString = prefs.getString('likedPosts');
//     if (likedPostsString != null) {
//       List<dynamic> likedPostsJson = json.decode(likedPostsString);
//       emit(likedPostsJson.map((json) => LikedPost.fromJson(json)).toList());
//     }
//   }

//   Future<void> saveLikedPosts(List<LikedPost> likedPosts) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String likedPostsString =
//         json.encode(likedPosts.map((post) => post.toJson()).toList());
//     await prefs.setString('likedPosts', likedPostsString);
//     emit(likedPosts);
//   }

//   bool isPostLiked(String imageUrl, String userName) {
//     return state.any(
//         (post) => post.imageUrl == imageUrl && post.userName == userName);
//   }

//   void togglePostLike(String imageUrl, String userName) {
//     List<LikedPost> updatedPosts = List.from(state);
//     if (isPostLiked(imageUrl, userName)) {
//       updatedPosts.removeWhere(
//           (post) => post.imageUrl == imageUrl && post.userName == userName);
//     } else {
//       updatedPosts.add(LikedPost(imageUrl: imageUrl, userName: userName));
//     }
//     saveLikedPosts(updatedPosts);
//   }
// }
