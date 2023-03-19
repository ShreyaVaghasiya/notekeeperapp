

import 'package:flutter/material.dart';
import 'package:notekeeper/HomePage.dart';
import 'Add_Page.dart';
import 'EditNote.dart';
import 'SplashScreenPage.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Splash_Screen(),
      'home' : (context) => Home_Page(),
      'add': (context) => Add_Page(),
      'edit' : (context) => Edit_Page(),
    },
  ));
}
