import 'package:flutter/material.dart';
import 'package:lost_app/pages/login_page.dart';
import 'package:lost_app/pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool mostrarLoginPage = true;

  void toggleScreens() {
    setState(() {
      mostrarLoginPage = !mostrarLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (mostrarLoginPage) {
      return LoginPage(mostrarRegisterPage: toggleScreens);
    } else {
      return RegisterPage(mostrarLoginPage: toggleScreens);
    }
  }
}
