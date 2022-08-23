import 'package:beth/controllers/credentials/credentials_controller.dart';
import 'package:beth/models/beth_user_credentials.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../locale/beth_translations.dart';
import 'beth_textformfield.dart';

class BethEmailField extends StatelessWidget {
  /// a configured [BethTextFormField] for emails connected with state-management
  ///  make sure to use the [AuthController] navigation method to ensure resetting
  ///  user data from state management
  const BethEmailField({
    GlobalKey<FormFieldState>? formFieldKey,
    Key? key,
  })  : _formFieldKey = formFieldKey,
        super(key: key);

  final GlobalKey<FormFieldState>? _formFieldKey;
  @override
  Widget build(BuildContext context) {
    return BethTextFormField(
      key: _formFieldKey,
      labelText: BethTranslations.email.tr,
      hintText: 'test@example.com',
      prefixIcon: const Icon(Icons.email_rounded),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        // TODO Check for temporary emails using a third-party API
        return GetUtils.isEmail(value ?? '')
            ? null
            : BethTranslations.emailInvalid.tr;
      },
      onSaved: (value) =>
          Get.find<CredentialsController>().userData.email = value!,
    );
  }
}
