import 'package:flutter/material.dart';
import 'package:flutter_note_app/constants.dart';

class backgroundImage extends StatelessWidget {
  const backgroundImage({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        color: kWhite,
        image: DecorationImage(
          image: AssetImage('assets/Pattern Image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
