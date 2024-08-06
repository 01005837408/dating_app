import 'package:dating_app/feature/edit_profile_screen/widgets/edit_profile_body_list_view.dart';
import 'package:flutter/material.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      child: const Column(
        children: [
          CircleAvatar(
            radius: 35,
          ),
          EditProfileBodyListView(),
        ],
      ),
    );
  }
}
