import 'dart:io';

import 'package:beth/controllers/auth/bindings/auth_binding.dart';
import 'package:beth/controllers/credentials/credentials_controller.dart';
import 'package:beth/controllers/database/remote/remote_db_controller.dart';
import 'package:beth/helpers/beth_utils.dart';
import 'package:beth/locale/beth_translations.dart';
import 'package:beth/models/alert_type.dart';
import 'package:beth/models/beth_user_credentials.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

import '../../views/auth/sign_in/components/sign_in_components.dart';
import '../../views/beth_home/components/beth_home_components.dart';
import '../current_user/current_user_controller.dart';

class AuthController extends GetxController {
  /// Authentication Controller
  final Logger _log = BethUtils.getLogger(_className);

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  final _remoteDb = RemoteDbController();
  final _credentials = Get.put(CredentialsController());

  /* STRING CONSTANTS --------------------------------------------------------- */
  static const String _className = 'AuthController';
  /* -------------------------------------------------------------------------- */

  String? get getUserId => _auth.currentUser?.uid;
  User? get _user => _auth.currentUser;

  final _firebaseUser = Rx<User?>(_auth.currentUser);

  @override
  void onInit() {
    /// [onReady] happens one frame after allocating the object in the memory aka [onInit]
    super.onInit();

    /// Wrapper
    _firebaseUser.bindStream(_auth.authStateChanges());

    /// Show suitable screen depending on the auth status
    ever(_firebaseUser, _setScreen);

    Get.put(CredentialsController());
  }

  /// auth/home screen depending on auth state
  ///  ..
  ///  function callback in the [ever] worker or event
  _setScreen(User? currentUser) {
    currentUser == null
        ? Get.offAll(const SignIn(), binding: AuthBinding())
        : {
            Get.put(() => CurrentUserController(), permanent: true),
            Get.offAll(const BethHome())
          };
  }

  /* GUEST -------------------------------------------------------------------- */
  Future<void> guestSignIn() async {
    try {
      await _auth.signInAnonymously();
      _log.v('✅ Signed-in anonymously');
    } on SocketException {
      BethUtils.handleSocketException(_log);
    } catch (e) {
      BethUtils.handleUnkownError(e, _log);
    }
  }

  /* -------------------------------------------------------------------------- */
  /* EMAIL AND PASSWORD ------------------------------------------------------- */
  Future<void> signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _credentials.userData.email,
          password: _credentials.userData.password);
      _log.v('✅ Signed-in with email and password');
    } on SocketException {
      BethUtils.handleSocketException(_log);
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthException(e);
    } catch (e) {
      BethUtils.handleUnkownError(e, _log);
    }
  }

  Future<void> signUpWithEmailAndPassword() async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: _credentials.userData.email,
        password: _credentials.userData.password,
      );

      final String? uid = userCredential.user?.uid;
      _credentials.userData.userId = uid;
      await _remoteDb.registerUser();

      _log.v('✅ Signed-up with email and password');
    } on SocketException {
      BethUtils.handleSocketException(_log);
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthException(e);
    } catch (e) {
      BethUtils.handleUnkownError(e, _log);
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      _log.v('✅ Signed-out');
    } on SocketException {
      BethUtils.handleSocketException(_log);
    } catch (e) {
      BethUtils.handleUnkownError(e, _log);
    }
  }

  Future<void> updateEmail(String email) async {
    try {
      await _user!.updateEmail(email);

      await _remoteDb.updateUserEmail(email);
      _log.v('✅ updated user\'s email');
      BethUtils.showSnackBar(
        message: BethTranslations.emailUpdatedSuccessfully.tr,
        alertType: AlertType.success,
      );
    } on SocketException {
      BethUtils.handleSocketException(_log);
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthException(e);
    } catch (e) {
      BethUtils.handleUnkownError(e, _log);
    }
  }
  /* -------------------------------------------------------------------------- */

  Future<void> sendPasswordResetEmail() async {
    try {
      await _auth.sendPasswordResetEmail(email: _credentials.userData.email);

      _log.v('✅ ${BethTranslations.passwordResetEmail}');
      BethUtils.showSnackBar(
        message: BethTranslations.passwordResetEmail.tr,
        alertType: AlertType.success,
      );
    } on SocketException {
      BethUtils.handleSocketException(_log);
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthException(e);
    } catch (e) {
      BethUtils.handleUnkownError(e, _log);
    }
  }

  /* OUTH --------------------------------------------------------------------- */
  Future<void> googleAuth() async {
    try {
      final googleSignIn = GoogleSignIn(scopes: [
        'profile',
      ]);

      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        /// not throwing an exception not to show the user an unnecessary error message
        _log.e('❌ Process terminated by the user');
        return;
      }

      _log.v('📤 Google auth process initiated');

      final googleAuth = await googleUser.authentication;
      _log.v('✅ Obtained user details via Google auth');

      final ouathCredential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      final userCredential = await _auth.signInWithCredential(ouathCredential);
      _log.v('✅ Signed-in with Google auth');

      _credentials.userData = BethUserCredential.fromOAuth(
        userCredential.additionalUserInfo!.profile!,
      );

      await _remoteDb.registerUser();
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthException(e);
    } on SocketException {
      BethUtils.handleSocketException(_log);
    } catch (e) {
      BethUtils.handleUnkownError(e, _log);
    }
  }

  Future<void> appleAuth() async {
    // TODO implement [appleAuth]. Needs an Apple developer account.
    throw UnimplementedError('Apple auth has not been implemnted');
  }
  /* -------------------------------------------------------------------------- */

  /* HELPERS ------------------------------------------------------------------ */
  void _handleFirebaseAuthException(FirebaseAuthException e) {
    _log.e('❌ ${e.message}');

    BethUtils.showSnackBar(
      message: e.code.tr,
      alertType: AlertType.error,
    );
  }
  /* -------------------------------------------------------------------------- */
}
