import 'dart:typed_data';
import 'package:brainhive/Models/posts.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'storage_methods.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  get res => 'some error occurred';

  get username => null;

  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String username,
    String profImage,
  ) async {
    String res = "Some error occured";
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);
      String postId = const Uuid().v1();
      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        likes: [],
        postId: postId,
        profImage: profImage,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
      );

      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "Success";
    } catch (res) {
      return res.toString();
    }
    return res.toString();
  }
}
