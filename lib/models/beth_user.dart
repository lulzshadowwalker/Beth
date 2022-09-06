import 'package:cloud_firestore/cloud_firestore.dart';

class BethUser {
  String? name;
  String? profilePicture;
  String? email;
  String? userId;
  DateTime? dateCreated;
  List? comments;

  BethUser({
    this.name,
    this.profilePicture,
    this.email,
    this.userId,
    this.dateCreated,
    this.comments,
  });

  BethUser.empty();

  BethUser.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    name = snapshot['name'];
    profilePicture = snapshot['profilePicture'];
    email = snapshot['email'];
    userId = snapshot['userId'];
    dateCreated = snapshot['dateCreated'];
    comments = snapshot['comments'];
  }
}
