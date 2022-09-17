// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class BethPost {
  DateTime? dateCreated;
  String? description;
  String? imageUrl;
  String? postId;
  String? postedBy;
  List? likes;

  BethPost({
    this.dateCreated,
    this.description,
    this.imageUrl,
    this.postId,
    this.postedBy,
    this.likes,
  });

  BethPost.empty();

  BethPost.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    dateCreated = snapshot.data()?['dateCreated'].toDate();
    imageUrl = snapshot.data()?['imageUrl'];
    postId = snapshot.data()?['postId'];
    postedBy = snapshot.data()?['postedBy'];
    likes = snapshot.data()?['likes'];
  }
}
