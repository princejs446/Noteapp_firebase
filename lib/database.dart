

import 'package:cloud_firestore/cloud_firestore.dart';

class Database{

  static Future addNoteappDetails(Map<String,dynamic> notepadInfoMap,String id) async {
    return await FirebaseFirestore.instance.collection("Noteapp").doc(id).set(notepadInfoMap);

  }
   static Future<Stream<QuerySnapshot>> getNoteappDetails() async{
  return await FirebaseFirestore.instance.collection("Noteapp").snapshots();
}
static Future deleteNoteappDetails(String id) async{
  return await FirebaseFirestore.instance.collection("Noteapp").doc(id).delete();
}

static Future updateNoteappDetails(String id,Map<String,dynamic> updateInfo) async{
  return await FirebaseFirestore.instance.collection("Noteapp").doc(id).update(updateInfo);
}
}