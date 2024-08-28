// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `توافق للزواج الإسلامي`
  String get titleSplash {
    return Intl.message(
      'توافق للزواج الإسلامي',
      name: 'titleSplash',
      desc: '',
      args: [],
    );
  }

  /// `وخَلَقْنَاكُمْ أَزْوَاجًا`
  String get subTitleSplashScreen {
    return Intl.message(
      'وخَلَقْنَاكُمْ أَزْوَاجًا',
      name: 'subTitleSplashScreen',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to our Islamic marriage app`
  String get onboardTitle1 {
    return Intl.message(
      'Welcome to our Islamic marriage app',
      name: 'onboardTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to our app designed to help you find a suitable life partner according to Islamic teachings and values. Start your journey with us in simple and easy steps.`
  String get onbourdSubTitle1 {
    return Intl.message(
      'Welcome to our app designed to help you find a suitable life partner according to Islamic teachings and values. Start your journey with us in simple and easy steps.',
      name: 'onbourdSubTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Security and privacy in Islamic marriage`
  String get onboardTitle2 {
    return Intl.message(
      'Security and privacy in Islamic marriage',
      name: 'onboardTitle2',
      desc: '',
      args: [],
    );
  }

  /// `We adhere to the highest standards of security and privacy to protect your personal information. All your data is safe and encrypted.`
  String get onbourdSubTitle2 {
    return Intl.message(
      'We adhere to the highest standards of security and privacy to protect your personal information. All your data is safe and encrypted.',
      name: 'onbourdSubTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Create your account now`
  String get onboardTitle3 {
    return Intl.message(
      'Create your account now',
      name: 'onboardTitle3',
      desc: '',
      args: [],
    );
  }

  /// `To access all features, please create a new account or log in. Enjoy a unique experience in searching for a life partner.`
  String get onbourdSubTitle3 {
    return Intl.message(
      'To access all features, please create a new account or log in. Enjoy a unique experience in searching for a life partner.',
      name: 'onbourdSubTitle3',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get fName {
    return Intl.message(
      'First Name',
      name: 'fName',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginTitle {
    return Intl.message(
      'Login',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Third Name`
  String get last3Name {
    return Intl.message(
      'Third Name',
      name: 'last3Name',
      desc: '',
      args: [],
    );
  }

  /// `Text`
  String get text {
    return Intl.message(
      'Text',
      name: 'text',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailTitle {
    return Intl.message(
      'Email',
      name: 'emailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get emailValid {
    return Intl.message(
      'Please enter your email',
      name: 'emailValid',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passTitle {
    return Intl.message(
      'Password',
      name: 'passTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get passValid {
    return Intl.message(
      'Please enter your password',
      name: 'passValid',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get passTitleSure {
    return Intl.message(
      'Confirm Password',
      name: 'passTitleSure',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgetPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get doHaveAcount {
    return Intl.message(
      'Already have an account?',
      name: 'doHaveAcount',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get enterLogin {
    return Intl.message(
      'Log In',
      name: 'enterLogin',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get notHaveAcount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'notHaveAcount',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createNewAcount {
    return Intl.message(
      'Create Account',
      name: 'createNewAcount',
      desc: '',
      args: [],
    );
  }

  /// `Create Account with Google`
  String get createAcountByGoogle {
    return Intl.message(
      'Create Account with Google',
      name: 'createAcountByGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Field is empty`
  String get fieldIsEmpty {
    return Intl.message(
      'Field is empty',
      name: 'fieldIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Tawafuq`
  String get appName {
    return Intl.message(
      'Tawafuq',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Compatible`
  String get matwafik {
    return Intl.message(
      'Compatible',
      name: 'matwafik',
      desc: '',
      args: [],
    );
  }

  /// `Connected to the internet`
  String get connectInt {
    return Intl.message(
      'Connected to the internet',
      name: 'connectInt',
      desc: '',
      args: [],
    );
  }

  /// `In my area`
  String get inPlace {
    return Intl.message(
      'In my area',
      name: 'inPlace',
      desc: '',
      args: [],
    );
  }

  /// `We will send a code to your email to recover your password`
  String get forgetPassText {
    return Intl.message(
      'We will send a code to your email to recover your password',
      name: 'forgetPassText',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get hitTextforgetPass {
    return Intl.message(
      'Enter your password',
      name: 'hitTextforgetPass',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get hitTextforgetemail {
    return Intl.message(
      'Enter your email',
      name: 'hitTextforgetemail',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get textButtonForgetPass {
    return Intl.message(
      'Send Code',
      name: 'textButtonForgetPass',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade Account`
  String get subscribeNow {
    return Intl.message(
      'Upgrade Account',
      name: 'subscribeNow',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get myProfile {
    return Intl.message(
      'My Profile',
      name: 'myProfile',
      desc: '',
      args: [],
    );
  }

  /// `Personal Photos`
  String get myPhotos {
    return Intl.message(
      'Personal Photos',
      name: 'myPhotos',
      desc: '',
      args: [],
    );
  }

  /// `Hobbies & Interests`
  String get hoppies {
    return Intl.message(
      'Hobbies & Interests',
      name: 'hoppies',
      desc: '',
      args: [],
    );
  }

  /// `Personality`
  String get character {
    return Intl.message(
      'Personality',
      name: 'character',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get settingsProfile {
    return Intl.message(
      'Account Settings',
      name: 'settingsProfile',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Invoice`
  String get invoice {
    return Intl.message(
      'Invoice',
      name: 'invoice',
      desc: '',
      args: [],
    );
  }

  /// `Block List`
  String get blockList {
    return Intl.message(
      'Block List',
      name: 'blockList',
      desc: '',
      args: [],
    );
  }

  /// `About the App`
  String get about {
    return Intl.message(
      'About the App',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Share the App`
  String get share {
    return Intl.message(
      'Share the App',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout {
    return Intl.message(
      'Log Out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Delete My Account`
  String get delete {
    return Intl.message(
      'Delete My Account',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Advantages`
  String get advatges {
    return Intl.message(
      'Advantages',
      name: 'advatges',
      desc: '',
      args: [],
    );
  }

  /// `Unlimited Communication`
  String get noLimitsTalks {
    return Intl.message(
      'Unlimited Communication',
      name: 'noLimitsTalks',
      desc: '',
      args: [],
    );
  }

  /// `Unlock your messages`
  String get unlockYourMesasges {
    return Intl.message(
      'Unlock your messages',
      name: 'unlockYourMesasges',
      desc: '',
      args: [],
    );
  }

  /// `This membership will be automatically renewed when it expires. You can stop this automatic renewal at any time.`
  String get ruleText {
    return Intl.message(
      'This membership will be automatically renewed when it expires. You can stop this automatic renewal at any time.',
      name: 'ruleText',
      desc: '',
      args: [],
    );
  }

  /// `Find Better Matches`
  String get findsBestMatchs {
    return Intl.message(
      'Find Better Matches',
      name: 'findsBestMatchs',
      desc: '',
      args: [],
    );
  }

  /// `Compatibility Filter`
  String get matchFiltter {
    return Intl.message(
      'Compatibility Filter',
      name: 'matchFiltter',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Search for`
  String get search {
    return Intl.message(
      'Search for',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Woman`
  String get women {
    return Intl.message(
      'Woman',
      name: 'women',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Lives in`
  String get liveIn {
    return Intl.message(
      'Lives in',
      name: 'liveIn',
      desc: '',
      args: [],
    );
  }

  /// `Egypt`
  String get egypt {
    return Intl.message(
      'Egypt',
      name: 'egypt',
      desc: '',
      args: [],
    );
  }

  /// `Advanced Filters`
  String get advancedFiltters {
    return Intl.message(
      'Advanced Filters',
      name: 'advancedFiltters',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get look {
    return Intl.message(
      'Appearance',
      name: 'look',
      desc: '',
      args: [],
    );
  }

  /// `Lifestyle`
  String get lifeStyle {
    return Intl.message(
      'Lifestyle',
      name: 'lifeStyle',
      desc: '',
      args: [],
    );
  }

  /// `Knowledge`
  String get knowlege {
    return Intl.message(
      'Knowledge',
      name: 'knowlege',
      desc: '',
      args: [],
    );
  }

  /// `Online`
  String get online {
    return Intl.message(
      'Online',
      name: 'online',
      desc: '',
      args: [],
    );
  }

  /// `Personal ID`
  String get id {
    return Intl.message(
      'Personal ID',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  /// `Quick View`
  String get qucikview {
    return Intl.message(
      'Quick View',
      name: 'qucikview',
      desc: '',
      args: [],
    );
  }

  /// `Cairo - Egypt`
  String get cairoEgypt {
    return Intl.message(
      'Cairo - Egypt',
      name: 'cairoEgypt',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `View My Profile`
  String get viewMyprofile {
    return Intl.message(
      'View My Profile',
      name: 'viewMyprofile',
      desc: '',
      args: [],
    );
  }

  /// `View Profile`
  String get viewOtherProfile {
    return Intl.message(
      'View Profile',
      name: 'viewOtherProfile',
      desc: '',
      args: [],
    );
  }

  /// `Job`
  String get work {
    return Intl.message(
      'Job',
      name: 'work',
      desc: '',
      args: [],
    );
  }

  /// `Software Engineer`
  String get engineer {
    return Intl.message(
      'Software Engineer',
      name: 'engineer',
      desc: '',
      args: [],
    );
  }

  /// `Marital Status`
  String get maritalStatus {
    return Intl.message(
      'Marital Status',
      name: 'maritalStatus',
      desc: '',
      args: [],
    );
  }

  /// `Single`
  String get single {
    return Intl.message(
      'Single',
      name: 'single',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `Engineering University`
  String get engineerUniversity {
    return Intl.message(
      'Engineering University',
      name: 'engineerUniversity',
      desc: '',
      args: [],
    );
  }

  /// `Religion`
  String get religion {
    return Intl.message(
      'Religion',
      name: 'religion',
      desc: '',
      args: [],
    );
  }

  /// `Muslim`
  String get Muslim {
    return Intl.message(
      'Muslim',
      name: 'Muslim',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get EditProfile {
    return Intl.message(
      'Edit Profile',
      name: 'EditProfile',
      desc: '',
      args: [],
    );
  }

  /// `Your Basic Info`
  String get yourBasicInfo {
    return Intl.message(
      'Your Basic Info',
      name: 'yourBasicInfo',
      desc: '',
      args: [],
    );
  }

  /// `Hair Color`
  String get hairColor {
    return Intl.message(
      'Hair Color',
      name: 'hairColor',
      desc: '',
      args: [],
    );
  }

  /// `Height`
  String get hight {
    return Intl.message(
      'Height',
      name: 'hight',
      desc: '',
      args: [],
    );
  }

  /// `Eye Color`
  String get eyeColor {
    return Intl.message(
      'Eye Color',
      name: 'eyeColor',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get wight {
    return Intl.message(
      'Weight',
      name: 'wight',
      desc: '',
      args: [],
    );
  }

  /// `Do You Smoke?`
  String get areYousMoke {
    return Intl.message(
      'Do You Smoke?',
      name: 'areYousMoke',
      desc: '',
      args: [],
    );
  }

  /// `Do You Have Kids?`
  String get areYouHaveKids {
    return Intl.message(
      'Do You Have Kids?',
      name: 'areYouHaveKids',
      desc: '',
      args: [],
    );
  }

  /// `Job`
  String get job {
    return Intl.message(
      'Job',
      name: 'job',
      desc: '',
      args: [],
    );
  }

  /// `Income`
  String get income {
    return Intl.message(
      'Income',
      name: 'income',
      desc: '',
      args: [],
    );
  }

  /// `Place`
  String get place {
    return Intl.message(
      'Place',
      name: 'place',
      desc: '',
      args: [],
    );
  }

  /// `Culture`
  String get calture {
    return Intl.message(
      'Culture',
      name: 'calture',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get natunality {
    return Intl.message(
      'Nationality',
      name: 'natunality',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get lang {
    return Intl.message(
      'Language',
      name: 'lang',
      desc: '',
      args: [],
    );
  }

  /// `Multiple Wives`
  String get multyWife {
    return Intl.message(
      'Multiple Wives',
      name: 'multyWife',
      desc: '',
      args: [],
    );
  }

  /// `Likes`
  String get likes {
    return Intl.message(
      'Likes',
      name: 'likes',
      desc: '',
      args: [],
    );
  }

  /// `Liked Me`
  String get likeMe {
    return Intl.message(
      'Liked Me',
      name: 'likeMe',
      desc: '',
      args: [],
    );
  }

  /// `Liked Others`
  String get likeOthers {
    return Intl.message(
      'Liked Others',
      name: 'likeOthers',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chatTitle {
    return Intl.message(
      'Chat',
      name: 'chatTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
