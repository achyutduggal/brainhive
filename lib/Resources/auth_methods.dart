import 'dart:io' as File;
import 'package:brainhive/Resources/storage_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:brainhive/Models/user.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User? currentUser = _auth.currentUser;

    DocumentSnapshot snap = await _firestore.collection('users').doc(currentUser?.uid).get();

    return model.User.fromSnap(snap);
  }


  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required Uint8List file,
    int points = 100,
  }) async {
    String res = "Some Error Occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);


        print(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        model.User user = model.User(email: email, uid: cred.user!.uid, photoUrl: photoUrl, username: username, points: points);


        _firestore.collection('users').doc(cred.user!.uid).set(user.toJson(),);

        // _firestore.collection('users').doc(cred.user!.uid).set({
        //   'username': username,
        //   'uid': cred.user!.uid,
        //   'email': email,
        //   'file': file,
        //   'photoUrl': photoUrl,
        // });

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser({
  required String email,
    required String password,
})
  async{
    String res = "Some error occured";

    try{
      if(email.isNotEmpty||password.isNotEmpty){
       await _auth.signInWithEmailAndPassword(email: email, password: password);
       res = "success";
      }
    }catch(err){
      res.toString();
    }
    return res;
  }
}
