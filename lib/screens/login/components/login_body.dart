import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lost_app/components/button.dart';
import 'package:lost_app/components/textField.dart';

class LoginbodyScreen extends StatefulWidget {
  const LoginbodyScreen({super.key});

  @override
  State<LoginbodyScreen> createState() => _LoginbodyScreenState();
}

class _LoginbodyScreenState extends State<LoginbodyScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
          );
        });
  }

  String _errorMessage = "";

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "Email can not be empty";
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    } else {
      setState(() {
        _errorMessage = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: HexColor("#ffa500"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        //reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/lostPetLogoWhite.png',
                width: w, height: h * 0.30),
            Container(
              height: 530,
              width: double.infinity,
              decoration: BoxDecoration(
                color: HexColor("#ffffff"),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Iniciar sesisón",
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: HexColor("#4f4f4f"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Correo",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: HexColor("#8d8d8d"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            MyTextField(
                              onChanged: (() {
                                validateEmail(emailController.text);
                              }),
                              controller: emailController,
                              hintText: "hola@gmail.com",
                              obscureText: false,
                              prefixIcon: const Icon(Icons.mail_outline),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text(
                                _errorMessage,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Contraseña",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: HexColor("#8d8d8d"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            MyTextField(
                              controller: passwordController,
                              hintText: "**************",
                              obscureText: true,
                              prefixIcon: const Icon(Icons.lock_outline),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MyButton(
                              onPressed: signUserIn,
                              buttonText: 'Ingresar',
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("¿Aún no estas registrado?",
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: HexColor("#8d8d8d"),
                                    )),
                                TextButton(
                                    child: Text(
                                      "Registrate aqui",
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: HexColor("#87CEEB"),
                                      ),
                                    ),
                                    onPressed: () => {}),
                              ],
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
