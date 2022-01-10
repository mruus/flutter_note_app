import 'package:flutter/material.dart';
import 'package:flutter_note_app/constants.dart';
import 'package:flutter_note_app/models/note_queries.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomDialogue extends StatefulWidget {
  const CustomDialogue({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<CustomDialogue> createState() => _CustomDialogueState();
}

class _CustomDialogueState extends State<CustomDialogue> {
  bool isDone = true;
  String title = 'Are You Sure You Wanna Delete';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kMargin / 2),
      ),
      elevation: 0,
      child: contentBoxed(context),
    );
  }

  Container contentBoxed(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
      decoration: const BoxDecoration(
        color: kColor_2,
        image: DecorationImage(
          image: AssetImage('assets/jpg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: kWhite,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: kWhite,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            MdiIcons.blockHelper,
                            color: kBlack,
                            size: 14,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Cancel',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: kBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () async {
                      final note = NoteStore();
                      setState(() {
                        isDone = false;
                      });
                      await note.deleteNote(widget.id);

                      if (note.errorMessage == "Note Deleted") {
                        setState(() {
                          isDone = false;
                        });

                        Navigator.of(context).pop();
                      } else {
                        setState(() {
                          title = note.errorMessage;
                        });
                      }
                    },
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: kColor_2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          isDone
                              ? const Icon(
                                  MdiIcons.delete,
                                  color: kWhite,
                                  size: 15,
                                )
                              : const SizedBox(
                                  height: 20,
                                  child: SpinKitWave(
                                    color: kWhite,
                                    size: 15.0,
                                    itemCount: 8,
                                  ),
                                ),
                          const SizedBox(width: 5),
                          Text(
                            'Delete',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: kWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            left: kMargin * 7,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(3),
                  bottomRight: Radius.circular(3),
                ),
              ),
              child: SvgPicture.asset("assets/logoSVG.svg", color: kBlack),
            ),
          ),
        ],
      ),
    );
  }
}
