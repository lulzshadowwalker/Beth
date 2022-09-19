import 'package:beth/controllers/credentials/credentials_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controllers/auth/auth_controller.dart';
import '../../../locale/beth_translations.dart';
import '../../../themes/beth_colors.dart';
import '../../beth_home/components/beth_home_components.dart';
import '../beth_elevated_button/beth_elevatedbutton.dart';

class GoogleAuthElevatedButton extends StatelessWidget {
  const GoogleAuthElevatedButton({
    /// returns a Sign-In button if [_isSignIn] is true and a Sign-Up button otherwise
    required bool isSignIn,
    Key? key,
  })  : _isSignIn = isSignIn,
        super(key: key);

  final bool _isSignIn;

  @override
  Widget build(BuildContext context) {
    return BethElevatedButton(
      borderless: false,
      onTap: _onTap,
      text: _isSignIn
          ? BethTranslations.signInWithGoogle.tr
          : BethTranslations.signUpWithGoogle.tr,
      leading: const FaIcon(
        FontAwesomeIcons.google,
        color: BethColors.black,
      ),
    );
  }

  void _onTap() async {
    await Get.find<AuthController>().googleAuth();
    Get.find<CredentialsController>().getOffAll(const BethHome());
  }
}
