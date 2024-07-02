import 'package:dating_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfilePhotosHeaderContainer extends StatelessWidget {
  const ProfilePhotosHeaderContainer({
    super.key,
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
          const Padding(
            padding: EdgeInsets.only(top: 60),
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 180,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 30, bottom: 20),
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: const Icon(
                  Icons.add,
                  color: AppColor.kPrimaryColor,
                  size: 60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
