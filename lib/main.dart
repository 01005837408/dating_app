import 'package:dating_app/core/app/dating_app.dart';
import 'package:dating_app/core/function/function.dart';
import 'package:dating_app/core/helper/cache_helper.dart';
import 'package:dating_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import "package:flutter/services.dart";

void main() async {

  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]
  );
  authStateChanges();
  CacheHelper().init();

  // UserModel userModel = UserModel.fromFirestore(userDoc.data() as Map<String, dynamic>);
}
