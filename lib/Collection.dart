import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notekeeper/Model.dart';
import 'package:http/http.dart';
class Helper {
  static Helper instance = Helper();
  CollectionReference note = FirebaseFirestore.instance.collection('Notes');

  insertData(NoteData noteData) async {
    return note
        .add(noteData.toMap())
        .then((value) => print("Note Added.."))
        .catchError((error) => print("Failed to add Note: $error"));
  }

  updateData({required int index, required NoteData noteData}) async {
    var docSnap = await note.get();
    var doc_id = docSnap.docs;
    return note
        .doc(doc_id[index].id)
        .update(noteData.toMap())
        .then((value) => print("note Updated.."))
        .catchError((error) => print("Failed to update note: $error"));
  }

  deleteData({required int index}) async {
    var docSnap = await note.get();
    var doc_id = docSnap.docs;
    return note
        .doc(doc_id[index].id)
        .delete()
        .then((value) => print("note Deleted.."))
        .catchError((error) => print("Failed to delete note: $error"));
  }
}
