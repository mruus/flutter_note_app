import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/constants.dart';
import 'package:flutter_note_app/models/authentication.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isError = false, isDone = true;
  String errorMessage = "Error Will Be Showed";
  var db = AuthQueries(FirebaseAuth.instance);

  bool isValid() {
    if (_passwordController.text == "" && _emailController.text == "") {
      isError = true;
      errorMessage = "Email And Password Are Required";
    } else if (_emailController.text == "") {
      isError = true;
      errorMessage = "Email Is Required";
    } else if (_passwordController.text == "") {
      isError = true;
      errorMessage = "Password Is Required";
    } else if (!EmailValidator.validate(_emailController.text)) {
      isError = true;
      errorMessage = "Email Is Invalid!";
    } else {
      isError = false;
      errorMessage = "";
    }
    return !isError;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BackgroundImage(
          child: Column(
            children: [
              const SizedBox(height: 100),
              TopBarAuth(
                text2: '   Sign Up',
                text1: "I Don't Have An Account",
                detectTap: () {
                  Navigator.pushReplacementNamed(context, '/register');
                },
              ),
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
              SizedBox(
                width: 303,
                height: 48,
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
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
              SizedBox(
                width: 303,
                height: 48,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: const InputDecoration(
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
              GestureDetector(
                onTap: () async {
                  if (!isValid()) {
                    setState(() {
                      isError = true;
                    });
                  } else {
                    setState(() {
                      isDone = false;
                    });

                    db.email = _emailController.text;
                    db.password = _passwordController.text;
                    await db.loginUser();

                    setState(() {
                      isDone = true;

                      if (db.errorMessage != '') {
                        isError = true;
                        errorMessage = db.errorMessage;
                      } else {
                        isError = false;
                      }
                    });
                  }
                },
                child: Container(
                  width: 303,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: kColor_2,
                  ),
                  child: Center(
                    child: isDone
                        ? Text(
                            'Sign In',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: kWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          )
                        : const SizedBox(
                            height: 40,
                            child: SpinKitWave(
                              color: kColor_4,
                              size: 15.0,
                              itemCount: 10,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              if (isError)
                Container(
                  width: 303,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: kColor_4,
                  ),
                  child: Center(
                    child: Text(
                      errorMessage,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: kBlack,
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 15)
            ],
          ),
        ),
      ),
    );
  }
}
