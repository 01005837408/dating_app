import 'package:dating_app/feature/edit_profile_screen/data/edit_profile_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'basics_list_view.dart';
import 'calture_list_view.dart';
import 'life_style_listview.dart';
import 'look_list_view.dart';

class EditProfileBodyListView extends StatelessWidget {
  const EditProfileBodyListView({super.key});

  void _showEditDialog(BuildContext context, int index, String listType) {
    final cubit = context.read<EditProfileCubit>();
    TextEditingController controller = TextEditingController();
    final state = cubit.state;

    // Get the corresponding model based on listType and index
    dynamic model;
    switch (listType) {
      case 'Basic':
        model = state.editProfileBasicList[index];
        break;
      case 'Look':
        model = state.editProfileLookList[index];
        break;
      case 'LifeStyle':
        model = state.editProfileLifeStyleList[index];
        break;
      case 'Culture':
        model = state.editProfileCalutreList[index];
        break;
    }

    // Set initial value for the text field
    controller.text = model.subtitle;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit ${model.title}'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Enter new ${model.title}"),
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
                cubit.editSubtitle(index, controller.text, listType);
                cubit.saveUserData();
                //cubit.editSubtitle(index, controller.text, listType); // Update subtitle in cubit state
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
    return BlocProvider(
      create: (context) => EditProfileCubit(FirebaseAuth.instance.currentUser),
      child: BlocBuilder<EditProfileCubit, EditProfileState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 15, left: 15, top: 60, bottom: 20),
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
                    editProfileList: state.editProfileBasicList,
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
                    editProfileLookList: state.editProfileLookList,
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
                    editProfileLifeStyleList: state!.editProfileLifeStyleList,
                    onEdit: (index) =>
                        _showEditDialog(context, index, 'LifeStyle'),
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
                    editProfileCalutreList: state!.editProfileCalutreList,
                    onEdit: (index) =>
                        _showEditDialog(context, index, 'Culture'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
