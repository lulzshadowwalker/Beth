import 'package:beth/models/entry_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BethSection {
  String? sectionName;
  List<EntryContent>? entryContent;

  BethSection({
    this.sectionName,
    this.entryContent,
  });

  BethSection.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> snap)
      : sectionName = snap.data()?['sectionName'],
        entryContent = snap.data()?['entryContent'];
}
