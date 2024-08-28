import 'package:dating_app/core/model/edit_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LookListView extends StatelessWidget {
  LookListView({
    super.key,
    required this.editProfileLookList,
    required this.onEdit,
  });
  final List<EditProfileLookModel> editProfileLookList;
  Function(int) onEdit;
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
            style:
                 TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            editProfileLookList[index].subtitle,
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
