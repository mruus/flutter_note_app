import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_note_app/models/notes.dart';

class NoteStore {
  late String uid;
  late String title;
  late String description;
  String errorMessage = '';

  // Create Note Table
  CollectionReference notes = FirebaseFirestore.instance.collection('notes');
  // NoteStore(this.firestore);

  Future<void> newNote() {
    return notes
        .add({'UserID': uid, 'Title': title, 'Description': description})
        .then((value) => errorMessage = "Note Added")
        .catchError((error) => errorMessage = "Catch Error");
  }

  List<Note> noteList(QuerySnapshot snapshot) {
    return snapshot.docs.map((data) {
      return Note(data["Title"] ?? '', data["Description"] ?? '');
    }).toList();
  }

  Stream<List<Note>> get getNotes {
    return notes
        .where('UserID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map(noteList);
  }
}
