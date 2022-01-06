import 'package:flutter/material.dart';
import 'package:flutter_note_app/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: backgroundImage(
        child: Center(
          child: Text("Love"),
        ),
      ),
    );
  }
}
