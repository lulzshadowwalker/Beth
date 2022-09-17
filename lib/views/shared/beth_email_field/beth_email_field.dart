import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth/auth_controller.dart';
import '../../../locale/beth_translations.dart';
import '../beth_text_form_field/beth_textformfield.dart';

class BethEmailField extends StatelessWidget {
  /// a configured [BethTextFormField] for emails connected with state-management
  ///  make sure to use the [AuthController] navigation method to ensure resetting
  ///  user data from state management
  const BethEmailField({
    GlobalKey<FormFieldState>? formFieldKey,
    void Function(String?)? onSaved,
    TextEditingController? controller,
    Key? key,
  })  : _formFieldKey = formFieldKey,
        _onSaved = onSaved,
        _controller = controller,
        super(key: key);

  final GlobalKey<FormFieldState>? _formFieldKey;
  final void Function(String?)? _onSaved;
  final TextEditingController? _controller;

  @override
  Widget build(BuildContext context) {
    return BethTextFormField(
      controller: _controller,
      key: _formFieldKey,
      labelText: BethTranslations.email.tr,
      hintText: 'test@example.com',
      prefixIcon: const Icon(Icons.email_rounded),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        value ??= '';
        return GetUtils.isEmail(value)
            ? null
            : BethTranslations.emailInvalid.tr;
      },
      onSaved: _onSaved,
    );
  }
}
