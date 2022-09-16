import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controllers/auth/auth_controller.dart';
import '../../../locale/beth_translations.dart';
import '../../../themes/beth_colors.dart';
import '../beth_elevated_button/beth_elevatedbutton.dart';

class AppleAuthElevatedButton extends StatelessWidget {
  const AppleAuthElevatedButton({
    /// returns a Sign-In button if [_isSignIn] is true and a Sign-Up button otherwise
    required bool isSignIn,
    Key? key,
  })  : _isSignIn = isSignIn,
        super(key: key);

  final bool _isSignIn;

  @override
  Widget build(BuildContext context) {
    return BethElevatedButton(
      onTap: _onTap,
      text: _isSignIn
          ? BethTranslations.signInWithApple.tr
          : BethTranslations.signUpWithApple.tr,
      leading: const FaIcon(
        FontAwesomeIcons.apple,
        color: BethColors.black,
      ),
    );
  }

  void _onTap() {
    Get.find<AuthController>().googleAuth();
  }
}
