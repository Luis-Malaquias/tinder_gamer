import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  final String? uid;
  String name;
  String gender;
  String game;
  String age;
  String path;
  String platform;

  UserModel({this.uid,
    required this.name,
    required this.gender,
    required this.game,
    required this.age,
    required this.platform,
    this.path = ''
  });

  Map<String, dynamic> toJson()=> {
      'Name' : name,
      'Gender' : gender,
      'Game' : game,
      'Age' : age,
      'Path' : path,
      'Platform': platform
  };

  factory UserModel.fromJson(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      uid: document.id,
      name: data['Name'], 
      gender: data['Gender'], 
      game: data['Game'], 
      age: data['Age'],
      platform: data['Platform'],
      path: data['Path'],

    );
  }
}