import 'package:flutter/material.dart';
import 'package:flutter_note_app/constants.dart';

class CustomDialogue extends StatelessWidget {
  const CustomDialogue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kMargin / 2 - 5),
      ),
      elevation: 0,
      backgroundColor: kColor_1,
      child: contextBox(context),
    );
  }
}

contextBox(BuildContext context) {
  return Stack(
    children: [
      Container(),
      Positioned(
        child: Container(),
      ),
    ],
  );
}
