import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note_app/constants.dart';
import 'package:flutter_note_app/models/note_queries.dart';
import 'package:flutter_note_app/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen(
      {Key? key, required this.head, required this.body, required this.type})
      : super(key: key);
  final String head;
  final String body;
  final String type;
  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  bool isError = false, isDone = true;
  String errorMessage = "";
  var note = NoteStore();
  final firebaseUser = FirebaseAuth.instance.currentUser;

  bool isValid() {
    if (descriptionController.text == "" && titleController.text == "") {
      isError = true;
      errorMessage = "Title And Description Are Required";
    } else if (titleController.text == "") {
      isError = true;
      errorMessage = "Title Is Required";
    } else if (descriptionController.text == "") {
      isError = true;
      errorMessage = "Description Is Required";
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
                  controller: widget.head.isEmpty
                      ? titleController
                      : (titleController =
                          TextEditingController(text: widget.head)),
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
                    controller: widget.head.isEmpty
                        ? descriptionController
                        : (descriptionController =
                            TextEditingController(text: widget.body)),
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
              GestureDetector(
                onTap: () async {
                  if (!isValid()) {
                    setState(() {
                      isError = true;
                    });
                  } else {
                    note.title = titleController.text;
                    note.description = descriptionController.text;
                    note.uid = firebaseUser!.uid;

                    setState(() {
                      isDone = false;
                    });
                    widget.type.isEmpty
                        ? await note.newNote()
                        : await note.updateNote(widget.type);

                    setState(() {
                      if (note.errorMessage != "Note Added" &&
                          note.errorMessage != "Note Updated") {
                        isError = true;
                        errorMessage = note.errorMessage;
                        isDone = true;
                      } else {
                        isDone = true;
                        isError = false;
                        Navigator.pushReplacementNamed(context, '/dashboard');
                      }
                    });
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: kMargin),
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: kColor_1,
                  ),
                  child: Center(
                    child: isDone
                        ? Text(
                            'Save Note',
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
              if (isError)
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: kMargin,
                    vertical: kMargin / 2,
                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
