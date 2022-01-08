import 'package:cloud_firestore/cloud_firestore.dart';

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
}
