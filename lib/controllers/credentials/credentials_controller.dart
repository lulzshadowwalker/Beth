import 'package:beth/models/beth_user_credentials.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CredentialsController {
  BethUserCredential userData = BethUserCredential.empty();

  void reset() {
    userData = BethUserCredential.empty();
  }

  /* NAVIGATION --------------------------------------------------------------- */
  void getTo(Widget page, {Bindings? binding}) {
    reset();
    Get.to(page, binding: binding);
  }

  void getOffAll(Widget page, {Bindings? binding}) {
    reset();
    Get.offAll(page, binding: binding);
  }

  void getOff(Widget page, {Bindings? binding}) {
    reset();
    Get.off(page, binding: binding);
  }

  void back() {
    reset();
    Get.back();
  }
  /* -------------------------------------------------------------------------- */

}
