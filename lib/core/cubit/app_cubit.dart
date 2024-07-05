import 'package:bloc/bloc.dart';
import 'package:dating_app/core/helper/cache_helper.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
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
