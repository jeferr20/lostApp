import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lost_app/components/button.dart';
import 'package:lost_app/components/textField.dart';
import 'package:get/get.dart';
import 'package:lost_app/controllers/sign_up_controller.dart';

class SignUpBodyScreen extends StatefulWidget {
  const SignUpBodyScreen({super.key});

  @override
  State<SignUpBodyScreen> createState() => _SignUpBodyScreenState();
}

class _SignUpBodyScreenState extends State<SignUpBodyScreen> {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final nameController = TextEditingController().obs;
  final cellphoneController = TextEditingController().obs;
  SignUpController signUpController = Get.put(SignUpController());
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
      backgroundColor: HexColor("#ffa500"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                      "Registrarse",
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
                            "Email",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: HexColor("#8d8d8d"),
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
                          Text(
                            "Nombre",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: HexColor("#8d8d8d"),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Celular",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: HexColor("#8d8d8d"),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          MyButton(
                              buttonText: 'Registrar',
                              onPressed: () async {
                                if (signUpController.email != null &&
                                    signUpController.password != null) {
                                  bool isRegistered =
                                      await signUpController.registerUser(
                                          signUpController.email.toString(),
                                          signUpController.password.toString());
                                  debugPrint(isRegistered.toString());
                                  if (isRegistered) {
                                    Get.snackbar("Success", "User Registered");
                                  } else {
                                    Get.snackbar(
                                        "Error", "Please fill all the fields");
                                  }
                                }
                              }),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                            child: Row(
                              children: [
                                Text("Already have an account?",
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: HexColor("#8d8d8d"),
                                    )),
                                TextButton(
                                  child: Text(
                                    "Log In",
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: HexColor("#44564a"),
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
