import 'package:dating_app/core/model/edit_profile_model.dart';
import 'package:flutter/material.dart';

class CaltureListView extends StatelessWidget {
  const CaltureListView({super.key, required this.editProfileCalutreList});
  final List<EditProfileCaltureeModel> editProfileCalutreList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.1,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: editProfileCalutreList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            editProfileCalutreList[index].title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            editProfileCalutreList[index].subtitle,
            style: const TextStyle(color: Colors.grey),
          ),
          trailing: const Icon(Icons.edit),
        ),
      ),
    );
  }
}
