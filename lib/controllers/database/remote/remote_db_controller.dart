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
  static const String _email = 'email';
  static const String _dateCreated = 'dateCreated';
  static const String _profilePicture = 'profilePicture';
  static const String _userId = 'userId';
  /* -------------------------------------------------------------------------- */

  Future<void> registerUser() async {
    try {
      final profilePicture = _credentials.userData.profilePicture;
      if (profilePicture != null) {
        await _remoteStorage.upload(
          file: profilePicture,
          childName: _profilePicture,
        );
      }

      String? uid = Get.find<AuthController>().getUserId;

      _firestore.collection(_users).doc(uid).set({
        _name: _credentials.userData.name,
        _email: _credentials.userData.email,
        _dateCreated: DateTime.now().toUtc(),
        _profilePicture: _credentials.userData.profilePictureLink,
        _userId: _credentials.userData.userId,
      });

      _log.v('user data added to firestore successfully');

      _credentials.reset();
    } on SocketException {
      BethUtils.handleSocketException(_log);
    } catch (e) {
      BethUtils.handleUnkownError(e, _log);
    }
  }

  Stream<BethUser> getCurrentUserData() {
    final uid = Get.find<AuthController>().getUserId;

    return _firestore
        .collection(_users)
        .doc(uid)
        .snapshots()
        .map(BethUser.fromDocumentSnapshot);
  }
}
