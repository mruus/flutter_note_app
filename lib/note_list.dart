import 'package:flutter/material.dart';
import 'package:flutter_note_app/models/notes.dart';
import 'package:flutter_note_app/widgets.dart';
import 'package:provider/provider.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    final notesList = context.watch<List<Note>>();

    // for (var note in notesList) {
    //   print(note.description);
    //   print(note.title);
    // }

    return Column(
      children: [
        if (notesList.isNotEmpty)
          for (var i = 0; i < notesList.length; i++)
            CardNote(title: notesList[i].title, id: notesList[i].id , description: notesList[i].description),
        if (notesList.isEmpty) const Text("Empty Note"),
      ],
    );
  }
}
