import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class User {
  final String username;
  final String uid;
  final String email;
  final String photoUrl;
  final int points;

  User(
      {required this.email,
      required this.uid,
      required this.photoUrl,
      required this.username,
      required this.points});

  Map<String, dynamic> toJson() =>{
    "username": username,
    "uid": uid,
    "email":email,
    "photoUrl":photoUrl,
    "points":points,
  };

  static User fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    
    return User(email: snapshot['email'], uid: snapshot['uid'], photoUrl: snapshot['photoUrl'], username: snapshot['username'], points: snapshot['points']);

  }

}
