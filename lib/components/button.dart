import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class MyButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  const MyButton(
      {super.key, required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 11, 0, 10),
          height: 50,
          width: 280,
          decoration: BoxDecoration(
            color: HexColor('#ffa500'),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class GoogleButton extends StatelessWidget {
  final Function()? onPressed;
  const GoogleButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
        child: Container(
            padding: const EdgeInsets.fromLTRB(0, 11, 0, 10),
            height: 50,
            width: 280,
            decoration: BoxDecoration(
              color: HexColor('#ffffff '),
              border: Border.all(color: HexColor('#8d8d8d')),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Iniciar sesión con Google",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Image.asset(
                  'assets/images/googleLogo.png',
                  height: 25,
                )
              ],
            )),
      ),
    );
  }
}
