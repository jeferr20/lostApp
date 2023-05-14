import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lost_app/screens/signUp/components/sign_up_body.dart';
//import 'package:lost_app/screens/login/components/login_body.dart';

import 'firebase_options.dart';
import 'screens/login/components/auth_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignUpBodyScreen(),
  ));
}
