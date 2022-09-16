import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../locale/beth_translations.dart';
import '../beth_text_form_field/beth_textformfield.dart';

class BethNameField extends StatelessWidget {
  const BethNameField({
    void Function(String?)? onSaved,
    TextEditingController? controller,
    Key? key,
  })  : _onSaved = onSaved,
        _controller = controller,
        super(key: key);

  final void Function(String?)? _onSaved;
  final TextEditingController? _controller;

  @override
  Widget build(BuildContext context) {
    return BethTextFormField(
      controller: _controller,
      labelText: BethTranslations.name.tr,
      hintText: 'display name',
      prefixIcon: const Icon(Icons.person),
      keyboardType: TextInputType.name,
      validator: (value) {
        return GetUtils.isLengthBetween(value ?? '', 3, 16)
            ? null
            : BethTranslations.nameInvalid.tr;
      },
      onSaved: _onSaved,
    );
  }
}
