import 'package:bloc/bloc.dart';
import 'package:dating_app/core/helper/cache_helper.dart';
import 'package:dating_app/feature/chat/screen/chat_list_screen.dart';
import 'package:dating_app/feature/home/screens/home_screen.dart';
import 'package:dating_app/feature/likes_screen/likes_screen.dart';
import 'package:dating_app/feature/viewProfile/view_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    ViewProfile(),
    const LikesScreen(),
    ChatListScreen(),
  ];
  void changeButton(int index) {
    selectedIndex = index;
    emit(ButtonChangeState());
  }

  String local = 'ar';
  void setLangAr() {
    emit(AppLocaleState());
    local = 'ar';
    CacheHelper.sharedPreferences?.setString('lang', local);
    getLang();
  }

  void setLangEn() {
    emit(AppLocaleState());
    local = 'en';
    CacheHelper.sharedPreferences?.setString('lang', local);
    getLang();
  }

  void changLang() {
    if (CacheHelper.sharedPreferences?.getString('lang') == 'ar') {
      setLangEn();
    } else {
      setLangAr();
    }
  }

  void getLang() {
    CacheHelper.sharedPreferences?.getString('lang');
    emit(AppLocaleChangeState());
  }
}
