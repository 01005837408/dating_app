import 'package:dating_app/core/model/edit_profile_model.dart';
import 'package:flutter/material.dart';

class LifeStyleListView extends StatelessWidget {
  const LifeStyleListView({super.key, required this.editProfileLifeStyleList});
  final List<EditProfileLifeStyleModel> editProfileLifeStyleList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: editProfileLifeStyleList.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            editProfileLifeStyleList[index].title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            editProfileLifeStyleList[index].subtitle,
            style: const TextStyle(color: Colors.grey),
          ),
          trailing: const Icon(Icons.edit),
        ),
      ),
    );
  }
}