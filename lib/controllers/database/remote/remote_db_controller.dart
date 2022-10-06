import 'dart:io';

import 'package:beth/controllers/credentials/credentials_controller.dart';
import 'package:beth/controllers/storage/remote_storage/remote_storage_controller.dart';
import 'package:beth/helpers/beth_utils.dart';
import 'package:beth/locale/beth_translations.dart';
import 'package:beth/models/beth_post.dart';
import 'package:beth/models/beth_section.dart';
import 'package:beth/models/entry_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../models/alert_type.dart';
import '../../../models/beth_user.dart';
import '../../auth/auth_controller.dart';

class RemoteDbController {
  final _firestore = FirebaseFirestore.instance;
  final _log = BethUtils.getLogger(_className);
  final _remoteStorage = RemoteStorageController();

  /* STRING CONSTANTS --------------------------------------------------------- */
  static const String _className = 'RemoteDbController';
  static const String _kUsers = 'users';
  static const String _kName = 'name';
  static const String _kEmail = 'email';
  static const String _kDateCreated = 'dateCreated';
  static const String _kProfilePicture = 'profilePicture';
  static const String _kUserId = 'userId';
  static const String _kBugReports = 'bugReports';
  static const String _kSubject = 'title';
  static const String _kDescription = 'description';
  static const String _kAttachment = 'attachment';
  static const String _kReportId = 'reportId';
  static const String _kReportedBy = 'reportedBy';
  static const String _kPosts = 'posts';
  static const String _kImageUrl = 'imageUrl';
  static const String _kPostedBy = 'postedBy';
  static const String _kPostId = 'postId';
  static const String _kLikes = 'likes';
  static const String _kReactionType = 'reactionType';
  static const String _kLikedBy = 'likedBy';
  /* -------------------------------------------------------------------------- */

  static String? get _uid => Get.find<AuthController>().getUserId;

  Future<void> registerUser() async {
    try {
      final credentials = Get.find<CredentialsController>();

      final profilePicture = credentials.userData.profilePicture;
      if (profilePicture != null) {
        final downloadUrl = await _remoteStorage.upload(
          file: profilePicture,
          childName: _kProfilePicture,
        );

        /// not asserting or throwing any errors because profile picture isn't
        ///  worth terminating the proecess for imo.
        if (downloadUrl != null) {
          Get.find<CredentialsController>().userData.profilePictureLink =
              downloadUrl;
        }
      }

      String? uid = Get.find<AuthController>().getUserId;

      await _firestore.collection(_kUsers).doc(uid).set({
        _kName: credentials.userData.name,
        _kEmail: credentials.userData.email,
        _kDateCreated: DateTime.now().toUtc(),
        _kProfilePicture: credentials.userData.profilePictureLink,
        _kUserId: credentials.userData.userId,
      });

      _log.v('✅ user data added to firestore');

      credentials.reset();
    } on SocketException {
      BethUtils.handleSocketException(_log);
    } catch (e) {
      BethUtils.handleUnkownError(e, _log);
    }
  }

  Stream<BethUser> getCurrentUserData() {
    return _firestore
        .collection(_kUsers)
        .doc(_uid)
        .snapshots()
        .map(BethUser.fromDocumentSnapshot);
  }

  Future<void> updateUserDisplayName(String name) async {
    try {
      await _firestore.collection(_kUsers).doc(_uid).update({_kName: name});

      _log.v('✅ updated user\'s display name');
      BethUtils.showSnackBar(
        message: BethTranslations.nameUpdatedSuccessfully.tr,
        alertType: AlertType.success,
      );
    } on SocketException {
      BethUtils.handleSocketException(_log);
    } catch (e) {
      BethUtils.handleUnkownError(e, _log);
    }
  }

  /// updates the user email in the firestore records.
  /// ..
  /// to update the user email in firebase_auth, use [AuthController.updateUserEmail] instead
  Future<void> updateUserEmail(String email) async {
    try {
      await _firestore.collection(_kUsers).doc(_uid).update({_kEmail: email});

      _log.v('✅ updated user\'s email in firestore');
    } on SocketException {
      BethUtils.handleSocketException(_log);
    } catch (e) {
      BethUtils.handleUnkownError(e, _log);
    }
  }

  Future<void> updateProfilePicture(String profilePictureLink) async {
    try {
      await _firestore
          .collection(_kUsers)
          .doc(_uid)
          .update({_kProfilePicture: profilePictureLink});

      _log.v('✅ updated user\'s profile picture');
    } on SocketException {
      BethUtils.handleSocketException(_log);
    } catch (e) {
      BethUtils.handleUnkownError(e, _log);
    }
  }

  Future<void> bugReport({
    required String subject,
    String? description,
    required String attachment,
  }) async {
    try {
      final reportId = const Uuid().v4();

      Map<String, Object?> reportInfo = {
        _kSubject: subject,
        _kDescription: description,
        _kAttachment: attachment,
        _kReportId: reportId,
        _kReportedBy: _uid,
        _kDateCreated: DateTime.now().toUtc(),
      };

      await _firestore.collection(_kUsers).doc(_uid).update({
        _kBugReports: FieldValue.arrayUnion([reportInfo])
      });
      _log.v('✅ added report info to the user\'s record');

      await _firestore.collection(_kBugReports).doc(reportId).set(reportInfo);
      _log.v('✅ added report info to the reports\'s collection');

      BethUtils.showSnackBar(
        message: BethTranslations.tyForSubmitting.tr,
        alertType: AlertType.success,
      );
    } on SocketException {
      BethUtils.handleSocketException(_log);
    } catch (e) {
      BethUtils.handleUnkownError(e, _log);
    }
  }

  Future<void> addPost({
    required String imageUrl,
    String? description,
  }) async {
    try {
      final postId = const Uuid().v4();

      Map<String, Object?> postInfo = {
        _kDescription: description,
        _kImageUrl: imageUrl,
        _kPostedBy: _uid,
        _kDateCreated: DateTime.now().toUtc(),
        _kPostId: postId,
        _kLikes: [],
      };

      await _firestore
          .collection(_kUsers)
          .doc(_uid)
          .collection(_kPosts)
          .doc(postId)
          .set({
        _kPosts: FieldValue.arrayUnion([postInfo])
      });
      _log.v('✅ added post to the user\'s record');

      await _firestore.collection(_kPosts).doc(postId).set(postInfo);
      _log.v('✅ added post to the posts collection');

      BethUtils.showSnackBar(
        message: BethTranslations.postAddedSuccessfully.tr,
        alertType: AlertType.success,
      );
    } on SocketException {
      BethUtils.handleSocketException(_log);
    } catch (e) {
      BethUtils.handleUnkownError(e, _log);
    }
  }

  Stream<List<BethPost>> get fetchPosts =>
      _firestore.collection(_kPosts).snapshots().map((querySnapshot) {
        List<BethPost> postsList = [];
        for (var e in querySnapshot.docs) {
          postsList.add(BethPost.fromDocumentSnapshot(e));
        }
        return postsList;
      });

  Future<void> reactToPost({
    required BethPost data,
    required String reactionType,
  }) async {
    try {
      final uid = Get.find<AuthController>().getUserId;

      /// prevent the user from reacting to the same post more than once
      for (Map e in data.likes!) {
        if (e['likedBy'] == uid) return;
      }

      Map<String, Object?> likeInfo = {
        _kReactionType: reactionType,
        _kLikedBy: _uid,
        _kDateCreated: DateTime.now().toUtc(),
      };

      await _firestore.collection(_kPosts).doc(data.postId).update({
        _kLikes: FieldValue.arrayUnion([likeInfo])
      });
      _log.v('✅ added reaction to the post at the posts collection');

      await _firestore
          .collection(_kUsers)
          .doc(data.postedBy)
          .collection(_kPosts)
          .doc(data.postId)
          .update({
        _kLikes: FieldValue.arrayUnion([likeInfo])
      });
      _log.v(
          '✅ added reaction to the post at the post owner\'s posts sub-collection');
    } on SocketException {
      BethUtils.handleSocketException(_log);
    } catch (e) {
      BethUtils.handleUnkownError(e, _log);
    }
  }

  /// fetches all the data needed for the Discover section depending on the
  ///  current locale
  Future<List<BethSection>?> get fetchDiscover async {
    try {
      List<BethSection> sections = [];

      final String? langCode = BethTranslations.currentLanguageCode;
      final String collection = '${langCode}Discover';

      List<String> sectionIds = [];

      await _firestore.collection(collection).get().then((querySnap) {
        for (var doc in querySnap.docs) {
          sectionIds.add(doc.id);
        }
      });

      for (var docId in sectionIds) {
        final section = BethSection(sectionName: docId);
        List<EntryContent> content = [];

        await _firestore
            .collection(collection)
            .doc(docId)
            .collection('content')
            .get()
            .then((querySnap) {
          for (var doc in querySnap.docs) {
            content.add(EntryContent.fromDocumentSnapshot(doc));
          }
        });

        section.entryContent = content;

        sections.add(section);
      }

      _log.v('✅ fetched Discover data');
      return sections;
    } on SocketException {
      BethUtils.handleSocketException(_log);
      return null;
    } catch (e) {
      BethUtils.handleUnkownError(e, _log);
      return null;
    }
  }
}
