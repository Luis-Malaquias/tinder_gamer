import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageServer {
  static StorageServer helper = StorageServer._createInstance();

  StorageServer._createInstance();

  Reference noteImage = FirebaseStorage.instance.ref().child("Images");

  UploadTask insertImage(String uid, String path) {
    Reference ref = noteImage.child(uid).child("$uid.jpg");
    return ref.putFile(File(path));
  }

  deleteImage(String uid, String noteId) {
    noteImage.child(uid).child("$noteId.jpg").delete();
  }
}