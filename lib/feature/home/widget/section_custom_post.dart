// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/core/spacing/spacing.dart';
import 'package:dating_app/core/utils/assets.dart';
import 'package:dating_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SectionCustomPost extends StatefulWidget {
  SectionCustomPost(
      // this.documentId,
      {
    super.key,
    required this.controller,
    //  required this.signUpUserModal,
  });

  final PageController controller;

  @override
  State<SectionCustomPost> createState() => _SectionCustomPostState();
}

class _SectionCustomPostState extends State<SectionCustomPost> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
 List  data = [];
  getDate() async {
  QuerySnapshot querySnapshot = await  firestore.collection("users").get();
    data.addAll(querySnapshot.docs);
    setState(() {
      
    });
  }

  initState() {
  //  getDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   // CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(Assets.homeImageBody,
              width: double.infinity, height: 300, fit: BoxFit.cover),
          verticalSpacing(6),
          SmoothPageIndicator(
              controller: widget.controller, // PageController
              count: 3,
              effect: const WormEffect(
                dotColor: Colors.grey,
                activeDotColor: AppColor.kPrimaryColor,
              ), // your preferred effect
              onDotClicked: (index) {}),
          InkWell(
            onTap: () {},
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Mohamed",
                      style: const TextStyle(color: AppColor.kPrimaryColor),
                    ),
                    horizontalSpacing(10),
                    Image.asset(
                      Assets.profileImage,
                      width: 40,
                      height: 40,
                    ),
                  ],
                  //
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child:
                      Image.asset(Assets.commentImage, width: 30, height: 30),
                ),
                horizontalSpacing(20),
                InkWell(
                    onTap: () {},
                    child: Image.asset(
                      Assets.loveImageComment,
                      width: 30,
                      height: 30,
                    )),
                // Text("Text"),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("23. Egypt"),
                    Text("online"),
                  ],
                ),
              ],
            ),
          ),
          // Text("Text"),
          verticalSpacing(30),
        ],
      ),
    );
  }
}