import 'dart:io';

import 'package:beth/controllers/credentials/credentials_controller.dart';
import 'package:beth/controllers/storage/remote_storage/remote_storage_controller.dart';
import 'package:beth/helpers/beth_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../models/beth_user.dart';
import '../../auth/auth_controller.dart';

class RemoteDbController {
  final _firestore = FirebaseFirestore.instance;
  final _log = BethUtils.getLogger(_className);
  final _credentials = Get.find<CredentialsController>();
  final _remoteStorage = RemoteStorageController();

  /* STRING CONSTANTS --------------------------------------------------------- */
  static const String _className = 'RemoteDbController';
  static const String _users = 'users';
  static const String _name = 'name';
  static const String _email = '_email';
  static const String _dateCreated = 'dateCreated';
  static const String _profilePicture = 'profilePicture';
  static const String _userId = 'userId';
  /* -------------------------------------------------------------------------- */

  Future<void> registerUser() async {
    try {
      final profilePicture = _credentials.userData.profilePicture;
      if (profilePicture != null) {
        _remoteStorage.upload(file: profilePicture, childName: _profilePicture);
      }

      _firestore.collection(_users).add({
        _name: _credentials.userData.name,
        _email: _credentials.userData.email,
        _dateCreated: DateTime.now().toUtc(),
        _profilePicture: _credentials.userData.profilePicture,
        _userId: _credentials.userData.userId,
      });

      _credentials.reset();

      _log.v('user data added to firestore successfully');
    } on SocketException {
      BethUtils.handleSocketException(_log);
    } catch (e) {
      BethUtils.handleUnkownError(e, _log);
    }
  }

  Stream<BethUser> getCurrentUserData() {
    String? userId = Get.find<AuthController>().getUserId;

    return _firestore
        .collection(_users)
        .doc(userId)
        .snapshots()
        .map(BethUser.fromDocumentSnapshot);
  }
}
