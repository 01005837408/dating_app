import 'package:dating_app/core/app/dating_app.dart';
import 'package:dating_app/core/function/function.dart';
import 'package:dating_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  authStateChanges();
  

}







