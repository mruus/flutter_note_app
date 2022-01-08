import 'package:flutter/material.dart';
import 'package:flutter_note_app/constants.dart';
import 'package:flutter_note_app/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BackgroundImage(
          child: Column(
            children: [
              const LoggedUser(),

              // Title Input
              Container(
                width: double.infinity,
                // height: 130,
                margin: const EdgeInsets.symmetric(
                  horizontal: kMargin,
                  vertical: kMargin / 2,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: kColor_1,
                      width: .5,
                    ),
                  ),
                ),
                child: TextField(
                  minLines: 1,
                  maxLines: 20,
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Enter Title",
                  ),
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              // Description Input
              Expanded(
                child: Container(
                  // width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: kMargin,
                    vertical: kMargin,
                  ),
                  child: TextField(
                    minLines: 1,
                    maxLines: 50,
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Enter Description",
                    ),
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              // const Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: kMargin),
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: kColor_1,
                ),
                child: Center(
                    child: Text(
                  'Save Note',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
