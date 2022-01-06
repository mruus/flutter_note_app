import 'package:flutter/material.dart';
import 'package:flutter_note_app/constants.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: backgroundImage(
        child: Center(
          child: SizedBox(
            width: 220,
            height: 220,
            child: SvgPicture.asset(
              'assets/logoSVG.svg',
              color: kColor_2,
            ),
          ),
        ),
      ),
    );
  }
}
