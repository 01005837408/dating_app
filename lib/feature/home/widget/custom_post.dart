import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';
import 'package:dating_app/feature/home/data/home_cubit/home_cubit.dart';
import 'package:dating_app/feature/home/data/home_cubit/home_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'section_custom_post.dart';

class CustomPost extends StatefulWidget {
  const CustomPost({super.key});

  @override
  State<CustomPost> createState() => _CustomPostState();
}

class _CustomPostState extends State<CustomPost> {
  PageController controller = PageController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<UserModel> users = [];
  UserModel? currentUser;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      // Get current user
      final currentUserId = FirebaseAuth.instance.currentUser?.uid;
      if (currentUserId == null) {
        print('User not authenticated');
        return;
      }

      // Fetch all users
      QuerySnapshot querySnapshot = await _firestore.collection('users').get();
      users = querySnapshot.docs.map((doc) {
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
        if (data == null) {
          return UserModel(
            uid: '',
            fname: 'Unknown',
            lname: 'User',
            email: '',
          );
        }
        return UserModel.fromMap(data);
      }).toList();

      // Find the current user
      currentUser = users.firstWhere((user) => user.uid == currentUserId,
          orElse: () => UserModel(
                uid: '',
                fname: 'Unknown',
                lname: 'User',
                email: '',
              ));

      print('Current user: ${currentUser?.fname} ${currentUser?.lname}');

      setState(() {});
    } catch (e) {
      print('Error fetching users: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..fetchAllUserImages(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: users.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final user = users[index];
                final images = state.userImages[user.uid] ?? [];

                print(
                    'Displaying images for user: ${user.fname} ${user.lname}, images: $images');

                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: images.map((imageUrl) {
                      return SectionCustomPost(
                        controller: controller,
                        userModel: user,
                        imageUrl: imageUrl,
                      );
                    }).toList(),
                  ),
                );
              },
            );
          } else if (state is HomeError) {
            return Center(child: Text('Error: ${state.error}'));
          } else {
            return Center(child: Text('No images found.'));
          }
        },
      ),
    );
  }
}
