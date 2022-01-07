import 'package:flutter/material.dart';
import 'package:flutter_note_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BackgroundImage(
          child: Column(
            children: [
              const SizedBox(height: 100),
              const LogoSvgIcon(width: 80, height: 80),
              const Spacer(),
              Text(
                "access your account".toUpperCase(),
                style: GoogleFonts.anton(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                    letterSpacing: .5,
                    color: kColor_1,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              // Description
              Text(
                "Fill The Necessary Infomationn To Create Your \n New Account For Free And Open Arms",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    letterSpacing: 1.5,
                    color: kColor_1,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 43),
              // Email Input
              const SizedBox(
                width: 303,
                height: 48,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kColor_1, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kColor_1, width: 1),
                    ),
                    hintText: "Email",
                  ),
                ),
              ),
              const SizedBox(height: 27),
              // Password Input
              const SizedBox(
                width: 303,
                height: 48,
                child: TextField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kColor_1, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kColor_1, width: 1),
                    ),
                    hintText: "Password",
                  ),
                ),
              ),
              const SizedBox(height: 27),
              // Button
              Container(
                width: 303,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: kColor_2,
                ),
                child: Center(
                    child: Text(
                  'Sign In',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                )),
              ),
              const SizedBox(height: 15),
              Container(
                  width: 303,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: kColor_4,
                  ),
                  child: Center(
                    child: Text(
                      'Email invalid!',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: kBlack,
                        ),
                      ),
                    ),
                  )),
              const SizedBox(height: 15)
            ],
          ),
        ),
      ),
    );
  }
}
