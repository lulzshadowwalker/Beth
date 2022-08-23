import 'package:beth/models/beth_user_credentials.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CredentialsController {
  BethUserCredential userData = BethUserCredential.empty();

  void reset() {
    userData = BethUserCredential.empty();
  }

  /* NAVIGATION --------------------------------------------------------------- */
  void getTo(Widget page) {
    reset();
    Get.to(page);
  }

  void getOffAll(Widget page) {
    reset();
    Get.offAll(page);
  }

  void getOff(Widget page) {
    reset();
    Get.off(page);
  }

  void back() {
    reset();
    Get.back();
  }
  /* -------------------------------------------------------------------------- */

}
