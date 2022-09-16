import 'package:beth/controllers/credentials/credentials_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth/auth_controller.dart';
import '../../../controllers/obscurity/obscurity_controller.dart';
import '../../../locale/beth_translations.dart';
import '../beth_text_form_field/beth_textformfield.dart';

class BethPasswordField extends StatelessWidget {
  /// a configured [BethTextFormField] for password connected with state-management
  ///  make sure to use the [AuthController] navigation method to ensure resetting
  ///  user data from state management

  const BethPasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ObscurityController(),
      builder: (ObscurityController _) => BethTextFormField(
        labelText: BethTranslations.password.tr,
        hintText: BethTranslations.passwordHintText.tr,
        isObscure: _.isObscure,
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: _.icon,
          splashColor: Colors.transparent,
          onPressed: _.flip,
        ),
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          value ??= '';
          return (value.contains(
            RegExp(
                r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$'),
          ))
              ? null
              : BethTranslations.passwordInvalid.tr;
        },
        onSaved: (value) =>
            Get.find<CredentialsController>().userData.password = value!,
      ),
    );
  }
}
