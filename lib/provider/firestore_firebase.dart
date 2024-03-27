import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:async';
import 'package:get/get.dart';
import '../model/user_model.dart';
import 'storage_firebase.dart';

class FirestoreDatabase extends GetxController{
  static FirestoreDatabase helper = FirestoreDatabase._createInstance();

  CollectionReference docUser =
      FirebaseFirestore.instance.collection("Users");

  String? uid;


  FirestoreDatabase._createInstance();

  Future createuser() async{
    //final docUser = FirebaseFirestore.instance.collection("Users").doc(uid);

    UserModel user = UserModel(
      uid: uid,
      name: '',
      gender: '',
      game: '',
      platform: '',
      age: '',
      );

    final json = user.toJson();

    await docUser.doc(uid).set(json);

    if(user.path != ''){
      UploadTask task =
          StorageServer.helper.insertImage(uid!, user.path);
      TaskSnapshot taskSnapshot = await task.whenComplete(() {});
      String url = await taskSnapshot.ref.getDownloadURL();

      await docUser.doc(uid).update({
        'Path': url
      });
    }
  }

  updateUser(UserModel user) async{
      
    docUser.doc(uid)
    .update({
      'Name' : user.name,
      'Gender' : user.gender,
      'Game' : user.game,
      'Age' : user.age,
      'Platform': user.platform
    });

    if(user.path != ''){
      UploadTask task =
          StorageServer.helper.insertImage(uid!, user.path);
      TaskSnapshot taskSnapshot = await task.whenComplete(() {});
      String url = await taskSnapshot.ref.getDownloadURL();

      await docUser.doc(uid).update({
        'Path': url
      });
    }
  }

  Future getUser() async{
    final snapshot = await FirebaseFirestore.instance.collection("Users").doc(uid).get();
    UserModel user = UserModel.fromJson(snapshot);
    return user;
  }

}