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

  BethUser.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    name = snapshot.data()?['name'];
    profilePicture = snapshot.data()?['profilePicture'];
    email = snapshot.data()?['email'];
    userId = snapshot.data()?['userId'];
    dateCreated = snapshot.data()?['dateCreated'].toDate();
    comments = snapshot.data()?['comments'];
  }
}
