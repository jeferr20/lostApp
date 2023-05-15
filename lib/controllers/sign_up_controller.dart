// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lost_app/models/file_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class SignUpController extends GetxController {
//   static SignUpController get instance => Get.find();

//   FileModel? _imageFile;
//   FileModel? get imageFile => _imageFile;
//   void setImageFile(FileModel? file) {
//     _imageFile = file;
//     debugPrint("Foto de perfil actualizada: ${imageFile!.filename}");
//     update();
//   }

//   String? _name;
//   String? get name => _name;
//   void setName(String? text) {
//     _name = text;
//     debugPrint("Nombre Actualizado: $name");
//     update();
//   }

//   String? _departamento;
//   String? get departamento => _departamento;
//   void setDepa(String? text) {
//     _departamento = text;
//     debugPrint("Departamentio Actualziado: $departamento");
//     update();
//   }

//   String? _email;
//   String? get email => _email;
//   void setEmail(String? text) {
//     _email = text;
//     debugPrint("Correo Actualizado: $email");
//     update();
//   }

//   String? _password;
//   String? get password => _password;
//   void setPassword(String? text) {
//     _password = text;
//     debugPrint("Contraseña Actualizada: $password");
//     update();
//   }

//   String? _mobileNumber;
//   String? get mobileNumber => _mobileNumber;
//   void setMobileNumber(String? text) {
//     _mobileNumber = text;
//     debugPrint("Celular Actualzado: $mobileNumber");
//     update();
//   }

//   Future uploadImageFile() async {
//     await FirebaseStorage.instance
//         .ref('files/${imageFile!.filename}')
//         .putData(imageFile!.fileBytes);
//   }

//   Future postSignUpDetails() async {
//     await FirebaseFirestore.instance.collection("user").add({
//       "name": name,
//       "email": email,
//       "password": password,
//       "mobileNumber": mobileNumber,
//       "departamento": departamento,
//     });
//     uploadImageFile();
//   }

//   Future<bool> registerUser(String email, String password) async {
//     try {
//       var response = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       postSignUpDetails();
//       return true;
//     } catch (error) {
//       if (error is FirebaseAuthException) {
//         Get.showSnackbar(GetSnackBar(
//           message: error.toString(),
//         ));
//       }
//     }
//     return false;
//   }
// }
