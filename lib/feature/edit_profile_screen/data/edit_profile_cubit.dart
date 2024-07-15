import 'package:dating_app/core/model/edit_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// State
class EditProfileState {
  final List<EditProfileBasciModel> editProfileBasicList;
  final List<EditProfileLookModel> editProfileLookList;
  final List<EditProfileLifeStyleModel> editProfileLifeStyleList;
  final List<EditProfileCaltureeModel> editProfileCalutreList;

  EditProfileState({
    required this.editProfileBasicList,
    required this.editProfileLookList,
    required this.editProfileLifeStyleList,
    required this.editProfileCalutreList,
  });
}

// Cubit
class EditProfileCubit extends Cubit<EditProfileState> {
  final User? user;

  EditProfileCubit(this.user)
      : super(EditProfileState(
          editProfileBasicList: [
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
          ],
          editProfileLookList: [
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
          ],
          editProfileLifeStyleList: [
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
          ],
          editProfileCalutreList: [
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
          ],
        )) {
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    if (user != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('edit_profile')
          .doc('data')
          .get();
      if (userDoc.exists) {
        emit(EditProfileState(
          editProfileBasicList: (userDoc.data()?['editProfileBasicList'] as List)
              .map((data) => EditProfileBasciModel.fromFirestore(data))
              .toList(),
          editProfileLookList: (userDoc.data()?['editProfileLookList'] as List)
              .map((data) => EditProfileLookModel.fromFirestore(data))
              .toList(),
          editProfileLifeStyleList: (userDoc.data()?['editProfileLifeStyleList'] as List)
              .map((data) => EditProfileLifeStyleModel.fromFirestore(data))
              .toList(),
          editProfileCalutreList: (userDoc.data()?['editProfileCalutreList'] as List)
              .map((data) => EditProfileCaltureeModel.fromFirestore(data))
              .toList(),
        ));
      }
    }
  }

  void editSubtitle(int index, String newSubtitle, String listType) {
    final currentState = state;
    switch (listType) {
      case 'Basic':
        final newBasicList = List<EditProfileBasciModel>.from(currentState.editProfileBasicList);
        newBasicList[index] = EditProfileBasciModel(
          title: newBasicList[index].title,
          subtitle: newSubtitle,
          icon: newBasicList[index].icon,
        );
        emit(EditProfileState(
          editProfileBasicList: newBasicList,
          editProfileLookList: currentState.editProfileLookList,
          editProfileLifeStyleList: currentState.editProfileLifeStyleList,
          editProfileCalutreList: currentState.editProfileCalutreList,
        ));
        break;
      case 'Look':
        final newLookList = List<EditProfileLookModel>.from(currentState.editProfileLookList);
        newLookList[index] = EditProfileLookModel(
          title: newLookList[index].title,
          subtitle: newSubtitle,
          icon: newLookList[index].icon,
        );
        emit(EditProfileState(
          editProfileBasicList: currentState.editProfileBasicList,
          editProfileLookList: newLookList,
          editProfileLifeStyleList: currentState.editProfileLifeStyleList,
          editProfileCalutreList: currentState.editProfileCalutreList,
        ));
        break;
      case 'LifeStyle':
        final newLifeStyleList = List<EditProfileLifeStyleModel>.from(currentState.editProfileLifeStyleList);
        newLifeStyleList[index] = EditProfileLifeStyleModel(
          title: newLifeStyleList[index].title,
          subtitle: newSubtitle,
          icon: newLifeStyleList[index].icon,
        );
        emit(EditProfileState(
          editProfileBasicList: currentState.editProfileBasicList,
          editProfileLookList: currentState.editProfileLookList,
          editProfileLifeStyleList: newLifeStyleList,
          editProfileCalutreList: currentState.editProfileCalutreList,
        ));
        break;
      case 'Culture':
        final newCultureList = List<EditProfileCaltureeModel>.from(currentState.editProfileCalutreList);
        newCultureList[index] = EditProfileCaltureeModel(
          title: newCultureList[index].title,
          subtitle: newSubtitle,
          icon: newCultureList[index].icon,
        );
        emit(EditProfileState(
          editProfileBasicList: currentState.editProfileBasicList,
          editProfileLookList: currentState.editProfileLookList,
          editProfileLifeStyleList: currentState.editProfileLifeStyleList,
          editProfileCalutreList: newCultureList,
        ));
        break;
    }
    _saveUserData();
  }

  Future<void> _saveUserData() async {
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('edit_profile')
          .doc('data')
          .set({
        'editProfileBasicList': state.editProfileBasicList.map((e) => e.toMap()).toList(),
        'editProfileLookList': state.editProfileLookList.map((e) => e.toMap()).toList(),
        'editProfileLifeStyleList': state.editProfileLifeStyleList.map((e) => e.toMap()).toList(),
        'editProfileCalutreList': state.editProfileCalutreList.map((e) => e.toMap()).toList(),
      });
    }
  }
}
