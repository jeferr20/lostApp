import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:lost_app/auth/main_page.dart';
// import 'package:lost_app/screens/login/login.dart';
// import 'package:lost_app/screens/login/components/login_body.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: MainPage()));
}
