import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => {Navigator.pushReplacementNamed(context, '/add_note')});
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundImage(
        child: Center(
          child: LogoSvgIcon(height: 220, width: 220),
        ),
      ),
    );
  }
}
