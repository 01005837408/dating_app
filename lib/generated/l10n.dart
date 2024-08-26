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

  /// `توافق للزواج الاسلامي`
  String get titleSplash {
    return Intl.message(
      'توافق للزواج الاسلامي',
      name: 'titleSplash',
      desc: '',
      args: [],
    );
  }

  /// `وخَلَقْنَاكُمْ أَزْوَاجًا `
  String get subTitleSplashScreen {
    return Intl.message(
      'وخَلَقْنَاكُمْ أَزْوَاجًا ',
      name: 'subTitleSplashScreen',
      desc: '',
      args: [],
    );
  }

  /// `skip`
  String get skip {
    return Intl.message(
      'skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// start
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// Login Title
  String get loginTitle {
    return Intl.message(
      'Login Page',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// start
  String get emailValid {
    return Intl.message(
      'Please enter your email',
      name: 'emailValid',
      desc: '',
      args: [],
    );
  }
   /// start
  String get passValid {
    return Intl.message(
      'Please enter your Password',
      name: 'passValid',
      desc: '',
      args: [],
    );
  }
    String get forgetPassword {
    return Intl.message(
      'Forget Password ?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to our dating app`
  String get onboardTitle1 {
    return Intl.message(
      'Welcome to our dating app',
      name: 'onboardTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to our app designed to help you find a suitable life partner according to Islamic teachings and values. Let's start your journey with us in simple and easy steps.`
  String get onbourdSubTitle1 {
    return Intl.message(
      'Welcome to our app designed to help you find a suitable life partner according to Islamic teachings and values. Let\'s start your journey with us in simple and easy steps.',
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

  /// `Start by creating your account now`
  String get onboardTitle3 {
    return Intl.message(
      'Start by creating your account now',
      name: 'onboardTitle3',
      desc: '',
      args: [],
    );
  }

  /// `To access our full features, please create a new account or log in. Enjoy a unique experience in searching for a life partner.`
  String get onbourdSubTitle3 {
    return Intl.message(
      'To access our full features, please create a new account or log in. Enjoy a unique experience in searching for a life partner.',
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

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
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

  /// `Password`
  String get passTitle {
    return Intl.message(
      'Password',
      name: 'passTitle',
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

  /// `Join Us`
  String get createAcount {
    return Intl.message(
      'Join Us',
      name: 'createAcount',
      desc: '',
      args: [],
    );
  }

  /// `Do you already have an account?`
  String get doHaveAcount {
    return Intl.message(
      'Do you already have an account?',
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

  /// `I don't have an account`
  String get notHaveAcount {
    return Intl.message(
      'I don\'t have an account ?',
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

  /// `Enter your email`
  String get hitTextforgetPass {
    return Intl.message(
      'Enter your email',
      name: 'hitTextforgetPass',
      desc: '',
      args: [],
    );
  }

  /// `Send code`
  String get textButtonForgetPass {
    return Intl.message(
      'Send code',
      name: 'textButtonForgetPass',
      desc: '',
      args: [],
    );
  }

  /// `Upgrade account`
  String get subscribeNow {
    return Intl.message(
      'Upgrade account',
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

  /// `Delete my account`
  String get delete {
    return Intl.message(
      'Delete my account',
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

  /// `Find better matches`
  String get findsBestMatchs {
    return Intl.message(
      'Find better matches',
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

  /// `work`
  String get work {
    return Intl.message(
      'work',
      name: 'work',
      desc: '',
      args: [],
    );
  }

  /// `software engineer`
  String get engineer {
    return Intl.message(
      'software engineer',
      name: 'engineer',
      desc: '',
      args: [],
    );
  }

  /// `marital status`
  String get maritalStatus {
    return Intl.message(
      'marital status',
      name: 'maritalStatus',
      desc: '',
      args: [],
    );
  }

  /// `single`
  String get single {
    return Intl.message(
      'single',
      name: 'single',
      desc: '',
      args: [],
    );
  }

  /// `education`
  String get education {
    return Intl.message(
      'education',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `engineer University`
  String get engineerUniversity {
    return Intl.message(
      'engineer University',
      name: 'engineerUniversity',
      desc: '',
      args: [],
    );
  }

  /// `religion`
  String get religion {
    return Intl.message(
      'religion',
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

  /// `Your Basics `
  String get yourBasicInfo {
    return Intl.message(
      'Your Basics ',
      name: 'yourBasicInfo',
      desc: '',
      args: [],
    );
  }

  /// `hair Color`
  String get hairColor {
    return Intl.message(
      'hair Color',
      name: 'hairColor',
      desc: '',
      args: [],
    );
  }

  /// `hight`
  String get hight {
    return Intl.message(
      'hight',
      name: 'hight',
      desc: '',
      args: [],
    );
  }

  /// `eyeColor`
  String get eyeColor {
    return Intl.message(
      'eyeColor',
      name: 'eyeColor',
      desc: '',
      args: [],
    );
  }

  /// `wight`
  String get wight {
    return Intl.message(
      'wight',
      name: 'wight',
      desc: '',
      args: [],
    );
  }

  /// `are Yous Moke`
  String get areYousMoke {
    return Intl.message(
      'are Yous Moke',
      name: 'areYousMoke',
      desc: '',
      args: [],
    );
  }

  /// `are You Have Kids`
  String get areYouHaveKids {
    return Intl.message(
      'are You Have Kids',
      name: 'areYouHaveKids',
      desc: '',
      args: [],
    );
  }

  /// `job`
  String get job {
    return Intl.message(
      'job',
      name: 'job',
      desc: '',
      args: [],
    );
  }

  /// `income`
  String get income {
    return Intl.message(
      'income',
      name: 'income',
      desc: '',
      args: [],
    );
  }

  /// `place`
  String get place {
    return Intl.message(
      'place',
      name: 'place',
      desc: '',
      args: [],
    );
  }

  /// ` calture`
  String get calture {
    return Intl.message(
      ' calture',
      name: 'calture',
      desc: '',
      args: [],
    );
  }

  /// `natunality`
  String get natunality {
    return Intl.message(
      'natunality',
      name: 'natunality',
      desc: '',
      args: [],
    );
  }

  /// `language`
  String get lang {
    return Intl.message(
      'language',
      name: 'lang',
      desc: '',
      args: [],
    );
  }

  /// `multyWife`
  String get multyWife {
    return Intl.message(
      'multyWife',
      name: 'multyWife',
      desc: '',
      args: [],
    );
  }

  /// `likes`
  String get likes {
    return Intl.message(
      'likes',
      name: 'likes',
      desc: '',
      args: [],
    );
  }

  /// `like Me`
  String get likeMe {
    return Intl.message(
      'like Me',
      name: 'likeMe',
      desc: '',
      args: [],
    );
  }

  /// `like Others`
  String get likeOthers {
    return Intl.message(
      'like Others',
      name: 'likeOthers',
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
