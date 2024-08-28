import 'package:dating_app/core/model/edit_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CaltureListView extends StatelessWidget {
  const CaltureListView(
      {super.key, required this.editProfileCalutreList, required this.onEdit});
  final List<EditProfileCultureModel> editProfileCalutreList;
  final Function(int) onEdit;
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
            style:
                 TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            editProfileCalutreList[index].subtitle,
            style: const TextStyle(color: Colors.grey),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => onEdit(index),
          ),
        ),
      ),
    );
  }
}
