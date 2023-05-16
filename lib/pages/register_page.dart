import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lost_app/components/button.dart';
//import 'package:dropdown_button2/dropdown_button2.dart';

// List<String> departamentos = <String>[
//   'Amazonas',
//   'Ancash',
//   'Apurimac',
//   'Arequipa',
//   'Ayacucho',
//   'Cajamarca',
//   'Callao',
//   'Cusco',
//   'Huancavelica',
//   'Huanuco',
//   'Ica',
//   'Junin',
//   'La Libertad',
//   'Lambayeque',
//   'Lima',
//   'Loreto',
//   'Madre de Dios',
//   'Moquegua',
//   'Pasco',
//   'Piura',
//   'Puno',
//   'San Martin',
//   'Tacna',
//   'Tumbes',
//   'Ucayali'
// ];

class RegisterPage extends StatefulWidget {
  final VoidCallback mostrarLoginPage;
  const RegisterPage({super.key, required this.mostrarLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _cellphoneController = TextEditingController();
  //SignUpController signUpController = Get.put(SignUpController());

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    _cellphoneController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      // crea usuario
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      //añadir datos a firestore
      addDatos(_nameController.text.trim(), _emailController.text.trim(),
          _cellphoneController.text.trim());
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Future addDatos(String name, String email, String mobileNumber) async {
    await FirebaseFirestore.instance.collection('users').add({
      'nombre': name,
      'correo': email,
      'celular': mobileNumber,
    });
  }

  // ignore: unused_field
  // String? selectedValue;
  // String dropdownValue = departamentos.first;
  // String _errorMessage = "";

  // void validateEmail(String val) {
  //   if (val.isEmpty) {
  //     setState(() {
  //       _errorMessage = "Email can not be empty";
  //     });
  //   } else if (!EmailValidator.validate(val, true)) {
  //     setState(() {
  //       _errorMessage = "Invalid Email Address";
  //     });
  //   } else {
  //     setState(() {
  //       _errorMessage = "";
  //     });
  //   }
  // }

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
                padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
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
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // DropdownButton2<String>(
                          //   isExpanded: true,
                          //   hint: Row(
                          //     children: [
                          //       const Icon(
                          //         Icons.list,
                          //         size: 22,
                          //         color: Color.fromARGB(255, 79, 79, 79),
                          //       ),
                          //       SizedBox(
                          //         width: 12,
                          //       ),
                          //       Expanded(
                          //         child: Text(
                          //           'Departamento',
                          //           style: GoogleFonts.poppins(
                          //             fontSize: 16,
                          //             color: HexColor("#8d8d8d"),
                          //           ),
                          //           overflow: TextOverflow.ellipsis,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          //   underline: Container(
                          //     height: 0,
                          //   ),
                          //   items: departamentos
                          //       .map<DropdownMenuItem<String>>((String value) {
                          //     return DropdownMenuItem<String>(
                          //       value: value,
                          //       child: Text(value),
                          //     );
                          //   }).toList(),
                          //   value: selectedValue,
                          //   onChanged: (value) {
                          //     setState(() {
                          //       selectedValue = value!;
                          //     });
                          //   },
                          //   buttonStyleData: ButtonStyleData(
                          //     height: 65,
                          //     width: 325,
                          //     padding:
                          //         const EdgeInsets.only(left: 14, right: 14),
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(30),
                          //       color: const Color.fromARGB(255, 240, 243, 241),
                          //     ),
                          //   ),
                          //   iconStyleData: const IconStyleData(
                          //     icon: Icon(
                          //       Icons.arrow_forward_ios_outlined,
                          //     ),
                          //     iconSize: 15,
                          //     iconEnabledColor: Color.fromARGB(255, 79, 79, 79),
                          //     iconDisabledColor: Colors.grey,
                          //   ),
                          //   dropdownStyleData: DropdownStyleData(
                          //       maxHeight: 200,
                          //       width: 320,
                          //       padding: null,
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(14),
                          //         color:
                          //             const Color.fromARGB(255, 240, 243, 241),
                          //       ),
                          //       scrollbarTheme: ScrollbarThemeData(
                          //         radius: const Radius.circular(40),
                          //         thickness: MaterialStateProperty.all(6),
                          //         thumbVisibility:
                          //             MaterialStateProperty.all(true),
                          //       )),
                          //   menuItemStyleData: const MenuItemStyleData(
                          //     height: 60,
                          //     padding: EdgeInsets.only(left: 14, right: 14),
                          //   ),
                          // ),
                          // DropdownButton<String>(
                          //   hint: const Text('Departamento'),
                          //   value: dropdownValue,
                          //   icon: const Icon(Icons.arrow_drop_down),
                          //   elevation: 16,
                          //   style: GoogleFonts.poppins(
                          //     fontSize: 15,
                          //     color: HexColor("#8d8d8d"),
                          //   ),
                          //   isExpanded: true,
                          //   underline: Container(
                          //     height: 2,
                          //     color: HexColor("#ffffff"),
                          //   ),
                          //   iconSize: 30,
                          //   borderRadius: BorderRadius.circular(20),
                          //   onChanged: (String? value) {
                          //     setState(() {
                          //       dropdownValue = value!;
                          //       signUpController.setUserType(value);
                          //     });
                          //   },
                          //   items: departamentos
                          //       .map<DropdownMenuItem<String>>((String value) {
                          //     return DropdownMenuItem<String>(
                          //       value: value,
                          //       child: Text(value),
                          //     );
                          //   }).toList(),
                          // ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          TextField(
                            controller: _emailController,
                            cursorColor: HexColor("#4f4f4f"),
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: "Correo",
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
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: _passwordController,
                            cursorColor: HexColor("#4f4f4f"),
                            obscureText: true,
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
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: _confirmPasswordController,
                            cursorColor: HexColor("#4f4f4f"),
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Confrima tu contraseña",
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
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: _nameController,
                            cursorColor: HexColor("#4f4f4f"),
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: "Nombre Completo",
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
                              prefixIcon: const Icon(Icons.person),
                              prefixIconColor: HexColor("#4f4f4f"),
                              filled: true,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: _cellphoneController,
                            cursorColor: HexColor("#4f4f4f"),
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: "Celular",
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
                              prefixIcon: const Icon(Icons.phone),
                              prefixIconColor: HexColor("#4f4f4f"),
                              filled: true,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          MyButton(
                              buttonText: 'REGISTRAR',
                              onPressed: () {
                                signUp();
                                // if (signUpController.email != null &&
                                //     signUpController.password != null &&
                                //     signUpController.name != null &&
                                //     signUpController.mobileNumber != null &&
                                //     signUpController.departamento != null) {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) =>
                                //               const HomeScreen()));
                                //   signUserUp();
                                //   // bool isRegistered =
                                //   //     await signUpController.registerUser(
                                //   //         signUpController.email.toString(),
                                //   //         signUpController.password.toString());
                                //   // debugPrint(isRegistered.toString());
                                //   // if (isRegistered) {
                                //   //   Get.snackbar("Success", "User Registered");
                                //   // } else {
                                //   //   Get.snackbar(
                                //   //       "Error", "Please fill all the fields");
                                //   // }
                                // }
                              }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("¿Ya tienes una cuenta?",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: HexColor("#8d8d8d"),
                                  )),
                              TextButton(
                                child: Text(
                                  "Ingresa aqui",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: HexColor("#ffa500"),
                                  ),
                                ),
                                onPressed: widget.mostrarLoginPage,
                              ),
                            ],
                          ),
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
