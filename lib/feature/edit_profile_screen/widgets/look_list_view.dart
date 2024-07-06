import 'package:dating_app/core/model/edit_profile_model.dart';
import 'package:flutter/material.dart';

class LookListView extends StatelessWidget {
  const LookListView({super.key, required this.editProfileLookList});
  final List<EditProfileLookModel> editProfileLookList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.6,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: editProfileLookList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            editProfileLookList[index].title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            editProfileLookList[index].subtitle,
            style: const TextStyle(color: Colors.grey),
          ),
          trailing: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
