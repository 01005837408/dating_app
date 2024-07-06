import 'package:dating_app/core/model/edit_profile_model.dart';
import 'package:flutter/material.dart';

class BascisListView extends StatelessWidget {
  const BascisListView({super.key, required this.editProfileList});
  final List<EditProfileBasciModel> editProfileList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4.8,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: editProfileList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            editProfileList[index].title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            editProfileList[index].subtitle,
            style: const TextStyle(color: Colors.grey),
          ),
          trailing: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
