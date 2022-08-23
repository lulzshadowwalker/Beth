import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey get formKey => _formKey;

  bool validate() =>
      (_formKey.currentState != null && _formKey.currentState!.validate());
}
