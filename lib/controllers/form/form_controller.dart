import 'package:flutter/cupertino.dart';

class FormController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey get formKey => _formKey;

  bool validate() =>
      (_formKey.currentState != null && _formKey.currentState!.validate());
}
