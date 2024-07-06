// profile_photos_header_container.dart

// ignore_for_file: prefer_const_constructors

import 'package:dating_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfilePhotosHeaderContainer extends StatelessWidget {
  final VoidCallback onCameraTap;
  final BuildContext parentContext;

  const ProfilePhotosHeaderContainer({
    super.key,
    required this.onCameraTap,
    required this.parentContext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height / 2.2,
      decoration: BoxDecoration(
        color: AppColor.kPrimaryColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              iconSize: 180,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 30, bottom: 20),
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: IconButton(
                  onPressed: () => onCameraTap(),
                  icon: const Icon(
                    Icons.add,
                    color: AppColor.kPrimaryColor,
                    size: 60,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
