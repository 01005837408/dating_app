import 'package:dating_app/core/model/edit_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BascisListView extends StatelessWidget {
  const BascisListView({
    super.key,
    required this.editProfileList,
    required this.onEdit,
  });

  final List<EditProfileBasicModel> editProfileList;
  final Function(int) onEdit;

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
            style:
                 TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            editProfileList[index].subtitle,
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
