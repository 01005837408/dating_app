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
      model = state.editProfileCultureList[index];
      break;
  }

  // Set initial value for the text field or dropdown
  TextEditingController controller = TextEditingController();
  controller.text = model.subtitle;

  String dropdownValue = model.subtitle;
  bool isDropdown = false;
  List<String> dropdownOptions = [];
  bool isAge = false;
  int ageValue = 0;

  if (model.title == 'Marital Status') {
    isDropdown = true;
    dropdownOptions = ['Single', 'Married', 'Divorced', 'Widowed'];
    // Ensure the initial value is within the options
    if (!dropdownOptions.contains(dropdownValue)) {
      dropdownValue = dropdownOptions[0]; // default to the first option
    }
  } else if (model.title == 'Religion') {
    isDropdown = true;
    dropdownOptions = ['Muslim', 'Not Muslim'];
    // Ensure the initial value is within the options
    if (!dropdownOptions.contains(dropdownValue)) {
      dropdownValue = dropdownOptions[0]; // default to the first option
    }
  } else if (model.title == 'Age') {
    isAge = true;
    ageValue = int.tryParse(model.subtitle) ?? 0;
  }

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text('Edit ${model.title}'),
            content: isDropdown
                ? DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: dropdownOptions.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                : isAge
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                ageValue = (ageValue > 0) ? ageValue - 1 : 0;
                              });
                            },
                          ),
                          Text(ageValue.toString()),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                ageValue++;
                              });
                            },
                          ),
                        ],
                      )
                    : TextField(
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
              ElevatedButton(
                onPressed: () {
                  if (isDropdown) {
                    cubit.editSubtitle(index, dropdownValue, listType);
                  } else if (isAge) {
                    cubit.editSubtitle(index, ageValue.toString(), listType);
                  } else {
                    cubit.editSubtitle(index, controller.text, listType);
                  }
                  Navigator.of(context).pop();
                },
                child: const Text('Save'),
              ),
            ],
          );
        },
      );
    },
  );
}




  void _handleUpdateUserName(BuildContext context) {
    final cubit = context.read<EditProfileCubit>();
    cubit.updateUserName('New User Name'); // Replace with actual user input
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
                    editProfileCalutreList: state!.editProfileCultureList,
                    onEdit: (index) =>
                        _showEditDialog(context, index, 'Culture'),
                  ),
                  // ElevatedButton(
                  //   onPressed: () => _handleUpdateUserName(context),
                  //   child:const Text('Update UserName'),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
