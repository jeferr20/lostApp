import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lost_app/components/button.dart';
//import 'package:lost_app/components/textField.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback mostrarRegisterPage;
  const LoginPage({super.key, required this.mostrarRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisible = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signUserIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        //reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/lostPetLogoWhite.png',
                width: w, height: h * 0.25),
            Container(
              height: 580,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 20),
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
                              height: 5,
                            ),
                            // MyTextField(
                            //   onChanged: (() {
                            //     validateEmail(_emailController.text);
                            //   }),
                            //   controller: _emailController,
                            //   hintText: "hola@gmail.com",
                            //   prefixIcon: const Icon(Icons.mail_outline),
                            // ),
                            TextField(
                              controller: _emailController,
                              cursorColor: HexColor("#4f4f4f"),
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: "hola@gmail.com",
                                fillColor: HexColor("#f0f3f1"),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: HexColor("#8d8d8d"),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                prefixIcon: const Icon(Icons.mail_outline),
                                prefixIconColor: HexColor("#4f4f4f"),
                                filled: true,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Text(
                                _errorMessage,
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Text(
                              "Contraseña",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: HexColor("#8d8d8d"),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            // MyTextField(
                            //   controller: _passwordController,
                            //   hintText: "**************",
                            //   prefixIcon: const Icon(Icons.lock_outline),
                            // ),
                            TextField(
                              controller: _passwordController,
                              cursorColor: HexColor("#4f4f4f"),
                              obscureText: passwordVisible,
                              decoration: InputDecoration(
                                hintText: "Contraseña",
                                fillColor: HexColor("#f0f3f1"),
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: HexColor("#8d8d8d"),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                prefixIcon: const Icon(Icons.lock_outline),
                                prefixIconColor: HexColor("#4f4f4f"),
                                filled: true,
                                suffixIcon: IconButton(
                                  color: HexColor("#4f4f4f"),
                                  icon: Icon(passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                ),
                                alignLabelWithHint: false,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Olvidé mi contraseña',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: HexColor("#ffa500"),
                                      ),
                                    ))
                              ],
                            ),
                            MyButton(
                              onPressed: signUserIn,
                              buttonText: 'INGRESAR',
                            ),
                            GoogleButton(
                              onPressed: () {},
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
                                      color: HexColor("#ffa500"),
                                    ),
                                  ),
                                  onPressed: widget.mostrarRegisterPage,
                                ),
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
