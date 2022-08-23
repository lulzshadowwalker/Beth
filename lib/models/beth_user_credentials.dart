import 'dart:typed_data';

import '../helpers/beth_const.dart';

class BethUserCredential {
  /// for state-management purposes
  String? name;
  String? userId;
  String email;
  String password;
  Uint8List? profilePicture;
  String? profilePictureLink;

  BethUserCredential.empty()

      /// setting them to empty strings to avoid null checking when passing as args
      : email = '',
        password = '';

  BethUserCredential.fromOAuth(Map<String, dynamic> profile)
      : email = profile[BethConst.gEmail],
        password = '',
        name = profile[BethConst.gName],
        profilePicture = profile[BethConst.gProfilePicture],
        userId = profile[BethConst.gUserId];
}
