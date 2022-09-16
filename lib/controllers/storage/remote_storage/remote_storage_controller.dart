import 'dart:io';
import 'dart:typed_data';

import 'package:beth/helpers/beth_utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../auth/auth_controller.dart';

class RemoteStorageController {
  /* STRING CONSTANTS --------------------------------------------------------- */
  static const String _className = "RemoteStorageController";
  /* -------------------------------------------------------------------------- */
  final _firebaseStorage = FirebaseStorage.instance;
  final _log = BethUtils.getLogger(_className);

  Future<String?> upload({
    required Uint8List file,
    required String childName,
  }) async {
    try {
      // if [userId] is null then abort
      final String userId = Get.find<AuthController>().getUserId!;

      final String fileId = const Uuid().v4();

      Reference reference =
          _firebaseStorage.ref().child(userId).child(childName).child(fileId);

      TaskSnapshot snapshot = await reference.putData(file);

      final String downloadUrl = await snapshot.ref.getDownloadURL();

      _log.v('file uploaded successfully');

      return downloadUrl;
    } on SocketException {
      BethUtils.handleSocketException(_log);
    } catch (e) {
      BethUtils.handleUnkownError(e, _log);
    }
    return null;
  }
}
