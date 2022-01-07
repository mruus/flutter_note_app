import 'package:flutter/material.dart';
import 'package:flutter_note_app/screens/add_note_screen.dart';
import 'package:flutter_note_app/screens/dashboard_screen.dart';
import 'package:flutter_note_app/screens/register_screen.dart';
import 'package:flutter_note_app/screens/splash_screen.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/register': (context) => const RegisterScreen(),
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const Dashboard(),
        '/add_note': (context) => const AddNoteScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
