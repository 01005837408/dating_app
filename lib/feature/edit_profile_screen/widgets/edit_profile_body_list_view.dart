import 'package:dating_app/core/model/edit_profile_model.dart';
import 'package:dating_app/feature/edit_profile_screen/widgets/basics_list_view.dart';
import 'package:dating_app/feature/edit_profile_screen/widgets/calture_list_view.dart';
import 'package:dating_app/feature/edit_profile_screen/widgets/life_style_listview.dart';
import 'package:dating_app/feature/edit_profile_screen/widgets/look_list_view.dart';
import 'package:flutter/material.dart';

class EditProfileBodyListView extends StatefulWidget {
  const EditProfileBodyListView({super.key});

  @override
  _EditProfileBodyListViewState createState() => _EditProfileBodyListViewState();
}

class _EditProfileBodyListViewState extends State<EditProfileBodyListView> {
  List<EditProfileBasciModel> editProfileBasicList = [
    EditProfileBasciModel(
      title: 'First Name',
      subtitle: 'hady',
      icon: Icons.person_outline,
    ),
    EditProfileBasciModel(
      title: 'Live In',
      subtitle: 'Cairo, Egypt',
      icon: Icons.info_outline,
    ),
  ];

  List<EditProfileLookModel> editProfileLookList = [
    EditProfileLookModel(
      title: 'Hair Color',
      subtitle: 'black',
      icon: Icons.person_outline,
    ),
    EditProfileLookModel(
      title: 'Eye Color',
      subtitle: 'black',
      icon: Icons.info_outline,
    ),
    EditProfileLookModel(
      title: 'Height',
      subtitle: '175',
      icon: Icons.info_outline,
    ),
    EditProfileLookModel(
      title: 'Weight',
      subtitle: '70',
      icon: Icons.info_outline,
    ),
  ];

  List<EditProfileLifeStyleModel> editProfileLifeStyleList = [
    EditProfileLifeStyleModel(
      title: 'Are You a Smoker?',
      subtitle: 'no',
      icon: Icons.person_outline,
    ),
    EditProfileLifeStyleModel(
      title: 'Marital Status',
      subtitle: 'single',
      icon: Icons.info_outline,
    ),
    EditProfileLifeStyleModel(
      title: 'Do You Have Kids?',
      subtitle: 'no',
      icon: Icons.info_outline,
    ),
    EditProfileLifeStyleModel(
      title: 'Job',
      subtitle: 'engineer',
      icon: Icons.info_outline,
    ),
    EditProfileLifeStyleModel(
      title: 'Income',
      subtitle: 'no',
      icon: Icons.info_outline,
    ),
    EditProfileLifeStyleModel(
      title: 'Live In',
      subtitle: 'house',
      icon: Icons.info_outline,
    ),
  ];

  List<EditProfileCaltureeModel> editProfileCalutreList = [
    EditProfileCaltureeModel(
      title: 'Nationality',
      subtitle: 's',
      icon: Icons.info_outline,
    ),
    EditProfileCaltureeModel(
      title: 'Education',
      subtitle: 's',
      icon: Icons.info_outline,
    ),
    EditProfileCaltureeModel(
      title: 'Languages',
      subtitle: 's',
      icon: Icons.info_outline,
    ),
    EditProfileCaltureeModel(
      title: 'Religion',
      subtitle: 's',
      icon: Icons.info_outline,
    ),
    EditProfileCaltureeModel(
      title: 'Multiple Wives',
      subtitle: 'ssss',
      icon: Icons.info_outline,
    ),
  ];

  void _editSubtitle(int index, String newSubtitle, String listType) {
    setState(() {
      switch (listType) {
        case 'Basic':
          editProfileBasicList[index].subtitle = newSubtitle;
          break;
        case 'Look':
          editProfileLookList[index].subtitle = newSubtitle;
          break;
        case 'LifeStyle':
          editProfileLifeStyleList[index].subtitle = newSubtitle;
          break;
        case 'Culture':
          editProfileCalutreList[index].subtitle = newSubtitle;
          break;
      }
    });
  }

  void _showEditDialog(BuildContext context, int index, String listType) {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Subtitle'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: "Enter new subtitle"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _editSubtitle(index, controller.text, listType);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, top: 60, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Basic Info',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
                indent: 20,
                endIndent: 20,
                color: Colors.blue,
                thickness: 2),
            BascisListView(
              editProfileList: editProfileBasicList,
              onEdit: (index) => _showEditDialog(context, index, 'Basic'),
            ),
            const Text(
              'Look',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
                indent: 20,
                endIndent: 20,
                color: Colors.blue,
                thickness: 2),
            LookListView(
              editProfileLookList: editProfileLookList,
              onEdit: (index) => _showEditDialog(context, index, 'Look'),
            ),
            const Text(
              'Life Style',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
                indent: 20,
                endIndent: 20,
                color: Colors.blue,
                thickness: 2),
            LifeStyleListView(
              editProfileLifeStyleList: editProfileLifeStyleList,
              onEdit: (index) => _showEditDialog(context, index, 'LifeStyle'),
            ),
            const Text(
              'Culture',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
                indent: 20,
                endIndent: 20,
                color: Colors.blue,
                thickness: 2),
            CaltureListView(
              editProfileCalutreList: editProfileCalutreList,
              onEdit: (index) => _showEditDialog(context, index, 'Culture'),
            ),
          ],
        ),
      ),
    );
  }
}
