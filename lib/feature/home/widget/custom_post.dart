import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/feature/authentecation/data/cubit_sign_up/auth_sign_up_cubit.dart';
import 'package:dating_app/feature/authentecation/model/user_model.dart';
import 'package:dating_app/feature/home/data/home_cubit/home_cubit.dart';
import 'package:dating_app/feature/home/data/home_cubit/home_state.dart';
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

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
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
      setState(() {});
    } catch (e) {
      print('Error fetching users: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..fetchImages(),
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
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: state.images.map((imageUrl) {
                      return SectionCustomPost(
                        controller: controller,
                        userModel: users[index],
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
