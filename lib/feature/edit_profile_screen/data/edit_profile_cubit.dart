import 'package:dating_app/core/model/edit_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// State
class EditProfileState {
 final List<EditProfileBasicModel> editProfileBasicList;
  final List<EditProfileLookModel> editProfileLookList;
  final List<EditProfileLifeStyleModel> editProfileLifeStyleList;
  final List<EditProfileCultureModel> editProfileCultureList;

  EditProfileState({
    required this.editProfileBasicList,
    required this.editProfileLookList,
    required this.editProfileLifeStyleList,
    required this.editProfileCultureList, 
    //required List<EditProfileCultureModel> editProfileCalutreList,
  });
}

// Cubit
class EditProfileCubit extends Cubit<EditProfileState> {
  final User? user;

  EditProfileCubit(this.user)
      : super(EditProfileState(
          editProfileBasicList: [
            EditProfileBasicModel(
              title: 'First Name',
              subtitle: '',
             // iconCode: int.parse('0xE910', radix: 16),
              //icon: Icons.person_outline,
            ),
            
            EditProfileBasicModel(
              title: 'Live In',
              subtitle: 'Cairo, Egypt',
             // icon: Icons.info_outline,
            ),
          ],
          editProfileLookList: [
            EditProfileLookModel(
              title: 'Hair Color',
              subtitle: 'black',
            //  icon: Icons.person_outline,
            ),
            EditProfileLookModel(
              title: 'Eye Color',
              subtitle: 'black',
              // icon: Icons.info_outline,
            ),
            EditProfileLookModel(
              title: 'Height',
              subtitle: '175',
            //  icon: Icons.info_outline,
            ),
            EditProfileLookModel(
              title: 'Weight',
              subtitle: '70',
           //   icon: Icons.info_outline,
            ),
           
            
          ],
          editProfileLifeStyleList: [
            EditProfileLifeStyleModel(
              title: 'Are You a Smoker?',
              subtitle: 'no',
            //  icon: Icons.person_outline,
            ),
            EditProfileLifeStyleModel(
              title: 'Marital Status',
              subtitle: 'single',
            //  icon: Icons.info_outline,
            ),
            EditProfileLifeStyleModel(
              title: 'Do You Have Kids?',
              subtitle: 'no',
            //  icon: Icons.info_outline,
            ),
            EditProfileLifeStyleModel(
              title: 'Job',
              subtitle: 'engineer',
             // icon: Icons.info_outline,
            ),
            EditProfileLifeStyleModel(
              title: 'Income',
              subtitle: 'no',
             // icon: Icons.info_outline,
            ),
            EditProfileLifeStyleModel(
              title: 'Live In',
              subtitle: 'house',
            //  icon: Icons.info_outline,
            ),
          ],
          editProfileCultureList: [
            EditProfileCultureModel(
              title: 'Nationality',
              subtitle: 's',
              //icon: Icons.info_outline,
            ),
            EditProfileCultureModel(
              title: 'Education',
              subtitle: 's',
             // icon: Icons.info_outline,
            ),
            EditProfileCultureModel(
              title: 'Languages',
              subtitle: 's',
            //  icon: Icons.info_outline,
            ),
            EditProfileCultureModel(
              title: 'Religion',
              subtitle: 's',
             // icon: Icons.info_outline,
            ),
            EditProfileCultureModel(
              title: 'Multiple Wives',
              subtitle: 'ssss',
             // icon: Icons.info_outline,
            ),
          ], //editProfileCalutreList: [],   // editProfileCultureList: [],
        )) {
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    if (user != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();
      if (userDoc.exists) {
        final userName =
            '${userDoc.data()?['fname'] ?? ''} ${userDoc.data()?['lname'] ?? ''}'
                .trim();

        //  final userName = userDoc.data()?['fname' + 'lname'] ?? 'Unknown';
        final profileDataDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .collection('edit_profile')
            .doc('data')
            .get();
        if (profileDataDoc.exists) {
          emit(EditProfileState(
            editProfileBasicList: [
              EditProfileBasicModel(
                title: 'First Name',
                subtitle: userName,
              //  icon: Icons.person_outline,
              ),
              EditProfileBasicModel(
                title: 'Live In',
                subtitle: 'Cairo, Egypt',
               // icon: Icons.info_outline,
              ),
            ],
            editProfileLookList:
                (profileDataDoc.data()?['editProfileLookList'] as List)
                    .map((data) => EditProfileLookModel.fromFirestore(data))
                    .toList(),
            editProfileLifeStyleList: (profileDataDoc
                    .data()?['editProfileLifeStyleList'] as List)
                .map((data) => EditProfileLifeStyleModel.fromFirestore(data))
                .toList(),
            editProfileCultureList:
                (profileDataDoc.data()?['editProfileCalutreList'] as List)
                    .map((data) => EditProfileCultureModel.fromFirestore(data))
                    .toList(),// editProfileCultureList: [],
          ));
        }
      }
    }
  }

  void editSubtitle(int index, String newSubtitle, String listType) {
    final currentState = state;

    switch (listType) {
      case 'Basic':
        final newBasicList =
            List<EditProfileBasicModel>.from(currentState.editProfileBasicList);
        newBasicList[index] = EditProfileBasicModel(
          title: newBasicList[index].title,
          subtitle: newSubtitle,
       //   icon: newBasicList[index].icon,
        );
        emit(EditProfileState(
          editProfileBasicList: newBasicList,
          editProfileLookList: currentState.editProfileLookList,
          editProfileLifeStyleList: currentState.editProfileLifeStyleList,
          editProfileCultureList: currentState.editProfileCultureList, 
         // editProfileCultureList: currentState.editProfileCultureList,
        ));
        break;
      case 'Look':
        final newLookList =
            List<EditProfileLookModel>.from(currentState.editProfileLookList);
        newLookList[index] = EditProfileLookModel(
          title: newLookList[index].title,
          subtitle: newSubtitle,
         // icon: newLookList[index].icon,
        );
        emit(EditProfileState(
          editProfileBasicList: currentState.editProfileBasicList,
          editProfileLookList: newLookList,
          editProfileLifeStyleList: currentState.editProfileLifeStyleList,
        // editProfileCalutreList: currentState.editProfileCultureList, 
          editProfileCultureList: currentState.editProfileCultureList,
        ));
        break;
      case 'LifeStyle':
        final newLifeStyleList = List<EditProfileLifeStyleModel>.from(
            currentState.editProfileLifeStyleList);
        newLifeStyleList[index] = EditProfileLifeStyleModel(
          title: newLifeStyleList[index].title,
          subtitle: newSubtitle,
        //  icon: newLifeStyleList[index].icon,
        );
        emit(EditProfileState(
          editProfileBasicList: currentState.editProfileBasicList,
          editProfileLookList: currentState.editProfileLookList,
          editProfileLifeStyleList: newLifeStyleList,
          editProfileCultureList: currentState.editProfileCultureList,
         // editProfileCalutreList: currentState.editProfileCalutreList,
        ));
        break;
      case 'Culture':
        final newCultureList = List<EditProfileCultureModel>.from(
            currentState.editProfileCultureList);
        newCultureList[index] = EditProfileCultureModel(
          title: newCultureList[index].title,
          subtitle: newSubtitle,
          //icon: newCultureList[index].icon,
        );
        emit(EditProfileState(
          editProfileBasicList: currentState.editProfileBasicList,
          editProfileLookList: currentState.editProfileLookList,
          editProfileLifeStyleList: currentState.editProfileLifeStyleList,
          editProfileCultureList: newCultureList,
       //   editProfileCalutreList: newCultureList,
        ));
        break;
    }

    saveUserData();
  }

  Future<void> saveUserData() async {
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('edit_profile')
          .doc('data')
          .set({
        'editProfileBasicList':
            state.editProfileBasicList.map((e) => e.toMap()).toList(),
        'editProfileLookList':
            state.editProfileLookList.map((e) => e.toMap()).toList(),
        'editProfileLifeStyleList':
            state.editProfileLifeStyleList.map((e) => e.toMap()).toList(),
        'editProfileCalutreList':
            state.editProfileCultureList.map((e) => e.toMap()).toList(),
      });
    }
  }
 

  Future<void> updateUserName(String newUserName) async {
    if (user != null) {
      // Update in the main user collection
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update({
            'fname': newUserName.split(' ')[0],
            'lname': newUserName.split(' ')[1],
          });

      // Update in the edit_profile subcollection
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('edit_profile')
          .doc('data')
          .update({'userName': newUserName});

      // Reload user data after update
      _loadUserData();
    }
  }

  // Existing methods and state management code
}


